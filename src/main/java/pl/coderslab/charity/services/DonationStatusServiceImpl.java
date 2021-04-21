package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entities.DonationStatus;
import pl.coderslab.charity.repositories.DonationStatusRepository;


@Service
public class DonationStatusServiceImpl implements DonationStatusService{

    private final DonationStatusRepository donationStatusRepository;

    public DonationStatusServiceImpl(DonationStatusRepository donationStatusRepository) {
        this.donationStatusRepository = donationStatusRepository;
    }

    @Override
    public DonationStatus findById(Long statusId) {
        return donationStatusRepository.findById(statusId).orElse(new DonationStatus());
    }


}
