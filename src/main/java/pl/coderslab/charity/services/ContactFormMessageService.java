package pl.coderslab.charity.services;


import pl.coderslab.charity.entities.ContactFormMessage;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ContactFormMessageService {

    void saveContactFormMessage(String name, String surname, String message, HttpSession session);

    boolean validateMessageInfo(String name, String surname, String message);

    List<ContactFormMessage> getAllContactFormMessages();

    void updateContactFormMessageStatusToRead(Long messageId);

    void updateContactFormMessageStatusToArchived(Long messageId);

    Integer countAllByIsReadAndIsArchived(boolean isRead, boolean isArchived);

    Integer countAllByIsArchivedEquals(boolean isArchived);



}
