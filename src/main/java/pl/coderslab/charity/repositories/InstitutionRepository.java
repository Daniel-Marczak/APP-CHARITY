package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entities.Institution;

import java.util.List;
import java.util.Optional;

@Repository
public interface InstitutionRepository extends JpaRepository<Institution, Long> {

    Optional<Institution> findById(Long institutionId);

    Optional<Institution> findInstitutionByNameEquals(String name);

    Optional<Integer> countAllByEnabledEquals(boolean enabled);

    @Query(value = "SELECT COUNT(i) FROM Institution i")
    Optional<Integer> countAllInstitutions();

    @Query(value = "SELECT i FROM Institution i WHERE i.enabled = true")
    Optional<List<Institution>> getAllInstitutionsWithStatusEnabledTrue();

    @Query(value = "SELECT i FROM Institution i WHERE i.enabled = false")
    Optional<List<Institution>> getAllInstitutionsWithStatusEnabledFalse();

    @Query(value = "SELECT i FROM Institution i ORDER BY i.enabled DESC, i.id DESC")
    Optional<List<Institution>> getAllInstitutions();

    @Modifying
    @Query(value = "UPDATE Institution i SET i.enabled = false WHERE i.id = ?1")
    void changeInstitutionEnabledToFalse(Long institutionId);

    @Modifying
    @Query(value = "UPDATE Institution i SET i.enabled = true WHERE i.id = ?1")
    void changeInstitutionEnabledToTrue(Long institutionId);


}
