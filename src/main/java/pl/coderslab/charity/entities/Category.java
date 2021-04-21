package pl.coderslab.charity.entities;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity(name = "Category")
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(
            name = "name",
            unique = true,
            nullable = false,
            columnDefinition = "VARCHAR(55)"
    )
    private String name;

}
