
const emergencyResetPassword = document.querySelector(".emergency-reset-password");
const emergencyResetConfirmPassword = document.querySelector(".emergency-reset-confirm-password");
const checkPasswordBtn = document.querySelector(".emergency-reset-check-password-btn");
const changePasswordBtn = document.querySelector(".emergency-reset-change-password-btn");

let isValidPassword = false;
let isValidConfirmPassword = false;

function validatePassword(){
    const regExp = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&])(?=\S+$).{8,50}$/;
    const errorDivPassword = document.querySelector(".error-div-emergency-reset-password");
    if(regExp.test(String(emergencyResetPassword.value))){
        isValidPassword = true;
        emergencyResetPassword.style.borderColor = "rgb(8, 185, 16)";
        errorDivPassword.classList.add("hidden");
    } else {
        isValidPassword = false;
        emergencyResetPassword.style.borderColor = "rgb(255,0,0)";
        errorDivPassword.classList.remove("hidden");
    }
    validateConfirmPassword();
}
emergencyResetPassword.addEventListener("change", validatePassword);
emergencyResetPassword.addEventListener("change", validateEmergencyPasswordResetForm);

function validateConfirmPassword(){
    const errorDivConfirmPassword = document.querySelector(".error-div-emergency-reset-confirm-password");
    if(emergencyResetPassword.value === emergencyResetConfirmPassword.value){
        isValidConfirmPassword = true;
        emergencyResetConfirmPassword.style.borderColor = "rgb(8, 185, 16)";
        errorDivConfirmPassword.classList.add("hidden");
    } else {
        isValidConfirmPassword = false;
        emergencyResetConfirmPassword.style.borderColor = "rgb(255,0,0)";
        errorDivConfirmPassword.classList.remove("hidden");
    }
}
emergencyResetConfirmPassword.addEventListener("change", validateConfirmPassword);
emergencyResetConfirmPassword.addEventListener("change", validateEmergencyPasswordResetForm);

function validateEmergencyPasswordResetForm(){
    console.log("validateEmergencyPasswordResetForm");
    validatePassword();
    validateConfirmPassword();
    if(isValidPassword && isValidConfirmPassword){
        changePasswordBtn.classList.remove("hidden");
        checkPasswordBtn.classList.add("hidden");
    } else {
        changePasswordBtn.classList.add("hidden");
        checkPasswordBtn.classList.remove("hidden");
    }
}
checkPasswordBtn.addEventListener("click", validateEmergencyPasswordResetForm);


















