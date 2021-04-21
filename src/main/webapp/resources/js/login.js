const loginForm = document.querySelector("#login-form");
const loginEmail =document.querySelector("[name='email']");
const loginPassword =document.querySelector("[name='password']");
const loginBtn = document.querySelector(".login-btn");
const errorDivLoginAndPassword = document.querySelector("#error-div-login-and-password");

let isFormFilledIn = false;

function validateLoginForm(){
    if ((loginEmail.value.length > 4 && loginPassword.value.length > 7)){
        loginForm.submit();
    } else {
        errorDivLoginAndPassword.classList.remove("hidden");
    }
}

loginBtn.addEventListener("click", validateLoginForm);



