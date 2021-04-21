package pl.coderslab.charity.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entities.DonationStatus;


@Repository
public interface DonationStatusRepository extends JpaRepository<DonationStatus, Long> {

}
