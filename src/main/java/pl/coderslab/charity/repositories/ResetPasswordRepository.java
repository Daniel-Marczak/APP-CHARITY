package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.entities.ResetPassword;

import java.util.Optional;

public interface ResetPasswordRepository extends JpaRepository<ResetPassword, Long> {

    Optional<ResetPassword> findFirstByHashedUserEmail(String hashedUserEmail);

    void deleteResetPasswordById(Long resetPasswordId);
}
