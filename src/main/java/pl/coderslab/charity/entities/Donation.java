package pl.coderslab.charity.entities;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.util.List;

@Data
@Entity(name = "Donation")
@Table(name = "donation")
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(
            name = "created",
            nullable = false
    )
    private LocalDate created;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "collected")
    private LocalDate collected;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "cancelled")
    private LocalDate cancelled;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "edited")
    private LocalDate edited;

    @OneToOne
    @JoinColumn(
            name = "user_id",
            nullable = false
    )
    private User user;

    @Column(
            name = "quantity",
            nullable = false,
            columnDefinition = "TINYINT"
    )
    private int quantity;

    @NotNull
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinColumn(nullable = false)
    private List<Category> categories;

    @NotNull
    @ManyToOne
    @JoinColumn(
            name = "institution_id",
            nullable = false
    )
    private Institution institution;

    @Pattern(
            regexp = "^(?=.{3,50}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{3,} ([A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{1,} )*[1-9]{1}[0-9]{0,2}([a-zA-Z]?)?(\\/[1-9]{1}[0-9]{0,2}([a-zA-Z]?)?)?$",
            message = "{validation.error-donation-street}"

    )
    @Column(
            name = "street",
            nullable = false,
            columnDefinition = "VARCHAR(50)"
    )
    private String street;

    @Pattern(
            regexp = "^(?=.{3,50}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,}( [A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,})*$",
            message = "{validation.error-donation-city}"
    )
    @Column(
            name = "city",
            nullable = false,
            columnDefinition = "VARCHAR(50)"
    )
    private String city;

    @Pattern(
            regexp = "[0-9]{2}-[0-9]{3}",
            message = "{validation.error-donation-postcode}"
    )
    @Column(
            name = "zip_code",
            nullable = false,
            columnDefinition = "VARCHAR(10)"
    )
    private String zipCode;

    @Pattern(
            regexp = "^[1-9]{2} [1-9]{1}[0-9]{2}-[0-9]{2}-[0-9]{2}$|^[1-9]{1}[0-9]{2}-[0-9]{3}-[0-9]{3}$",
            message = "{validation.error-donation-phone}"
    )
    @Column(
            name = "phone",
            nullable = false,
            columnDefinition = "VARCHAR(25)"
    )
    private String phone;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(
            name = "pick_up_date",
            nullable = false
    )
    private LocalDate pickUpDate;

    @Column(
            name = "pick_up_time",
            nullable = false,
            columnDefinition = "TIME"
    )
    private String pickUpTime;

    @Column(
            name = "pick_up_comment",
            columnDefinition = "VARCHAR(300)"
    )
    private String pickUpComment;

    @ManyToOne
    @JoinColumn(
            name = "status_id",
            nullable = false
    )
    private DonationStatus status;

    @Column(name = "archived")
    private Boolean archived;





}
