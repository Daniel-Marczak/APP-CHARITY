package pl.coderslab.charity.controllers;

import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entities.Role;
import pl.coderslab.charity.entities.User;
import pl.coderslab.charity.services.ContactFormMessageService;
import pl.coderslab.charity.services.DonationService;
import pl.coderslab.charity.services.InstitutionService;
import pl.coderslab.charity.services.UserService;

import javax.servlet.http.HttpSession;

@RestController()
@RequestMapping("/api/charity")
public class CharityApiController {

    private final UserService userService;
    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final ContactFormMessageService contactFormMessageService;

    public CharityApiController(UserService userService, InstitutionService institutionService,
                                DonationService donationService, ContactFormMessageService contactFormMessageService
    ) {
        this.userService = userService;
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.contactFormMessageService = contactFormMessageService;
    }

    @GetMapping("/isEmailAvailable")
    public boolean userEmailIsAvailable(@RequestParam String email){
        return userService.isEmailAvailable(email);
    }

    @GetMapping("/emailBelongsToUserOrIsAvailable")
    public boolean userEmailBelongsToUserOrIsAvailable(@RequestParam String email, HttpSession session){
        User user = (User) session.getAttribute("user");
        return userService.findByEmail(user.getEmail()).getEmail().equals(email) || userService.isEmailAvailable(email);
    }

    @Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
    @GetMapping("/institutionNameIsAvailable")
    public boolean institutionNameIsAvailable(@RequestParam String institutionName){
        return institutionService.checkIfInstitutionNameIsAvailable(institutionName);
    }

    @Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
    @GetMapping("/institutionNameIsAvailableOrBelongsToEditInstitution")
    public boolean institutionNameIsAvailableOrBelongs(@RequestParam String institutionName,
                                                       @RequestParam String editInstitutionName
    ){
        return institutionName.equals(editInstitutionName) ||
                institutionService.checkIfInstitutionNameIsAvailable(institutionName);
    }

    @Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
    @GetMapping("/countInstitutionsByStatus")
    public int[] countInstitutionsByStatus(){
        int[] institutionsCount = new int[2];
        institutionsCount[0] = institutionService.countAllByEnabledEquals(true);
        institutionsCount[1] = institutionService.countAllByEnabledEquals(false);
        return institutionsCount;
    }

    @Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
    @GetMapping("/countDonationsByStatus")
    public int[] countDonationsByStatus(){
        int[] donationsCount = new int[5];
        donationsCount[0] = donationService.adminCountNumberOfDonationsByStatus(1L);
        donationsCount[1] = donationService.adminCountNumberOfDonationsByStatus(2L);
        donationsCount[2] = donationService.adminCountNumberOfDonationsByStatus(3L);
        donationsCount[3] = donationService.adminCountNumberOfDonationsUnarchived();
        donationsCount[4] = donationService.adminCountNumberOfDonationsArchived();
        return donationsCount;
    }

    @Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
    @GetMapping("/countUsersByEnabled")
    public int[] countUsersByEnabled(){
        int[] userCount = new int[2];
        Role role = new Role();
        role.setId(2);
        role.setName("ROLE_USER");
        userCount[0] = userService.countAllByEnabledEqualsAndRolesContains(true,role);
        userCount[1] = userService.countAllByEnabledEqualsAndRolesContains(false,role);
        return userCount;
    }

    @Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
    @GetMapping("/countAdminsByEnabled")
    public int[] countAdminsByEnabled(){
        int[] userCount = new int[2];
        Role role = new Role();
        role.setId(1);
        role.setName("ROLE_ADMIN");
        userCount[0] = userService.countAllByEnabledEqualsAndRolesContains(true,role);
        userCount[1] = userService.countAllByEnabledEqualsAndRolesContains(false,role);
        return userCount;
    }

    @Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
    @GetMapping("/countMessagesByStatus")
    public int[] countMessagesByStatus(){
        int[] messagesCount = new int[3];
        messagesCount[0] = contactFormMessageService.countAllByIsReadAndIsArchived(false, false);
        messagesCount[1] = contactFormMessageService.countAllByIsReadAndIsArchived(true, false);
        messagesCount[2] = contactFormMessageService.countAllByIsArchivedEquals(true);
        return messagesCount;
    }


}
