const footerContactName = document.querySelector(".footer-contact-name");
const footerContactSurname = document.querySelector(".footer-contact-surname");
const footerContactMessage = document.querySelector(".footer-contact-message");
const footerContactSendMessageBtn = document.querySelector(".footer-contact-message-send-btn");
const contactForm = document.querySelector("#contact-form");
const userProfileForm = document.querySelector("#user-profile-form");
let contactNameIsValid = false;
let contactSurnameIsValid = false;
let contactMessageIsValid = false;

function validateName(){
    const regExp = /^[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,25}$/;
    const contactErrorDivName = document.querySelector(".contact-error-div-name");
    if(regExp.test(String(footerContactName.value))){
        contactNameIsValid = true;
        footerContactName.style.borderColor = "rgb(8, 185, 16)";
        contactErrorDivName.classList.add("hidden");
    } else {
        contactNameIsValid = false;
        footerContactName.style.borderColor = "rgb(255,0,0)";
        contactErrorDivName.classList.remove("hidden");
    }
    validateContactForm();
}
footerContactName.addEventListener("change", validateName);
footerContactName.addEventListener("keyup", validateName);

function validateSurname(){
    const regExp = /^(?=.{3,25}$)([A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,}(-[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,})?)$/;
    const contactErrorDivSurname = document.querySelector(".contact-error-div-surname");
    if(regExp.test(String(footerContactSurname.value))){
        contactSurnameIsValid = true;
        footerContactSurname.style.borderColor = "rgb(8, 185, 16)";
        contactErrorDivSurname.classList.add("hidden");
    } else {
        contactSurnameIsValid = false;
        footerContactSurname.style.borderColor = "rgb(255,0,0)";
        contactErrorDivSurname.classList.remove("hidden");
    }
    validateContactForm();
}
footerContactSurname.addEventListener("change", validateSurname);
footerContactSurname.addEventListener("keyup", validateSurname);

function validateMessage(){
    const regExpToShort = /^.{15,}$/;
    const regExpToLong = /^.{0,300}$/;
    const contactErrorDivMessageToShort = document.querySelector(".contact-error-div-message-to-short");
    const contactErrorDivMessageToLong = document.querySelector(".contact-error-div-message-to-long");
    if(regExpToShort.test(String(footerContactMessage.value)) && regExpToLong.test(String(footerContactMessage.value))){
        contactMessageIsValid = true;
        footerContactMessage.style.borderColor = "rgb(8, 185, 16)";
        contactErrorDivMessageToShort.classList.add("hidden");
        contactErrorDivMessageToLong.classList.add("hidden");
        validateName();
        validateSurname();
        validateContactForm();
    }
    if(!regExpToShort.test(String(footerContactMessage.value)) && regExpToLong.test(String(footerContactMessage.value))){
        contactMessageIsValid = false;
        footerContactMessage.style.borderColor = "rgb(255,0,0)";
        contactErrorDivMessageToShort.classList.remove("hidden");
        contactErrorDivMessageToLong.classList.add("hidden");
        validateContactForm();
    }
    if(regExpToShort.test(String(footerContactMessage.value)) && !regExpToLong.test(String(footerContactMessage.value))){
        contactMessageIsValid = false;
        footerContactMessage.style.borderColor = "rgb(255,0,0)";
        contactErrorDivMessageToShort.classList.add("hidden");
        contactErrorDivMessageToLong.classList.remove("hidden");
        validateContactForm();
    }
}
footerContactMessage.addEventListener("change", validateMessage);
footerContactMessage.addEventListener("keyup", validateMessage);

function validateContactForm(){
    if (contactNameIsValid && contactSurnameIsValid && contactMessageIsValid){
        footerContactSendMessageBtn.classList.remove("hidden");
    } else {
        footerContactSendMessageBtn.classList.add("hidden");
    }
}

function submitContactForm(){
    contactForm.submit();
}
footerContactSendMessageBtn.addEventListener("click", submitContactForm);















