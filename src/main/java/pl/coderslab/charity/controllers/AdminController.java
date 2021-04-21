package pl.coderslab.charity.controllers;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entities.User;
import pl.coderslab.charity.services.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
@RequestMapping("/admin")
public class AdminController {

    private final UserService userService;
    private final DonationService donationService;
    private final ContactFormMessageService contactFormMessageService;

    public AdminController(UserService userService, DonationService donationService,
                           ContactFormMessageService contactFormMessageService
    ) {
        this.userService = userService;
        this.donationService = donationService;
        this.contactFormMessageService = contactFormMessageService;
    }

    @GetMapping("/main")
    public String mainGet() {
        return "admin/admin-main";
    }

    @GetMapping("/profile")
    public String profileGet(Model model, HttpSession session) {
        User admin = (User) session.getAttribute("user");
        admin.setPassword("**********");
        model.addAttribute("updateAdmin", admin);
        return "admin/admin-profile";
    }

    @PostMapping("/profile")
    public String profilePost(@ModelAttribute("updateAdmin") @Valid User updateAdmin, BindingResult result,
                              @AuthenticationPrincipal CurrentUser currentUser, @RequestParam String confirmPassword,
                              HttpServletRequest request
    ) {
        if (result.hasErrors()) {
            return "user/user-profile";
        } else {
            User user = currentUser.getUser();
            if (userService.checkIfUpdateEmailBelongsToUpdateUser(user, updateAdmin) ||
                    userService.isEmailAvailable(updateAdmin.getEmail())
            ) {
                if (updateAdmin.getPassword().equals(confirmPassword)) {
                    userService.saveUser(updateAdmin);
                    HttpSession session = request.getSession();
                    session.removeAttribute("user");
                    session.setAttribute("user", updateAdmin);
                    return "redirect:/admin/profile?userUpdate=success";
                } else {
                    result.addError(new FieldError(
                            "newUser",
                            "password",
                            "Wprowadzone hasła nie mogą się różnić."
                    ));
                    return "admin/admin-profile";
                }
            } else {
                result.addError(new FieldError(
                        "newUser",
                        "email",
                        "Adres e-mail jest już zajęty."
                ));
                return "admin/admin-profile";
            }
        }
    }

    @GetMapping("/donations")
    public String donationsGet(@RequestParam(value = "updateStatus", required = false, defaultValue = "0") Integer updateStatus,
                               HttpServletRequest request
    ) {
        request.setAttribute("allDonations", donationService.adminFindAllDonationsOrderByArchivedStatus());
        userService.setUpdateStatus(updateStatus, request);
        return "admin/admin-donations";
    }

    @GetMapping("/users")
    public String usersGet(HttpServletRequest request) {
        request.setAttribute("allUsers", userService.getAllUsers());
        return "admin/admin-users";
    }

    @GetMapping("/users/set-enabled/{userId}")
    public String userSetEnabledStatus(@PathVariable Long userId,
                                       @RequestParam(value = "admin", required = false, defaultValue = "0") Integer admin
    ) {
        User user = userService.findFirstById(userId);
        if (user.isEnabled()) {
            userService.setUserEnabledToFalse(userId);
            if (admin == 121101115) {
                return "redirect:/admin/administrators?enabled=false";
            }
            return "redirect:/admin/users?enabled=false";
        }
        userService.setUserEnabledToTrue(userId);
        if (admin == 121101115) {
            return "redirect:/admin/administrators?enabled=true";
        }
        return "redirect:/admin/users?enabled=true";
    }

    @GetMapping("/user/set-role-admin/{userId}/{admin}")
    public String setRoleAdmin(@PathVariable Long userId, @PathVariable String admin) {
        userService.updateUserAdminStatus(userId, admin);
        return "redirect:/admin/users";
    }

    @GetMapping("/administrators")
    public String administratorsGet(HttpServletRequest request) {
        request.setAttribute("allAdmins", userService.getAllAdmins());
        return "admin/admin-administrators";
    }

    @PostMapping("/administrators")
    public String administratorsPost() {

        return "admin/admin-administrators";
    }

    @GetMapping("/contact-form-messages")
    public String contactFormMessagesGet(HttpServletRequest request) {
        request.setAttribute("contactFormMessages", contactFormMessageService.getAllContactFormMessages());
        return "admin/admin-contact-form-messages";
    }

    @GetMapping("/contact-form-messages/{messageId}/{status}")
    public String updateContactFormMessageStatus(@PathVariable Long messageId, @PathVariable String status) {
        if (status.equals("read")) {
            contactFormMessageService.updateContactFormMessageStatusToRead(messageId);
            return "redirect:/admin/contact-form-messages?status=read";
        }
        contactFormMessageService.updateContactFormMessageStatusToArchived(messageId);
        return "redirect:/admin/contact-form-messages?status=archived";
    }


}
