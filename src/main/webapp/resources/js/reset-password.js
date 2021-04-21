const resetPasswordEmailInput = document.querySelector("#reset-password-email");
const notRobotCheckboxDiv = document.querySelector("#not-robot-checkbox-div");
const notRobotCheckbox = document.querySelector("#not-robot-checkbox");
const enterResultDiv = document.querySelector("#enter-result-div");
const resultInput = document.querySelector("#result-input");
const resetPasswordBtn = document.querySelector("#reset-password-btn");
const labelNumberA = document.querySelector(".number-a");
const labelNumberB = document.querySelector(".number-b");
const labelOperation = document.querySelector(".operation");
const forgotPasswordForm = document.querySelector("#forgot-password-form");
let parameterA = document.querySelector(".parameter-a");
let parameterB = document.querySelector(".parameter-b");
let operator = document.querySelector(".operator");
const operations = ['+', '-', "*"];
let numberA = 0 ;
let numberB = 0;
let operation = "";

function validateEmail(email) {
    const regExp = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$/;
    return regExp.test(String(email).toLowerCase());
}

function validate(){
    if(validateEmail(resetPasswordEmailInput.value)){
        resetPasswordEmailInput.style.color = "rgb(8, 185, 16)";
        notRobotCheckboxDiv.classList.remove("hidden");
    } else {
        resetPasswordEmailInput.style.color = "red";
        notRobotCheckboxDiv.classList.add("hidden");
    }
}
resetPasswordEmailInput.addEventListener("keyup", validate);
resetPasswordEmailInput.addEventListener("change", validate);

function checkIfCheckboxIsChecked(){
    if (this.checked){
        enterResultDiv.classList.remove("hidden");
        resetPasswordEmailInput.readOnly = true;
        numberA = Math.floor(Math.random() * 10);
        numberB = Math.floor(Math.random() * 10);
        operation = operations[Math.floor(Math.random() * 3)];
        labelNumberA.innerText = numberA;
        labelOperation.innerText = operation;
        labelNumberB.innerText = numberB;
        parameterA.value = numberA;
        parameterB.value = numberB;
        operator.value = operation;
    } else {
        enterResultDiv.classList.add("hidden");
        resetPasswordBtn.classList.add("hidden");
        resetPasswordEmailInput.readOnly = false;
        resultInput.readOnly = false;
        resultInput.value = "";
    }
}
notRobotCheckbox.addEventListener("click", checkIfCheckboxIsChecked);

function submitForgotPasswordForm(){
    forgotPasswordForm.submit();
}
resetPasswordBtn.addEventListener("click", submitForgotPasswordForm);

function checkResult(){
    if(eval(numberA + operation + numberB) === Number(resultInput.value)){
        resetPasswordBtn.classList.remove("hidden");
        notRobotCheckbox.disabled = true;
        resultInput.readOnly = true;
        resultInput.style.color = "rgb(8, 185, 16)";
    } else {
        resetPasswordBtn.classList.add("hidden");
        resultInput.style.color = "red";
    }
}
resultInput.addEventListener("keyup", checkResult);
resultInput.addEventListener("change", checkResult);



