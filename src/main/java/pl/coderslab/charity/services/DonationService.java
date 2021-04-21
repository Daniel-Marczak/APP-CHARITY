package pl.coderslab.charity.services;

import pl.coderslab.charity.entities.Donation;

import java.util.List;

public interface DonationService {

    void saveDonation(Donation donation);

    List<Donation> getUnarchivedDonations();

    List<Donation> getArchivedDonations();

    Donation findFirstById(Long donationId);

    int countNumberOfDonatedBags();

    int countNumberOfDonations();

    int countAllDonationsByUserWithStatusCollected(Long userId);

    int countAllDonatedBagsByUserFromDonationsWithStatusCollected(Long userId);

    List<Donation> findAllDonationsByUserNotArchivedOrderByStatusCollectedCreated(Long userId);

    List<Donation> findAllDonationsByUserNotArchivedAwaitingPickup(Long userId);

    int countDonationsByUserIdAndStatusAwaitingPickupNotArchived(Long userId);

    List<Donation> findAllDonationsByUserNotArchivedCollectedOrCanceled(Long userId);

    void updateDonationArchivedToTrue(Long donationId);

    List<Donation> adminFindAllDonationsOrderByArchivedStatus();

    boolean checkIfDonationWithStatusAwaitingPickupBelongsToUser(Long userId, Long donationId);

    boolean checkIfDonationWithStatusClosedOrCanceledBelongsToUser(Long userId, Long donationId);

    String[] processDonationEmailDetailsText(Donation donation);

    Integer adminCountNumberOfDonationsByStatus(Long statusId);

    Integer adminCountNumberOfDonationsArchived();

    Integer adminCountNumberOfDonationsUnarchived();





}
