package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.entities.User;
import pl.coderslab.charity.services.UserService;

import javax.validation.Valid;

@Controller
public class RegistrationController {

    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/registration")
    public String registrationGet(Model model){
        model.addAttribute("newUser", new User());
        return "registration/registration";
    }

    @PostMapping("/registration")
    public String registrationPost(@ModelAttribute("newUser") @Valid User newUser, BindingResult result,
                                   @RequestParam String confirmPassword
    ) {
        if(result.hasErrors()){
            return "registration/registration";
        }
        if (userService.isEmailAvailable(newUser.getEmail())){
            if (newUser.getPassword().equals(confirmPassword)) {
                userService.saveUser(newUser);
                return "redirect:/login?registration=success";
            }
            result.addError(new FieldError(
                    "newUser",
                    "password",
                    "Wprowadzone hasła nie mogą się różnić"
            ));
            return "registration/registration";
        }
        result.addError(new FieldError(
                "newUser",
                "email",
                "Adres e-mail jest już zajęty."
        ));
        return "registration/registration";
    }

}
