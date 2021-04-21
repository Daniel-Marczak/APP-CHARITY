package pl.coderslab.charity.entities;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Set;

@Data
@Entity(name = "User")
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Email
    @Pattern(
            regexp = "^(?=.{5,60}$)([a-z0-9-_]*\\.)*[a-z0-9-_]*@[a-z0-9]*\\.[a-z]{2,3}$",
            message = "{validation.error-user-email-pattern}"
    )
    @Column(
            nullable = false,
            unique = true,
            columnDefinition = "VARCHAR(60)"
    )
    private String email;

    @Pattern(
            regexp = "^[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,25}$",
            message = "{validation.error-user-name-pattern}"
    )
    @Column(
            name = "name",
            columnDefinition = "VARCHAR(25)"
    )
    private String name;

    @Pattern(
            regexp = "^(?=.{3,25}$)([A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,}(-[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,})?)$",
            message = "{validation.error-user-surname-pattern}"
    )
    @Column(name = "surname",
            columnDefinition = "VARCHAR(25)"
    )
    private String surname;

    @Pattern(
            regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&])(?=\\S+$).{8,}$",
            message = "{validation.error-user-password-pattern}"
    )
    @Column(
            name = "password",
            columnDefinition = "VARCHAR(255)"
    )
    private String password;

    private boolean enabled;

    @ManyToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER
    )
    @JoinTable(
            name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private Set<Role> roles;



}