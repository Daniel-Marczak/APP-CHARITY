package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entities.Institution;
import pl.coderslab.charity.repositories.InstitutionRepository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class InstitutionServiceImpl implements InstitutionService{

    private final InstitutionRepository institutionRepository;

    public InstitutionServiceImpl(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @Override
    public Institution findById(Long institutionId) {
        return institutionRepository.findById(institutionId).orElse(new Institution());
    }

    @Override
    public Institution findInstitutionByNameEquals(String name) {
        return institutionRepository.findInstitutionByNameEquals(name).orElse(new Institution());
    }

    @Override
    public List<Institution> getAllInstitutionsWithStatusEnabledTrue() {
        return institutionRepository.getAllInstitutionsWithStatusEnabledTrue().orElse(new ArrayList<>());
    }

    @Override
    public List<Institution> getAllInstitutionsWithStatusEnabledFalse() {
        return institutionRepository.getAllInstitutionsWithStatusEnabledFalse().orElse(new ArrayList<>());
    }

    @Override
    public List<Institution> getAllInstitutions() {
        return institutionRepository.getAllInstitutions().orElse(new ArrayList<>());
    }

    @Transactional
    @Override
    public void changeInstitutionEnabledToFalse(Long institutionId) {
        institutionRepository.changeInstitutionEnabledToFalse(institutionId);
    }

    @Transactional
    @Override
    public void changeInstitutionEnabledToTrue(Long institutionId) {
        institutionRepository.changeInstitutionEnabledToTrue(institutionId);
    }

    @Override
    public void saveInstitution(Institution institution) {
        institutionRepository.save(institution);
    }

    @Override
    public boolean checkIfInstitutionNameIsAvailable(String institutionName) {
        Optional<Institution> institution = institutionRepository.findInstitutionByNameEquals(institutionName);
        return institution.isPresent();
    }

    @Override
    public int countAllByEnabledEquals(boolean enabled) {
        return institutionRepository.countAllByEnabledEquals(enabled).orElse(0);
    }


}
