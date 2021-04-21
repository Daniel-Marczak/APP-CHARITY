const usersEnabledTrueSection = document.querySelector("#admin-users-enabled-true");
const usersEnabledFalseSection = document.querySelector("#admin-users-enabled-false");


const enabledTrueBtn = document.querySelectorAll(".admin-users-enabled-true-btn");
const enabledFalseBtn = document.querySelectorAll(".admin-users-enabled-false-btn");


function changeDisplay(){
    const elementClasses = this.classList;
    elementClasses
        .forEach(el => el.trim() === 'admin-users-enabled-true-btn' ? showEnabledTrue() : false);
    elementClasses
        .forEach(el => el.trim() === 'admin-users-enabled-false-btn' ? showEnabledFalse() : false);
}

function showEnabledTrue(){
    usersEnabledTrueSection.classList.remove("hidden");
    usersEnabledFalseSection.classList.add("hidden");
}

function showEnabledFalse(){
    usersEnabledTrueSection.classList.add("hidden");
    usersEnabledFalseSection.classList.remove("hidden");
}


enabledTrueBtn.forEach(btn => btn.addEventListener("click", changeDisplay));
enabledFalseBtn.forEach(btn => btn.addEventListener("click", changeDisplay));






