package pl.coderslab.charity.services;

import pl.coderslab.charity.entities.ResetPassword;

public interface ResetPasswordService {

    ResetPassword findFirstByHashedUserEmail(String hashedUserEmail);

    void saveResetPassword(ResetPassword resetPassword);

    void deleteResetPassword(ResetPassword resetPassword);

    void deleteResetPasswordById(Long resetPasswordId);

}
