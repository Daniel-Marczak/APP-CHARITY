package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entities.ContactFormMessage;
import pl.coderslab.charity.entities.User;
import pl.coderslab.charity.repositories.ContactFormMessageRepository;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class ContactFormMessageServiceImpl implements ContactFormMessageService{

    private final ContactFormMessageRepository contactFormMessageRepository;

    public ContactFormMessageServiceImpl(ContactFormMessageRepository contactFormMessageRepository) {
        this.contactFormMessageRepository = contactFormMessageRepository;
    }

    @Override
    public void saveContactFormMessage(String name, String surname, String message, HttpSession session) {
        ContactFormMessage contactFormMessage = new ContactFormMessage();
        User user = (User) session.getAttribute("user");
        if (user == null){
            contactFormMessage.setName(name);
            contactFormMessage.setSurname(surname);
            contactFormMessage.setUser(null);
        }
        if (user != null){
            contactFormMessage.setName(user.getName());
            contactFormMessage.setSurname(user.getSurname());
            contactFormMessage.setUser(user);
        }
        contactFormMessage.setMessage(message);
        contactFormMessage.setSent(LocalDate.now());
        contactFormMessage.setIsRead(false);
        contactFormMessage.setIsArchived(false);

        contactFormMessageRepository.save(contactFormMessage);
    }

    @Override
    public boolean validateMessageInfo(String name, String surname, String message) {
        return name.length() >= 2 && name.length() <= 25 && surname.length() >= 2 && surname.length() <= 25 &&
                message.length() >= 10 && message.length() <= 300;
    }

    @Override
    public List<ContactFormMessage> getAllContactFormMessages() {
        return contactFormMessageRepository.getAllContactFormMessages().orElse(new ArrayList<>());
    }

    @Transactional
    @Override
    public void updateContactFormMessageStatusToRead(Long messageId) {
        contactFormMessageRepository.updateContactFormMessageStatusToRead(messageId);
    }

    @Transactional
    @Override
    public void updateContactFormMessageStatusToArchived(Long messageId) {
        contactFormMessageRepository.updateContactFormMessageStatusToArchived(messageId);
    }

    @Override
    public Integer countAllByIsReadAndIsArchived(boolean isRead, boolean isArchived) {
        return contactFormMessageRepository.countAllByIsReadAndIsArchived(isRead, isArchived).orElse(0);
    }

    @Override
    public Integer countAllByIsArchivedEquals(boolean isArchived) {
        return contactFormMessageRepository.countAllByIsArchivedEquals(isArchived).orElse(0);
    }


}
