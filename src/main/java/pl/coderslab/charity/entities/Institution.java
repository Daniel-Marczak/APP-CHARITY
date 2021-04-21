package pl.coderslab.charity.entities;


import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Pattern;

@Data
@Entity(name = "Institution")
@Table(name = "institution")
public class Institution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Pattern(
            regexp = "^((?=.{3,60}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]+ )?(\"|”|„)[A-ZŻŹĆĄŚĘŁÓŃa-zżźćńółęąś]{2,}( [A-ZŻŹĆĄŚĘŁÓŃa-zżźćńółęąś]{1,}){0,}(\"|”)$",
            message = "{validation.error-institution-name}"
    )
    @Column(
            name = "name",
            unique = true,
            nullable = false,
            columnDefinition = "VARCHAR(60)"
    )
    private String name;

    @Pattern(
            regexp = "^(?=.{3,50}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,}( [A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,})*$",
            message = "{validation.error-institution-city}"
    )
    @Column(
            name = "city",
            nullable = false,
            columnDefinition = "VARCHAR(50)"
    )
    private String city;

    @Pattern(
            regexp = "^(?!.*,\\.)(?=.{3,150}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{0,}(,)? [a-zżźćńółęąś]+(,)?( [a-zżźćńółęąś]+(,)?)+\\.$",
            message = "{validation.error-institution-description}"
    )
    @Column(
            name = "description",
            nullable = false,
            columnDefinition = "VARCHAR(300)"
    )
    private String description;

    @Column(
            name = "enabled",
            nullable = false
    )
    private boolean enabled;


}
