package pl.coderslab.charity.services;

import pl.coderslab.charity.entities.DonationStatus;

public interface DonationStatusService {

    DonationStatus findById(Long statusId);

}
