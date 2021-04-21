package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entities.Role;
import pl.coderslab.charity.entities.User;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

    Optional<User> findFirstById(Long userId);

    @Query(value = "SELECT * FROM user JOIN user_role ur ON user.id = ur.user_id WHERE role_id = 2", nativeQuery = true)
    Optional<List<User>> getAllUsers();

    @Query(value = "SELECT * FROM user JOIN user_role ur ON user.id = ur.user_id WHERE role_id = 1", nativeQuery = true)
    Optional<List<User>> getAllAdmins();

    @Modifying
    @Query(value = "UPDATE User u SET u.enabled = true WHERE u.id = ?1")
    void setUserEnabledToTrue(Long userId);

    @Modifying
    @Query(value = "UPDATE User u SET u.enabled = false WHERE u.id = ?1")
    void setUserEnabledToFalse(Long userId);

    @Modifying
    @Query(value = "UPDATE User u SET u.email = ?1, u.name = ?2, u.surname = ?3 WHERE u.id = ?4")
    void adminUpdateUser(String email, String name, String  surname, Long userId);

    Optional<Integer> countAllByEnabledEqualsAndRolesContains(boolean isEnabled, Role role);




}
