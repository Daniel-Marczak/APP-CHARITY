package pl.coderslab.charity.entities;


import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;


@Data
@Entity(name = "ContactFormMessage")
@Table(name = "contact_form_message")
public class ContactFormMessage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(
            name = "name",
            nullable = false,
            columnDefinition = "VARCHAR(25)"
    )
    private String name;

    @Column(
            name = "surname",
            nullable = false,
            columnDefinition = "VARCHAR(25)"
    )
    private String surname;

    @ManyToOne
    private User user;

    @Column(
            name = "message",
            nullable = false,
            columnDefinition = "VARCHAR(300)"
    )
    private String message;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(
            name = "sent",
            nullable = false
    )
    private LocalDate sent;

    @Column(
            name = "is_read",
            nullable = false
    )
    private Boolean isRead;

    @Column(
            name = "is_archived",
            nullable = false
    )
    private Boolean isArchived;


}
