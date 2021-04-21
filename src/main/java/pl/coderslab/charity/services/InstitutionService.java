package pl.coderslab.charity.services;

import pl.coderslab.charity.entities.Institution;


import java.util.List;

public interface InstitutionService {

    Institution findById(Long institutionId);

    Institution findInstitutionByNameEquals(String name);

    List<Institution> getAllInstitutionsWithStatusEnabledTrue();

    List<Institution> getAllInstitutionsWithStatusEnabledFalse();

    List<Institution> getAllInstitutions();

    void changeInstitutionEnabledToFalse(Long institutionId);

    void changeInstitutionEnabledToTrue(Long institutionId);

    void saveInstitution(Institution institution);

    boolean checkIfInstitutionNameIsAvailable(String institutionName);

    int countAllByEnabledEquals(boolean enabled);




}
