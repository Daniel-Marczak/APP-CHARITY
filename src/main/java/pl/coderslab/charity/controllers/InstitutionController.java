package pl.coderslab.charity.controllers;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entities.Institution;
import pl.coderslab.charity.services.InstitutionService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@Secured({"ROLE_ADMIN", "ROLE_SUPER_ADMIN"})
@RequestMapping("/institution")
public class InstitutionController {

    private final InstitutionService institutionService;

    public InstitutionController(InstitutionService institutionService) {
        this.institutionService = institutionService;
    }

    @GetMapping("/institutions")
    public String institutionsGet(HttpServletRequest request, Model model){
        request.setAttribute("institutions", institutionService.getAllInstitutions());
        model.addAttribute("newInstitution", new Institution());
        return "admin/admin-institutions";
    }

    @GetMapping("/add")
    public String institutionAddGet(Model model){
        model.addAttribute("newInstitution", new Institution());
        return "institution/institution-add";
    }

    @PostMapping("/add")
    public String institutionAddPost(@ModelAttribute("newInstitution") @Valid Institution newInstitution,
                                     BindingResult result
    ){
        if(result.hasErrors()){
            return "institution/institution-add";
        }
        institutionService.saveInstitution(newInstitution);

        return "redirect:/institution/institutions?addInstitution=success";
    }

    @GetMapping("/set-status/{institutionId}/{status}")
    public String institutionEnabledStatusChange(@PathVariable Long institutionId, @PathVariable String status){
        if (status.equals("false")){
            institutionService.changeInstitutionEnabledToFalse(institutionId);
            return "redirect:/institution/institutions?changeStatus=false";
        }
        institutionService.changeInstitutionEnabledToTrue(institutionId);
        return "redirect:/institution/institutions?changeStatus=true";
    }

    @GetMapping("/edit/{institutionId}")
    public String institutionEditGet(@PathVariable Long institutionId, Model model, HttpServletRequest request){
        Institution institution = institutionService.findById(institutionId);
        request.setAttribute("editInstitution", institution);
        model.addAttribute("editInstitution", institution);
        return "institution/institution-edit";
    }

    @PostMapping("/edit/{institutionId}")
    public String institutionEditPost(@ModelAttribute("editInstitution") @Valid Institution editInstitution,
                                      BindingResult result, @PathVariable Long institutionId
    ){
        if(result.hasErrors()){
            return "institution/institution-edit";
        }
        institutionService.saveInstitution(editInstitution);
        return "redirect:/institution/edit/" + institutionId + "?edit=success";
    }






}
