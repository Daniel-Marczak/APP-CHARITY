package pl.coderslab.charity.entities;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity(name = "DonationStatus")
@Table(name = "donation_status")
public class DonationStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(
            name = "name",
            nullable = false,
            columnDefinition = "VARCHAR(25)"
    )
    private String name;



}
