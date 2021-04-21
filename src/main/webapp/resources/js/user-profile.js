const editProfileBtn = document.querySelector(".edit-profile-btn");
const showProfileBtn = document.querySelector(".show-profile-btn");
const saveProfileChangesBtn = document.querySelector(".save-profile-changes-btn");

function changeProfileDetailsDisplayToNone(){
    this.closest(".container").classList.add("user-info-d-none");
    this.closest(".container").nextElementSibling.classList.remove("user-info-d-none")
}
editProfileBtn.addEventListener("click", changeProfileDetailsDisplayToNone);

function changeProfileEditDisplayToNone(){
    this.closest(".container").classList.add("user-info-d-none");
    this.closest(".container").previousElementSibling.classList.remove("user-info-d-none")
}
showProfileBtn.addEventListener("click", changeProfileEditDisplayToNone)

const updateUserEmail = document.querySelector(".update-user-email");
const updateUserName = document.querySelector(".update-user-name");
const updateUserSurname = document.querySelector(".update-user-surname");
const updateUserPassword = document.querySelector(".update-user-password");
const updateUserConfirmPassword = document.querySelector(".update-user-confirm-password");
const updateUserCheckFormBtn = document.querySelector(".update-user-check-form-btn");

let isValidEmail = false;
let isEmailAvailable = false;
let isValidName = false;
let isValidSurname = false;
let isValidPassword = false;
let isValidConfirmPassword = false;

async function validateEmail(){
    const regExp = /^(?=.{5,60}$)([a-z0-9-_]*\.)*[a-z0-9-_]*@[a-z0-9]*\.[a-z]{2,3}$/;
    const errorDivEmailUnavailable= document.querySelector(".error-div-user-edit-mail-unavailable");
    const errorDivEmailInvalid = document.querySelector(".error-div-user-edit-email-pattern");
    const isAvailable = await checkIfEmailAvailable();
    const matchesRegex = regExp.test(String(updateUserEmail.value))
    if(isAvailable && matchesRegex){
        isValidEmail = true;
        isEmailAvailable = true;
        updateUserEmail.style.borderColor = "rgb(8, 185, 16)";
        errorDivEmailInvalid.classList.add("hidden");
        errorDivEmailUnavailable.classList.add("hidden");
        validateUserUpdateForm()
    } else if (!isAvailable && matchesRegex) {
        isValidEmail = false;
        isEmailAvailable = true;
        updateUserEmail.style.borderColor = "rgb(255,0,0)";
        errorDivEmailInvalid.classList.add("hidden");
        errorDivEmailUnavailable.classList.remove("hidden");
        validateUserUpdateForm()
    } else if(isAvailable && !matchesRegex){
        isValidEmail = true;
        isEmailAvailable = false;
        updateUserEmail.style.borderColor = "rgb(255,0,0)";
        errorDivEmailInvalid.classList.remove("hidden");
        errorDivEmailUnavailable.classList.add("hidden");
        validateUserUpdateForm();
    }
}
updateUserEmail.addEventListener("change", validateEmail);

function checkIfEmailAvailable(){
    const email = updateUserEmail.value;
    const apiHost = `http://localhost:8080/api/charity/emailBelongsToUserOrIsAvailable?email=${email}`;
    return fetch(apiHost, {
        method: 'GET',
        headers : {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    }).then(response => {
        if (response.ok){
            return response.json();
        } else {
            throw new Error(response.statusText);
        }
    }).then(data => {
        return data;
    });
}

function validateName(){
    const regExp = /^[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,25}$/;
    const errorDivName = document.querySelector(".error-div-user-edit-name");
    if(regExp.test(String(updateUserName.value))){
        isValidName = true;
        updateUserName.style.borderColor = "rgb(8, 185, 16)";
        errorDivName.classList.add("hidden");
    } else {
        isValidName = false;
        updateUserName.style.borderColor = "rgb(255,0,0)";
        errorDivName.classList.remove("hidden");
    }
}
updateUserName.addEventListener("change", validateName);

function validateSurname(){
    const regExp = /^(?=.{3,25}$)([A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,}(-[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,})?)$/;
    const errorDivSurname = document.querySelector(".error-div-user-edit-surname");
    if(regExp.test(String(updateUserSurname.value))){
        isValidSurname = true;
        updateUserSurname.style.borderColor = "rgb(8, 185, 16)";
        errorDivSurname.classList.add("hidden");
    } else {
        isValidSurname = false;
        updateUserSurname.style.borderColor = "rgb(255,0,0)";
        errorDivSurname.classList.remove("hidden");
    }
}
updateUserSurname.addEventListener("change", validateSurname);

function validatePassword(){
    const regExp = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&])(?=\S+$).{8,50}$/;
    const errorDivPassword = document.querySelector(".error-div-user-edit-password");
    if(regExp.test(String(updateUserPassword.value))){
        isValidPassword = true;
        updateUserPassword.style.borderColor = "rgb(8, 185, 16)";
        errorDivPassword.classList.add("hidden");
    } else {
        isValidPassword = false;
        updateUserPassword.style.borderColor = "rgb(255,0,0)";
        errorDivPassword.classList.remove("hidden");
    }
    validateConfirmPassword();
}
updateUserPassword.addEventListener("change", validatePassword);

function validateConfirmPassword(){
    const errorDivConfirmPassword = document.querySelector(".error-div-user-edit-confirm-password");
    if(updateUserPassword.value === updateUserConfirmPassword.value){
        isValidConfirmPassword = true;
        updateUserConfirmPassword.style.borderColor = "rgb(8, 185, 16)";
        errorDivConfirmPassword.classList.add("hidden");
    } else {
        isValidConfirmPassword = false;
        updateUserConfirmPassword.style.borderColor = "rgb(255,0,0)";
        errorDivConfirmPassword.classList.remove("hidden");
    }
}
updateUserConfirmPassword.addEventListener("change", validateConfirmPassword);

function validateUserUpdateForm(){
    if(isValidEmail && isValidName && isValidSurname && isValidPassword && isValidConfirmPassword){
        saveProfileChangesBtn.classList.remove("hidden");
        updateUserCheckFormBtn.classList.add("hidden");

    } else {
        saveProfileChangesBtn.classList.add("hidden");
        updateUserCheckFormBtn.classList.remove("hidden");
    }
}
updateUserEmail.addEventListener("change", validateUserUpdateForm);
updateUserName.addEventListener("change", validateUserUpdateForm);
updateUserSurname.addEventListener("change", validateUserUpdateForm);
updateUserPassword.addEventListener("change", validateUserUpdateForm);
updateUserConfirmPassword.addEventListener("change", validateUserUpdateForm);

async function checkFormInputs(){
    await validateEmail();
    validateName();
    validateSurname();
    validatePassword();
    validateConfirmPassword()
}
updateUserCheckFormBtn.addEventListener("click", checkFormInputs);


function submitUserProfileForm(){
    userProfileForm.submit();
}
saveProfileChangesBtn.addEventListener("click", submitUserProfileForm);