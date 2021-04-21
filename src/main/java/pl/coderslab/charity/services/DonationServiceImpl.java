package pl.coderslab.charity.services;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entities.Donation;
import pl.coderslab.charity.repositories.DonationRepository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Service
public class DonationServiceImpl implements DonationService{

    private final DonationRepository donationRepository;
    private final MessageSource messageSource;

    public DonationServiceImpl(DonationRepository donationRepository,MessageSource messageSource) {
        this.donationRepository = donationRepository;
        this.messageSource = messageSource;
    }

    public void saveDonation(Donation donation){
        donation.setArchived(false);
        donationRepository.save(donation);
    }

    @Override
    public List<Donation> getUnarchivedDonations() {
        return donationRepository.getUnarchivedDonations().orElse(new ArrayList<>());
    }

    @Override
    public List<Donation> getArchivedDonations() {
        return donationRepository.getArchivedDonations().orElse(new ArrayList<>());
    }

    @Override
    public int countNumberOfDonatedBags() {
        return donationRepository.countNumberOfDonatedBags().orElse(0);
    }


    @Override
    public int countNumberOfDonations() {
        return donationRepository.countNumberOfDonations().orElse(0);
    }

    @Override
    public Donation findFirstById(Long donationId) {
        return donationRepository.findFirstById(donationId).orElse(new Donation());
    }

    @Override
    public int countAllDonationsByUserWithStatusCollected(Long userId) {
        return donationRepository.countAllDonationsByUserWithStatusCollected(userId).orElse(0);
    }

    @Override
    public int countAllDonatedBagsByUserFromDonationsWithStatusCollected(Long userId) {
        return donationRepository.countAllDonatedBagsByUserFromDonationsWithStatusCollected(userId).orElse(0);
    }

    @Override
    public List<Donation> findAllDonationsByUserNotArchivedOrderByStatusCollectedCreated(Long userId) {
        return donationRepository.findAllDonationsByUserNotArchivedOrderByStatusCollectedCreated(userId).orElse(new ArrayList<>());
    }

    @Override
    public List<Donation> findAllDonationsByUserNotArchivedAwaitingPickup(Long userId) {
        return donationRepository.findAllDonationsByUserNotArchivedAwaitingPickup(userId).orElse(new ArrayList<>());
    }

    @Override
    public int countDonationsByUserIdAndStatusAwaitingPickupNotArchived(Long userId) {
        return donationRepository.countDonationsByUserIdAndStatusAwaitingPickupNotArchived(userId).orElse(0);
    }


    @Override
    public List<Donation> findAllDonationsByUserNotArchivedCollectedOrCanceled(Long userId) {
        return donationRepository.findAllDonationsByUserNotArchivedCollectedOrCanceled(userId).orElse(new ArrayList<>());
    }

    @Transactional
    @Override
    public void updateDonationArchivedToTrue(Long donationId) {
        donationRepository.updateDonationArchivedToTrue(donationId);
    }

    @Override
    public List<Donation> adminFindAllDonationsOrderByArchivedStatus() {
        return donationRepository.adminFindAllDonationsOrderByArchivedStatus().orElse(new ArrayList<>());
    }

    @Override
    public boolean checkIfDonationWithStatusAwaitingPickupBelongsToUser(Long userId, Long donationId) {
        List<Donation> userDonations = donationRepository.findAllDonationsByUserNotArchivedAwaitingPickup(userId).orElse(new ArrayList<>());
        for (Donation userDonation : userDonations) {
            if (userDonation.getId().equals(donationId)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean checkIfDonationWithStatusClosedOrCanceledBelongsToUser(Long userId, Long donationId) {
        List<Donation> userDonations = donationRepository.findAllDonationsByUserNotArchivedCollectedOrCanceled(userId).orElse(new ArrayList<>());
        for (Donation userDonation : userDonations) {
            if (userDonation.getId().equals(donationId)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public String[] processDonationEmailDetailsText(Donation donation) {
        String subject = messageSource.getMessage("app.donation-email-subject", null, Locale.ROOT);
        StringBuilder categories = new StringBuilder();
        for (int i =0; i < donation.getCategories().size(); i++){
            categories.append(donation.getCategories().get(i).getName()).append(", ");
        }

        String text = messageSource.getMessage("app.donation-email-hi", null, Locale.ROOT) +
                " " + donation.getUser().getName() + "! \n" +
                messageSource.getMessage("app.donation-email-pickup-info", null, Locale.ROOT) + "\n" +
                "\n" +
                messageSource.getMessage("app.donation-email-donation-details-text", null, Locale.ROOT) + ":\n" +
                messageSource.getMessage("app.donation-email-donation-id", null, Locale.ROOT) +
                " " + donation.getId() + "\n" +
                messageSource.getMessage("app.donation-email-donation-beneficiary", null, Locale.ROOT) +
                " " + donation.getInstitution().getName() + "\n" +
                messageSource.getMessage("app.donation-email-donation-quantity", null, Locale.ROOT) +
                " " + donation.getQuantity() + "\n" +
                messageSource.getMessage("app.donation-email-donation-categories", null, Locale.ROOT) +
                " " + categories + "\n\n" +
                messageSource.getMessage("app.donation-email-donation-address-heading", null, Locale.ROOT) +
                ":\n" +
                messageSource.getMessage("app.donation-email-donation-address-street", null, Locale.ROOT) +
                " " + donation.getStreet() + "\n" +
                messageSource.getMessage("app.donation-email-donation-address-city", null, Locale.ROOT) +
                " " + donation.getCity() + "\n" +
                messageSource.getMessage("app.donation-email-donation-address-zip-code", null, Locale.ROOT) +
                " " + donation.getZipCode() + "\n" +
                messageSource.getMessage("app.donation-email-donation-address-pickup-date", null, Locale.ROOT) +
                " " + donation.getPickUpDate() + "\n" +
                messageSource.getMessage("app.donation-email-donation-address-pickup-time", null, Locale.ROOT) +
                " " + donation.getPickUpTime() + "\n" +
                messageSource.getMessage("app.donation-email-donation-address-phone", null, Locale.ROOT) +
                " " + donation.getPhone() + "\n" +
                messageSource.getMessage("app.donation-email-donation-address-pickup-notes", null, Locale.ROOT)
                + " " + donation.getPickUpComment() + "\n" +
                "\n\n" +
                messageSource.getMessage("app.donation-email-thank-you-text", null, Locale.ROOT) + "\n" +
                "\n\n" +
                messageSource.getMessage("app.donation-email-regards", null, Locale.ROOT) + "\n" +
                messageSource.getMessage("app.donation-email-team", null, Locale.ROOT) + "\n"
                ;

        String[] subjectAndText = new String[2];
        subjectAndText[0] = subject;
        subjectAndText[1] = text;

        return subjectAndText;
    }

    @Override
    public Integer adminCountNumberOfDonationsByStatus(Long statusId) {
        return donationRepository.adminCountNumberOfDonationsByStatus(statusId).orElse(0);
    }

    @Override
    public Integer adminCountNumberOfDonationsArchived() {
        return donationRepository.adminCountNumberOfDonationsArchived().orElse(0);
    }

    @Override
    public Integer adminCountNumberOfDonationsUnarchived() {
        return donationRepository.adminCountNumberOfDonationsUnarchived().orElse(0);
    }


}
