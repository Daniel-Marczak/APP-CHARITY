package pl.coderslab.charity.controllers;


import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entities.User;
import pl.coderslab.charity.services.CurrentUser;
import pl.coderslab.charity.services.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/main")
    public String userMain(@RequestParam(value = "updateStatus", required = false, defaultValue = "0") Integer updateStatus,
                           @AuthenticationPrincipal CurrentUser currentUser, HttpServletRequest request
    ) {
        userService.addUserStatsToRequestAttributes(currentUser, request);
        userService.setUpdateStatus(updateStatus, request);
        return "user/user-main";
    }

    @GetMapping("/profile")
    public String userProfileGet(Model model, HttpSession session
    ) {
        User user = (User) session.getAttribute("user");
        user.setPassword("**********");
        model.addAttribute("updateUser", user);
        return "user/user-profile";
    }

    @PostMapping("/profile")
    public String userProfilePost(@ModelAttribute("updateUser") @Valid User updateUser, BindingResult result,
                                  @AuthenticationPrincipal CurrentUser currentUser, @RequestParam String confirmPassword,
                                  HttpServletRequest request
    ) {
        if (result.hasErrors()) {
            return "user/user-profile";
        } else {
            User user = currentUser.getUser();
            if (userService.checkIfUpdateEmailBelongsToUpdateUser(user, updateUser) ||
                    userService.isEmailAvailable(updateUser.getEmail())
            ) {
                if (updateUser.getPassword().equals(confirmPassword)) {
                    userService.saveUser(updateUser);
                    HttpSession session = request.getSession();
                    session.removeAttribute("user");
                    session.setAttribute("user", updateUser);
                    return "redirect:/user/profile?userUpdate=success";
                } else {
                    result.addError(new FieldError(
                            "newUser",
                            "password",
                            "Wprowadzone hasła nie mogą się różnić."
                    ));
                    return "user/user-profile";
                }
            } else {
                result.addError(new FieldError(
                        "newUser",
                        "email",
                        "Adres e-mail jest już zajęty."
                ));
                return "user/user-profile";
            }
        }
    }

}
