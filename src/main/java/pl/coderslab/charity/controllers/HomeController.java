package pl.coderslab.charity.controllers;

import net.objecthunter.exp4j.ExpressionBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.entities.ResetPassword;
import pl.coderslab.charity.entities.User;
import pl.coderslab.charity.services.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;
    private final EmailService emailService;
    private final ResetPasswordService resetPasswordService;

    public HomeController(InstitutionService institutionService, DonationService donationService, UserService userService,
                          EmailService emailService, ResetPasswordService resetPasswordService
    ) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
        this.emailService = emailService;
        this.resetPasswordService = resetPasswordService;
    }

    @GetMapping("/")
    public String homeAction(HttpServletRequest request){
        request.setAttribute("institutions", institutionService.getAllInstitutionsWithStatusEnabledTrue());
        request.setAttribute("numberOfDonatedBags", donationService.countNumberOfDonatedBags());
        request.setAttribute("numberOfDonations", donationService.countNumberOfDonations());
        return "index";
    }

    @GetMapping("/forgot-password")
    public String forgotPasswordGet(){
        return "login/login-forgot-password";
    }

    @PostMapping("/forgot-password")
    public String forgotPasswordPost(@RequestParam String email, @RequestParam Integer a, @RequestParam Integer b,
                                     @RequestParam String operator, @RequestParam Integer result
    ){
        int correctResult = (int) new ExpressionBuilder(a + operator + b).build().evaluate();
        if (correctResult != result){
            return "redirect:/forgot-password?reset=invalidResult";
        }
        User user = userService.findByEmail(email);
        if (user == null){
            return "redirect:/forgot-password?reset=invalidEmail";
        }
        String[] subjectAndText = userService.processResetPasswordEmailMessage(user);
        emailService.sendEmail(user.getEmail(), subjectAndText[1], subjectAndText[0]);
        return "redirect:/forgot-password?reset=emailSent";
    }

    @GetMapping("/emergency-password-reset")
    public String emergencyPasswordResetGet(@RequestParam String data, Model model){
        ResetPassword resetPassword = resetPasswordService.findFirstByHashedUserEmail(data);
        if (resetPassword == null || resetPassword.getId() == 0){
            return "redirect:/login?error=linkExpired";
        }
        User user = userService.findFirstById(resetPassword.getUser().getId());
        resetPasswordService.deleteResetPasswordById(resetPassword.getId());
        user.setPassword("");
        model.addAttribute("userEmergency", user);
        return "login/emergency-password-reset";
    }

    @PostMapping("/emergency-password-reset")
    public String emergencyPasswordResetPost(@ModelAttribute("userEmergency") @Valid User userEmergency,
                                             BindingResult result, @RequestParam String confirmPassword
    ){
        if(result.hasErrors()){
            return "login/emergency-password-reset";
        }
        if (userEmergency.getPassword().equals(confirmPassword)) {
            userService.saveUser(userEmergency);
            return "redirect:/login?passwordChange=success";
        }
        result.addError(new FieldError(
                "newUser",
                "password",
                "Wprowadzone hasła nie mogą się różnić"

        ));
        return "login/emergency-password-reset";
    }



}

