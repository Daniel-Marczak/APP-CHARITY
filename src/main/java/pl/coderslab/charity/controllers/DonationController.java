package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entities.Donation;
import pl.coderslab.charity.entities.User;
import pl.coderslab.charity.services.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDate;

@RequestMapping("/donation")
@Controller
public class DonationController {

    private final DonationService donationService;
    private final CategoryService categoryService;
    private final InstitutionService institutionService;
    private final UserService userService;
    private final DonationStatusService donationStatusService;
    private final EmailService emailService;


    public DonationController(DonationService donationService, CategoryService categoryService,
                              InstitutionService institutionService, UserService userService,
                              DonationStatusService donationStatusService, EmailService emailService
    ) {
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
        this.userService = userService;
        this.donationStatusService = donationStatusService;
        this.emailService = emailService;
    }

    @GetMapping("/form")
    public String donationGet(Model model, HttpServletRequest request){
        model.addAttribute("newDonation", new Donation());
        request.setAttribute("categories", categoryService.getAllCategories());
        request.setAttribute("institutions",institutionService.getAllInstitutionsWithStatusEnabledTrue());
        return "donation/form";
    }

    @PostMapping("/form")
    public String donationPost(@ModelAttribute("newDonation") @Valid Donation newDonation, BindingResult result,
                               HttpSession session
    ){
        User user = (User) session.getAttribute("user");
        newDonation.setUser(user);
        newDonation.setStatus(donationStatusService.findById(1L));
        newDonation.setCreated(LocalDate.now());
        if(result.hasErrors()){
            return "donation/form";
        }
        donationService.saveDonation(newDonation);
        String[] subjectAndText = donationService.processDonationEmailDetailsText(newDonation);
        try {
            emailService.sendEmail(user.getEmail(),subjectAndText[1],subjectAndText[0]);
        }catch (Exception e){
            return "redirect:/donation/donation-form-confirmation?info=emailNotSent";
        }
        return "redirect:/donation/donation-form-confirmation";

    }

    @GetMapping("/donation-form-confirmation")
    public String donationFormConfirmation(){
        return "donation/form-confirmation";
    }

    @GetMapping("/update-status/{userId}/{donationId}/{statusId}")
    public String updateDonationStatus(@PathVariable Long userId, @PathVariable Long donationId, @PathVariable Long statusId,
                                       @RequestParam(value = "admin", required=false, defaultValue = "110111") Integer admin,
                                       HttpSession session
    ){
        if(userService.checkIfUserIsAdmin(userId) ||
                donationService.checkIfDonationWithStatusAwaitingPickupBelongsToUser(userId,donationId)
        ){
            Donation donation = donationService.findFirstById(donationId);
            donation.setCollected(LocalDate.now());
            donation.setStatus(donationStatusService.findById(statusId));
            donationService.saveDonation(donation);
            if(statusId == 2){
                if(admin == 121101115){ return "redirect:/admin/donations?updateStatus=2"; }
                return "redirect:/user/main?updateStatus=2";
            }
            if (statusId == 3){
                if(admin == 121101115){ return "redirect:/admin/donations?updateStatus=3"; }
                return "redirect:/user/main?updateStatus=3";
            }
        }
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/edit/{userId}/{donationId}")
    public String donationEditGet(@PathVariable Long userId, @PathVariable Long donationId, Model model,
                                  HttpServletRequest request
    ){
        if (userService.checkIfUserIsAdmin(userId) ||
                donationService.checkIfDonationWithStatusAwaitingPickupBelongsToUser(userId,donationId)
        ){
            model.addAttribute("editDonation", donationService.findFirstById(donationId));
            request.setAttribute("categories", categoryService.getAllCategories());
            request.setAttribute("institutions",institutionService.getAllInstitutionsWithStatusEnabledTrue());
            return "donation/form-donation-edit";
        }
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login";
    }


    @PostMapping("/edit")
    public String donationEditPost(@ModelAttribute("editDonation") @Valid Donation editDonation, BindingResult result,
                                   @RequestParam(value = "admin", required=false, defaultValue = "110111") Integer admin
    ){
        editDonation.setStatus(donationStatusService.findById(1L));
        editDonation.setEdited(LocalDate.now());
        if(result.hasErrors()){
            return "donation/form-donation-edit";
        }
        donationService.saveDonation(editDonation);
        if(admin == 121101115){
            return "redirect:/admin/donations?edit=successful";
        }
        return "redirect:/user/main?edit=successful";
    }

    @GetMapping("/archive/{userId}/{donationId}")
    public String donationArchiveGet(@PathVariable Long userId, @PathVariable Long donationId, HttpSession session,
                                     @RequestParam(value = "admin", required=false, defaultValue = "110111") Integer admin
    ){
        if (donationService.checkIfDonationWithStatusClosedOrCanceledBelongsToUser(userId,donationId) ||
                userService.checkIfUserIsAdmin(userId)
        ){
            donationService.updateDonationArchivedToTrue(donationId);
            if(admin == 121101115){
                return "redirect:/admin/donations?updateStatus=4";
            }
            return "redirect:/user/main?updateStatus=4";
        }
        session.invalidate();
        return "redirect:/login";
    }

}
