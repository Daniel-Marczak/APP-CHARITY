package pl.coderslab.charity.entities;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalTime;

@Data
@Entity(name = "ResetPassword")
@Table(name = "reset_password")
public class ResetPassword {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(
            name = "hashed_user_email",
            nullable = false,
            columnDefinition = "VARCHAR(255)"
    )
    private String hashedUserEmail;

    @OneToOne
    @JoinColumn(
            name = "user",
            nullable = false
    )
    private User user;

    @Column(
            name = "created_time",
            nullable = false,
            columnDefinition = "TIME"
    )
    private LocalTime createdTime;



}
