package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.services.ContactFormMessageServiceImpl;

import javax.servlet.http.HttpSession;


@Controller
public class ContactFormMessageController {

    private final ContactFormMessageServiceImpl contactFormMessageService;


    public ContactFormMessageController(ContactFormMessageServiceImpl contactFormMessageService) {
        this.contactFormMessageService = contactFormMessageService;
    }


    @PostMapping("/contact")
    public String processContactFormPost(@RequestParam String name, @RequestParam String surname,
                                         @RequestParam String message, HttpSession session
    ){
        if (contactFormMessageService.validateMessageInfo(name, surname, message)) {
            contactFormMessageService.saveContactFormMessage(name, surname, message, session);
            return "redirect:/?message=sent";
        }
        return "redirect:/?message=error";
    }


}
