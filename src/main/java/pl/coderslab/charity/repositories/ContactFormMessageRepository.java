package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entities.ContactFormMessage;

import java.util.List;
import java.util.Optional;

@Repository
public interface ContactFormMessageRepository extends JpaRepository <ContactFormMessage, Long> {

    @Query(value = "SELECT m FROM ContactFormMessage m")
    Optional<List<ContactFormMessage>> getAllContactFormMessages();

    @Modifying
    @Query(value = "UPDATE ContactFormMessage c SET c.isRead = true WHERE c.id = ?1")
    void updateContactFormMessageStatusToRead(Long messageId);

    @Modifying
    @Query(value = "UPDATE ContactFormMessage c SET c.isArchived = true WHERE c.id = ?1")
    void updateContactFormMessageStatusToArchived(Long messageId);

    Optional<Integer> countAllByIsReadAndIsArchived(boolean isRead, boolean isArchived);

    Optional<Integer> countAllByIsArchivedEquals(boolean isArchived);




}
