package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entities.ResetPassword;
import pl.coderslab.charity.repositories.ResetPasswordRepository;

import javax.transaction.Transactional;

@Service
public class ResetPasswordServiceImpl implements ResetPasswordService{

    private final ResetPasswordRepository resetPasswordRepository;

    public ResetPasswordServiceImpl(ResetPasswordRepository resetPasswordRepository) {
        this.resetPasswordRepository = resetPasswordRepository;
    }


    @Override
    public ResetPassword findFirstByHashedUserEmail(String hashedUserEmail) {
        ResetPassword resetPassword = new ResetPassword();
        resetPassword.setId(0L);
        return resetPasswordRepository.findFirstByHashedUserEmail(hashedUserEmail).orElse(resetPassword);
    }

    @Override
    public void saveResetPassword(ResetPassword resetPassword) {
        resetPasswordRepository.save(resetPassword);
    }

    @Override
    public void deleteResetPassword(ResetPassword resetPassword) {
        resetPasswordRepository.delete(resetPassword);
    }

    @Transactional
    @Override
    public void deleteResetPasswordById(Long resetPasswordId) {
        resetPasswordRepository.deleteResetPasswordById(resetPasswordId);
    }
}
