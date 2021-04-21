package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entities.Donation;

import java.util.List;
import java.util.Optional;


@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value = "SELECT d FROM Donation d WHERE d.archived = false")
    Optional<List<Donation>> getUnarchivedDonations();

    @Query(value = "SELECT d FROM Donation d WHERE d.archived = true")
    Optional<List<Donation>> getArchivedDonations();

    @Query(value = "SELECT SUM(d.quantity) FROM Donation d WHERE d.status.id = 2")
    Optional<Integer> countNumberOfDonatedBags();

    @Query(value = "SELECT COUNT(d) FROM Donation d WHERE d.status.id = 2")
    Optional<Integer> countNumberOfDonations();

    Optional <Donation> findFirstById(Long donationId);

    @Query(value = "SELECT COUNT(d) FROM Donation d WHERE d.user.id = ?1 AND d.status.id = 2")
    Optional<Integer> countAllDonationsByUserWithStatusCollected(Long userId);

    @Query(value = "SELECT SUM(d.quantity) FROM Donation d WHERE d.user.id = ?1 AND d.status.id = 2")
    Optional<Integer> countAllDonatedBagsByUserFromDonationsWithStatusCollected(Long userId);

    @Query(value = "SELECT d FROM Donation d WHERE d.user.id = ?1 AND d.archived = false ORDER BY d.status.id ASC, d.collected DESC, d.created DESC")
    Optional<List<Donation>> findAllDonationsByUserNotArchivedOrderByStatusCollectedCreated(Long userId);

    @Query(value = "SELECT d FROM Donation d WHERE d.user.id = ?1 AND d.archived = false AND d.status.id = 1")
    Optional<List<Donation>> findAllDonationsByUserNotArchivedAwaitingPickup(Long userId);

    @Query(value = "SELECT COUNT(d) FROM Donation d WHERE d.user.id = ?1 AND d.archived = false AND d.status.id = 1")
    Optional<Integer> countDonationsByUserIdAndStatusAwaitingPickupNotArchived(Long userId);

    @Query(value = "SELECT d FROM Donation d WHERE d.user.id = ?1 AND d.archived = false AND d.status.id = 2 OR d.status.id = 3")
    Optional<List<Donation>> findAllDonationsByUserNotArchivedCollectedOrCanceled(Long userId);

    @Modifying
    @Query(value = "UPDATE Donation d SET d.archived = true WHERE d.id = ?1")
    void updateDonationArchivedToTrue(Long donationId);

    @Query(value = "SELECT d FROM Donation d ORDER BY d.archived ASC, d.status.id ASC")
    Optional<List<Donation>> adminFindAllDonationsOrderByArchivedStatus();

    @Query(value = "SELECT COUNT(d) FROM Donation d WHERE d.status.id = ?1 AND d.archived = false")
    Optional<Integer> adminCountNumberOfDonationsByStatus(Long statusId);

    @Query(value = "SELECT COUNT(d) FROM Donation d WHERE d.archived = true")
    Optional<Integer> adminCountNumberOfDonationsArchived();

    @Query(value = "SELECT COUNT(d) FROM Donation d WHERE d.archived = false AND d.status.id <> 1")
    Optional<Integer> adminCountNumberOfDonationsUnarchived();




}
