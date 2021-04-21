const registrationInputEmail = document.querySelector("#registration-input-email");
const registrationInputName = document.querySelector("#registration-input-name");
const registrationInputSurname = document.querySelector("#registration-input-surname");
const registrationInputPassword = document.querySelector("#registration-input-password");
const registrationInputConfirmPassword = document.querySelector("#registration-input-confirm-password");
const registrationSubmitBtn = document.querySelector("#registration-submit-btn");
const registrationCheckFormBtn = document.querySelector("#registration-ready-btn");
const registrationForm = document.querySelector("#registration-form");

let isValidEmail = false;
let isEmailAvailable = false;
let isValidName = false;
let isValidSurname = false;
let isValidPassword = false;
let isValidConfirmPassword = false;

async function validateEmail() {
    const regExp = /^(?=.{5,60}$)([a-z0-9-_]*\.)*[a-z0-9-_]*@[a-z0-9]*\.[a-z]{2,3}$/;
    const errorDivEmailUnavailable = document.querySelector("#error-div-email-unavailable");
    const errorDivEmailInvalid = document.querySelector("#error-div-email-pattern");
    const isAvailable = await checkIfEmailAvailable();
    const matchesRegex = regExp.test(String(registrationInputEmail.value));
    if (isAvailable && matchesRegex) {
        isValidEmail = true;
        isEmailAvailable = true;
        registrationInputEmail.style.borderColor = "rgb(8, 185, 16)";
        errorDivEmailInvalid.classList.add("hidden");
        errorDivEmailUnavailable.classList.add("hidden");
        validateRegistrationForm();
    } else if (!isAvailable && matchesRegex) {
        isValidEmail = false;
        isEmailAvailable = true;
        registrationInputEmail.style.borderColor = "rgb(255,0,0)";
        errorDivEmailInvalid.classList.add("hidden");
        errorDivEmailUnavailable.classList.remove("hidden");
        validateRegistrationForm();
    } else if (isAvailable && !matchesRegex) {
        isValidEmail = true;
        isEmailAvailable = false;
        registrationInputEmail.style.borderColor = "rgb(255,0,0)";
        errorDivEmailInvalid.classList.remove("hidden");
        errorDivEmailUnavailable.classList.add("hidden");
        validateRegistrationForm();
    }
}
registrationInputEmail.addEventListener("change", validateEmail);

function checkIfEmailAvailable() {
    const email = registrationInputEmail.value
    const apiHost = `http://localhost:8080/api/charity/isEmailAvailable?email=${email}`;
    return fetch(apiHost, {
        method: 'GET',
        headers: {
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

function validateName() {
    const regExp = /^[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,25}$/;
    const errorDivName = document.querySelector("#error-div-name");
    if (regExp.test(String(registrationInputName.value))) {
        isValidName = true;
        registrationInputName.style.borderColor = "rgb(8, 185, 16)";
        errorDivName.classList.add("hidden");
    } else {
        isValidName = false;
        registrationInputName.style.borderColor = "rgb(255,0,0)";
        errorDivName.classList.remove("hidden");
    }
}

registrationInputName.addEventListener("change", validateName);

function validateSurname() {
    const regExp = /^(?=.{3,25}$)([A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,}(-[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,})?)$/;
    const errorDivSurname = document.querySelector("#error-div-surname");
    if (regExp.test(String(registrationInputSurname.value))) {
        isValidSurname = true;
        registrationInputSurname.style.borderColor = "rgb(8, 185, 16)";
        errorDivSurname.classList.add("hidden");
    } else {
        isValidSurname = false;
        registrationInputSurname.style.borderColor = "rgb(255,0,0)";
        errorDivSurname.classList.remove("hidden");
    }
}
registrationInputSurname.addEventListener("change", validateSurname);

function validatePassword() {
    const regExp = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&])(?=\S+$).{8,50}$/;
    const errorDivPassword = document.querySelector("#error-div-password");
    if (regExp.test(String(registrationInputPassword.value))) {
        isValidPassword = true;
        registrationInputPassword.style.borderColor = "rgb(8, 185, 16)";
        errorDivPassword.classList.add("hidden");
    } else {
        isValidPassword = false;
        registrationInputPassword.style.borderColor = "rgb(255,0,0)";
        errorDivPassword.classList.remove("hidden");
    }
    validateConfirmPassword();
}
registrationInputPassword.addEventListener("change", validatePassword);

function validateConfirmPassword() {
    const errorDivConfirmPassword = document.querySelector("#error-div-confirm-password");
    if (registrationInputPassword.value === registrationInputConfirmPassword.value) {
        isValidConfirmPassword = true;
        registrationInputConfirmPassword.style.borderColor = "rgb(8, 185, 16)";
        errorDivConfirmPassword.classList.add("hidden");
    } else {
        isValidConfirmPassword = false;
        registrationInputConfirmPassword.style.borderColor = "rgb(255,0,0)";
        errorDivConfirmPassword.classList.remove("hidden");
    }
}
registrationInputConfirmPassword.addEventListener("change", validateConfirmPassword);

function validateRegistrationForm() {
    if (isValidEmail && isValidName && isValidSurname && isValidPassword && isValidConfirmPassword) {
        registrationSubmitBtn.classList.remove("hidden");
        registrationCheckFormBtn.classList.add("hidden");

    } else {
        registrationSubmitBtn.classList.add("hidden");
        registrationCheckFormBtn.classList.remove("hidden");
    }
}
registrationCheckFormBtn.addEventListener("click", checkFormInputs);

async function checkFormInputs() {
    await validateEmail();
    validateName();
    validateSurname();
    validatePassword();
    validateConfirmPassword();
}

function submitRegistrationForm(){
    registrationForm.submit();
}
registrationSubmitBtn.addEventListener("click", submitRegistrationForm);

registrationInputEmail.addEventListener("change", validateRegistrationForm);
registrationInputName.addEventListener("change", validateRegistrationForm);
registrationInputSurname.addEventListener("change", validateRegistrationForm);
registrationInputPassword.addEventListener("change", validateRegistrationForm);
registrationInputConfirmPassword.addEventListener("change", validateRegistrationForm);








