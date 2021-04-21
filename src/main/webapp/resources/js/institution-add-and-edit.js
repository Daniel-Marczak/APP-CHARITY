const institutionNameInput = document.querySelector(".institution-name-input");
const institutionCityInput = document.querySelector(".institution-city-input");
const institutionDescriptionInput = document.querySelector(".institution-description-input");
const checkInstitutionFormBtn = document.querySelector(".check-institution-form-btn");
const saveInstitutionBtn = document.querySelector(".save-institution-btn");
const institutionForm = document.querySelector("#institution-form");

let isInstitutionNameValid = false;
let isInstitutionCityValid = false;
let isInstitutionDescriptionValid = false;

async function validateInstitutionNameAndCheckNameAvailability(){
    const errorDivName = document.querySelector(".error-div-institution-name");
    const errorDivNameUnavailable = document.querySelector(".error-div-institution-name-unavailable");
    const regExp = /^((?=.{3,60}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]+ )?("|”|„)[A-ZŻŹĆĄŚĘŁÓŃa-zżźćńółęąś]{2,}( [A-ZŻŹĆĄŚĘŁÓŃa-zżźćńółęąś]{1,}){0,}("|”)$/;
    let isNameAvailable = await checkIfInstitutionNameAvailable();
    let matchesRegex = regExp.test(String(institutionNameInput.value));
    console.log("exists = ",!isNameAvailable, "; matches = ",matchesRegex);
    if(!isNameAvailable && matchesRegex){
        isInstitutionNameValid = true;
        institutionNameInput.style.borderColor = "rgb(8, 185, 16)";
        errorDivName.classList.add("hidden");
        errorDivNameUnavailable.classList.add("hidden");
    } else if (!isNameAvailable && !matchesRegex) {
        isInstitutionNameValid = false;
        institutionNameInput.style.borderColor = "rgb(255,0,0)";
        errorDivName.classList.remove("hidden");
        errorDivNameUnavailable.classList.add("hidden");
        saveInstitutionBtn.classList.add("hidden");
        checkInstitutionFormBtn.classList.remove("hidden");
    } else if (isNameAvailable && matchesRegex) {
        isInstitutionNameValid = false;
        institutionNameInput.style.borderColor = "rgb(255,0,0)";
        errorDivName.classList.add("hidden");
        errorDivNameUnavailable.classList.remove("hidden");
        saveInstitutionBtn.classList.add("hidden");
        checkInstitutionFormBtn.classList.remove("hidden");
    }
}
institutionNameInput.addEventListener("change",validateInstitutionNameAndCheckNameAvailability);

function checkIfInstitutionNameAvailable(){
    if(document.querySelector("#edit-institution-section") == null) {
        const institutionName = institutionNameInput.value
        const apiHost = `http://localhost:8080/api/charity/institutionNameIsAvailable?institutionName=${institutionName}`;
        return fetch(apiHost, {
            method: 'GET',
            headers : {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error(response.statusText);
            }
        }).then(data => {
            return data;
        });
    }
    const institutionName = institutionNameInput.value
    const editInstitutionName = document.querySelector(".edit-institution-name").value;
    const apiHost = `http://localhost:8080/api/charity/institutionNameIsAvailableOrBelongsToEditInstitution?institutionName=${institutionName}&editInstitutionName=${editInstitutionName}`;
    return fetch(apiHost, {
        method: 'GET',
        headers : {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    }).then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error(response.statusText);
        }
    }).then(data => {
        return data;
    });
}

function validateInstitutionCity(){
    const errorDivCity = document.querySelector(".error-div-institution-city");
    const regExp = /^(?=.{3,50}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,}( [A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,})*$/;
    if(regExp.test(String(institutionCityInput.value))){
        isInstitutionCityValid = true;
        institutionCityInput.style.borderColor = "rgb(8, 185, 16)";
        errorDivCity.classList.add("hidden");
    } else {
        isInstitutionCityValid = false;
        institutionCityInput.style.borderColor = "rgb(255,0,0)";
        errorDivCity.classList.remove("hidden");
        saveInstitutionBtn.classList.add("hidden");
        checkInstitutionFormBtn.classList.remove("hidden");
    }
}
institutionCityInput.addEventListener("change", validateInstitutionCity);

function validateInstitutionDescription(){
    const errorDivCity = document.querySelector(".error-div-institution-description");
    const regExp = /^(?!.*,\.)(?=.{3,150}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{0,}(,)? [a-zżźćńółęąś]+(,)?( [a-zżźćńółęąś]+(,)?)+\.$/;
    if(regExp.test(String(institutionDescriptionInput.value))){
        isInstitutionDescriptionValid = true;
        institutionDescriptionInput.style.borderColor = "rgb(8, 185, 16)";
        errorDivCity.classList.add("hidden");
    } else {
        isInstitutionDescriptionValid = false;
        institutionDescriptionInput.style.borderColor = "rgb(255,0,0)";
        errorDivCity.classList.remove("hidden");
        saveInstitutionBtn.classList.add("hidden");
        checkInstitutionFormBtn.classList.remove("hidden");
    }
}
institutionDescriptionInput.addEventListener("change", validateInstitutionDescription);

function checkSpelling(){
    const regExp = /^(?!.*,\.)(?=.{3,150}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{0,}(,)? [a-zżźćńółęąś]+(,)?( [a-zżźćńółęąś]+(,)?)+(\.)?$/;
    const dontForgetTheDotRegex = /^[^.]*$/
    if(regExp.test(String(institutionDescriptionInput.value))){
        isInstitutionDescriptionValid = true;
        institutionDescriptionInput.style.color = "rgb(8, 185, 16)";
        if(dontForgetTheDotRegex.test(institutionDescriptionInput.value) && institutionDescriptionInput.value.length > 15){
            document.querySelector(".error-div-institution-description-dot").classList.remove("hidden");
        } else {
            document.querySelector(".error-div-institution-description-dot").classList.add("hidden");
        }
    } else {
        isInstitutionDescriptionValid = false;
        institutionDescriptionInput.style.color = "rgb(255,0,0)";
        if(dontForgetTheDotRegex.test(institutionDescriptionInput.value) && institutionDescriptionInput.value.length > 10){
            document.querySelector(".error-div-institution-description-dot").classList.remove("hidden");
        } else {
            document.querySelector(".error-div-institution-description-dot").classList.add("hidden");
        }
    }
}
institutionDescriptionInput.addEventListener("keyup", checkSpelling)

async function validateInstitutionForm(){
    await validateInstitutionNameAndCheckNameAvailability();
    validateInstitutionCity();
    validateInstitutionDescription();
    if(isInstitutionNameValid && isInstitutionCityValid && isInstitutionDescriptionValid){
        saveInstitutionBtn.classList.remove("hidden");
        checkInstitutionFormBtn.classList.add("hidden");
    } else {
        saveInstitutionBtn.classList.add("hidden");
        checkInstitutionFormBtn.classList.remove("hidden");
    }
}

checkInstitutionFormBtn.addEventListener("click", validateInstitutionForm);

function submitInstitutionForm(){
    institutionForm.submit();
}
saveInstitutionBtn.addEventListener("click", submitInstitutionForm);











