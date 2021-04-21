const inputCollector = document.querySelector(".input-collector");
inputCollector.addEventListener("click", printCollectedData)

const donationForm = document.querySelector(".donation-form");
const submitDonationBtn = document.querySelector(".submit-donation-btn");

const inputCategories = document.querySelectorAll(".input-categories");
const inputQuantity = document.querySelector(".input-quantity");
const inputInstitutionNameAndCity = document.querySelectorAll(".input-institution");
const inputStreet = document.querySelector(".input-street");
const inputCity = document.querySelector(".input-city");
const inputZipCode = document.querySelector(".input-zipCode");
const inputPhone = document.querySelector(".input-phone");
const inputPickupDate = document.querySelector(".input-pickUpDate");
const inputPickupTime = document.querySelector(".input-pickUpTime");
const inputPickupComment = document.querySelector(".input-pickUpComment");

const summaryQuantity = document.querySelector(".summary-quantity");
const summaryItems =  document.querySelector(".summary-items");
const summaryBeneficiaryName = document.querySelector(".summary-beneficiary-name");
const summaryBeneficiaryCity = document.querySelector(".summary-beneficiary-city");
const summaryStreet = document.querySelector(".summary-address-street");
const summaryCity = document.querySelector(".summary-address-city");
const summaryZipCode = document.querySelector(".summary-address-zipCode");
const summaryPhone = document.querySelector(".summary-phone");
const summaryPickUpDate = document.querySelector(".summary-pickUp-date");
const summaryPickUpTime = document.querySelector(".summary-pickUp-time");
const summaryNotes = document.querySelector(".summary-notes");

function printCollectedData(e){
    e.preventDefault();
    summaryQuantity.innerText = inputQuantity.value;

    let summaryItemsString = "";
    inputCategories.forEach(el => {
        if (el.checked){
            summaryItemsString += el.getAttribute("title") + ", ";
        }
    });
    summaryItems.innerText = summaryItemsString;

    inputInstitutionNameAndCity.forEach(el => {
        if (el.checked){
            summaryBeneficiaryName.innerText = el.dataset.instName
            summaryBeneficiaryCity.innerText = el.dataset.instCity
        }
    });
    summaryStreet.innerText = inputStreet.value;
    summaryCity.innerText = inputCity.value;
    summaryZipCode.innerText = inputZipCode.value;
    summaryPhone.innerText = inputPhone.value;
    summaryPickUpDate.innerText = inputPickupDate.value;
    summaryPickUpTime.innerText = inputPickupTime.value;
    summaryNotes.innerText = inputPickupComment.value;
}

const firstNextStepBtn = document.querySelector(".first-next-step-btn");
const secondNextStepBtn = document.querySelector(".second-next-step-btn");
const thirdNextStepBtn = document.querySelector(".third-next-step-btn");
const fourthNextStepBtn = document.querySelector(".fourth-next-step-btn");

inputCategories.forEach(
    el => el.addEventListener("click", showFirstNextStepBtn)
)

function showFirstNextStepBtn(){
    let atLeastOneIsChecked = false;
    inputCategories.forEach(
        el => el.checked ? atLeastOneIsChecked = true : false
    )
    if (atLeastOneIsChecked){
        firstNextStepBtn.classList.remove("hidden");
    } else {
        firstNextStepBtn.classList.add("hidden");
    }
}

inputQuantity.addEventListener("change", showSecondNextStepBtn)

function showSecondNextStepBtn(){
    if(inputQuantity.value > 0){
        secondNextStepBtn.classList.remove("hidden");
    } else {
        secondNextStepBtn.classList.add("hidden");
    }
}

inputInstitutionNameAndCity.forEach(
    el => el.addEventListener("click", showThirdNextStepBtn)
)

function showThirdNextStepBtn(){
    let atLeastOneIsChecked = false;
    inputInstitutionNameAndCity.forEach(
        el => el.checked ? atLeastOneIsChecked = true : false
    )
    if (atLeastOneIsChecked){
        thirdNextStepBtn.classList.remove("hidden");
    } else {
        thirdNextStepBtn.classList.add("hidden");
    }
}

inputStreet.addEventListener("change", validateStreet);
inputStreet.addEventListener("change", showFourthNextStepBtn);
inputCity.addEventListener("change", validateCity);
inputCity.addEventListener("change", showFourthNextStepBtn);
inputZipCode.addEventListener("change", validateZipCode);
inputZipCode.addEventListener("change", showFourthNextStepBtn);
inputPhone.addEventListener("change", validatePhoneNumber);
inputPhone.addEventListener("change", showFourthNextStepBtn);
inputPickupDate.addEventListener("change", validateDate);
inputPickupDate.addEventListener("change", showFourthNextStepBtn);
inputPickupTime.addEventListener("change", validateTime);
inputPickupTime.addEventListener("change", showFourthNextStepBtn);

let isValidStreet = false;
let isValidCity = false;
let isValidZipCode = false;
let isValidPhone = false;
let isValidDate = false;
let isValidTime = false;

function validateStreet(){
    const errorDivStreet = document.querySelector(".error-div-street");
    const regExp = /^(?=.{3,50}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{3,} ([A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{1,} )*[1-9]{1}[0-9]{0,2}([a-zA-Z]?)?(\/[1-9]{1}[0-9]{0,2}([a-zA-Z]?)?)?$/
    if(regExp.test(String(inputStreet.value))){
        inputStreet.style.borderColor = "rgb(8, 185, 16)";
        isValidStreet = true;
        errorDivStreet.classList.add("hidden");
    } else {
        isValidStreet = false;
        inputStreet.style.borderColor = "rgb(255,0,0)";
        errorDivStreet.classList.remove("hidden");
    }
}

function validateCity(){
    const errorDivCity = document.querySelector(".error-div-city");
    const regExp = /^(?=.{3,50}$)[A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,}( [A-ZŻŹĆĄŚĘŁÓŃ]{1}[a-zżźćńółęąś]{2,})*$/
    if(regExp.test(String(inputCity.value))){
        inputCity.style.borderColor = "rgb(8, 185, 16)";
        isValidCity = true;
        errorDivCity.classList.add("hidden");
    } else {
        isValidCity = false;
        inputCity.style.borderColor = "rgb(255,0,0)";
        errorDivCity.classList.remove("hidden");
    }
}

function validateZipCode(){
    const errorDivZipCode = document.querySelector(".error-div-postcode");
    const regExp = /^[0-9]{2}-[0-9]{3}$/
    if(regExp.test(String(inputZipCode.value))){
        isValidZipCode = true;
        inputZipCode.style.borderColor = "rgb(8, 185, 16)";
        errorDivZipCode.classList.add("hidden");
    } else {
        isValidZipCode = false;
        inputZipCode.style.borderColor = "rgb(255,0,0)";
        errorDivZipCode.classList.remove("hidden");
    }
}

function validatePhoneNumber(){
    const errorDivNumber = document.querySelector(".error-div-phone");
    const regExp = /^[1-9]{2} [1-9]{1}[0-9]{2}-[0-9]{2}-[0-9]{2}$|^[1-9]{1}[0-9]{2}-[0-9]{3}-[0-9]{3}$/
    if(regExp.test(String(inputPhone.value))){
        isValidPhone = true;
        inputPhone.style.borderColor = "rgb(8, 185, 16)";
        errorDivNumber.classList.add("hidden");
    } else {
        isValidPhone = false;
        inputPhone.style.borderColor = "rgb(255,0,0)";
        errorDivNumber.classList.remove("hidden");
    }
}

function validateDate(){
    const errorDivDate = document.querySelector(".error-div-date");
    const inputDate = inputPickupDate.value;
    const currentDate = new Date().toISOString().slice(0, 10);
    const regExp = /^([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))$/;
    const dayOfWeek = new Date(inputDate).getDay();
    if(regExp.test(String(inputDate)) && inputDate > currentDate && dayOfWeek !== 6 && dayOfWeek !== 0){
        isValidDate = true;
        inputPickupDate.style.borderColor = "rgb(8, 185, 16)";
        errorDivDate.classList.add("hidden");
    }else {
        isValidDate = false;
        inputPickupDate.style.borderColor = "rgb(255,0,0)";
        errorDivDate.classList.remove("hidden");
    }
}

function validateTime(){
    const errorDivTime = document.querySelector(".error-div-time");
    const inputTime = inputPickupTime.value;
    const minTime = '07:59';
    const maxTime = '21:01';
    const regExp = /^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/
    if(regExp.test(String(inputTime)) && inputTime > minTime && inputTime < maxTime){
        isValidTime = true;
        inputPickupTime.style.borderColor = "rgb(8, 185, 16)";
        errorDivTime.classList.add("hidden");
    } else {
        isValidTime = false;
        inputPickupTime.style.borderColor = "rgb(255,0,0)";
        errorDivTime.classList.remove("hidden");
    }
}

function showFourthNextStepBtn(){
    if (isValidStreet && isValidCity && isValidZipCode && isValidPhone && isValidDate && isValidTime){
        fourthNextStepBtn.classList.remove("hidden");
        if(document.querySelector(".donation-edit-confirm-address-and-date") !== null){
            document.querySelector(".donation-edit-confirm-address-and-date").classList.add("hidden");
        }
    } else {
        fourthNextStepBtn.classList.add("hidden");
        if(document.querySelector(".donation-edit-confirm-address-and-date") !== null){
            document.querySelector(".donation-edit-confirm-address-and-date").classList.remove("hidden");
        }
    }
}

if(document.querySelector(".donation-edit-confirm-address-and-date") !== null){
    const donationEditConfirmAddressAndDateBtn = document.querySelector(".donation-edit-confirm-address-and-date")
    donationEditConfirmAddressAndDateBtn.addEventListener("click", checkEditDonationAddressAndDate);

}

function checkEditDonationAddressAndDate(){
    validateStreet();
    validateCity();
    validateZipCode();
    validatePhoneNumber();
    validateDate();
    validateTime();
    showFourthNextStepBtn();
}

function submitDonationForm(){
    donationForm.submit();
}
submitDonationBtn.addEventListener("click", submitDonationForm);
