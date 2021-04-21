package pl.coderslab.charity.services;

import org.springframework.validation.BindingResult;
import pl.coderslab.charity.entities.Role;
import pl.coderslab.charity.entities.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserService {

    User findByEmail(String email);

    void saveUser(User user);

    User findFirstById(Long userId);

    boolean checkIfUserIsAdmin(Long userId);

    List<User> getAllUsers();

    List<User> getAllAdmins();

    void setUserEnabledToTrue(Long userId);

    void setUserEnabledToFalse(Long userId);

    void adminUpdateUser(String email, String name, String  surname, Long userId);

    void updateUserAdminStatus(Long userId, String admin);

    void addUserStatsToRequestAttributes(CurrentUser currentUser, HttpServletRequest request);

    void setUpdateStatus(int status, HttpServletRequest request);

    boolean checkIfUpdateEmailBelongsToUpdateUser(User currentUser, User updateUser);

    boolean isEmailAvailable(String email);

    String[] processResetPasswordEmailMessage(User user);

    boolean checkIfEmailBelongsToUser(User editUser);

    Integer countAllByEnabledEqualsAndRolesContains(boolean isEnabled, Role role);

}
