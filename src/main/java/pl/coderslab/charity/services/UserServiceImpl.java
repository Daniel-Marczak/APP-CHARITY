package pl.coderslab.charity.services;


import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entities.ResetPassword;
import pl.coderslab.charity.entities.Role;
import pl.coderslab.charity.entities.User;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.ResetPasswordRepository;
import pl.coderslab.charity.repositories.RoleRepository;
import pl.coderslab.charity.repositories.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.time.LocalTime;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final DonationRepository donationRepository;
    private final MessageSource messageSource;
    private final ResetPasswordRepository resetPasswordRepository;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder, DonationRepository donationRepository,
                           MessageSource messageSource, ResetPasswordRepository resetPasswordRepository
    ) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.donationRepository = donationRepository;
        this.messageSource = messageSource;
        this.resetPasswordRepository = resetPasswordRepository;
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(true);
        Role userRole = roleRepository.findByName("ROLE_USER");
        if (user.getRoles() == null) {
            user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        }
        userRepository.save(user);
    }

    @Override
    public User findFirstById(Long userId) {
        return userRepository.findFirstById(userId).orElse(new User());
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.getAllUsers().orElse(new ArrayList<>());
    }

    @Override
    public List<User> getAllAdmins() {
        return userRepository.getAllAdmins().orElse(new ArrayList<>());
    }

    @Transactional
    @Override
    public void setUserEnabledToTrue(Long userId) {
        userRepository.setUserEnabledToTrue(userId);
    }

    @Transactional
    @Override
    public void setUserEnabledToFalse(Long userId) {
        userRepository.setUserEnabledToFalse(userId);
    }

    @Transactional
    @Override
    public void adminUpdateUser(String email, String name, String surname, Long userId) {
        userRepository.adminUpdateUser(email, name, surname, userId);
    }

    @Transactional
    @Override
    public void updateUserAdminStatus(Long userId, String admin) {
        User user = userRepository.findFirstById(userId).orElse(new User());
        Set<Role> roles = new HashSet<>();
        if (admin.equals("true")){
            roles.add(roleRepository.findById(1));
            user.setRoles(roles);
            return;
        }
        roles.add(roleRepository.findById(2));
        user.setRoles(roles);
    }

    @Override
    public void addUserStatsToRequestAttributes(CurrentUser currentUser, HttpServletRequest request) {
        User user = currentUser.getUser();
        request.setAttribute("donations", donationRepository
                .findAllDonationsByUserNotArchivedOrderByStatusCollectedCreated(user.getId()).orElse(new ArrayList<>()));
        request.setAttribute("bagsDonated",donationRepository
                .countAllDonatedBagsByUserFromDonationsWithStatusCollected(user.getId()).orElse(0));
        request.setAttribute("collectedDonations", donationRepository
                .countAllDonationsByUserWithStatusCollected(user.getId()).orElse(0));
        request.setAttribute("awaitingDonations", donationRepository
                .countDonationsByUserIdAndStatusAwaitingPickupNotArchived(user.getId()).orElse(0));
    }

    @Override
    public boolean checkIfUserIsAdmin(Long userId) {
        User user = userRepository.findFirstById(userId).orElse(new User());
        Set<Role> userRoles = user.getRoles();
        boolean isAdmin = false;
        for (Role role : userRoles){
            if (role.getName().equals("ROLE_ADMIN") || (role.getName().equals("ROLE_SUPER_ADMIN"))) {
                isAdmin = true;
                break;
            }
        }
        return isAdmin;
    }

    @Override
    public void setUpdateStatus(int status, HttpServletRequest request){
        if(status > 0){
            request.setAttribute("updateStatus", status);
        }
    }

    @Override
    public boolean checkIfUpdateEmailBelongsToUpdateUser(User currentUser, User updateUser) {
        return userRepository.findByEmail(currentUser.getEmail()).getEmail().equals(updateUser.getEmail());
    }

    @Override
    public boolean isEmailAvailable(String email) {
        return userRepository.findByEmail(email) == null;
    }

    @Override
    public String[] processResetPasswordEmailMessage(User user) {
        ResetPassword resetPassword = new ResetPassword();
        resetPassword.setUser(user);
        resetPassword.setCreatedTime(LocalTime.now());
        resetPassword.setHashedUserEmail(passwordEncoder.encode(user.getEmail()));
        resetPasswordRepository.save(resetPassword);

        String linkHashedInfo = "http://localhost:8080/emergency-password-reset?data=" + resetPassword.getHashedUserEmail();

        String subject = messageSource.getMessage("app.login-reset-password-email-subject", null, Locale.ROOT);
        String text =
                messageSource.getMessage("app.login-reset-password-email-hi", null, Locale.ROOT) + " " + user.getName() +
                "\n" +
                messageSource.getMessage("app.login-reset-password-email-instructions", null, Locale.ROOT) +
                "\n" +
                linkHashedInfo +
                "\n\n" +
                messageSource.getMessage("app.login-reset-password-email-regards", null, Locale.ROOT) +
                "\n" +
                messageSource.getMessage("app.login-reset-password-team", null, Locale.ROOT)
               ;
        String[] subjectAndText = new String[2];
        subjectAndText[0] = subject;
        subjectAndText[1] = text;

        return subjectAndText;
    }

    @Override
    public boolean checkIfEmailBelongsToUser(User editUser){
        return userRepository.findFirstById(editUser.getId()).orElse(new User()).getEmail().equals(editUser.getEmail());
    }

    @Override
    public Integer countAllByEnabledEqualsAndRolesContains(boolean isEnabled, Role role) {
        return userRepository.countAllByEnabledEqualsAndRolesContains(isEnabled, role).orElse(0);
    }

}
