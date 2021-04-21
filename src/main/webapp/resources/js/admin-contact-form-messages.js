const unreadMessages = document.querySelector("#unread-contact-form-messages");
const readMessages = document.querySelector("#read-contact-form-messages");
const archivedMessages = document.querySelector("#archived-contact-form-messages");

const unreadMessagesBtn = document.querySelectorAll(".admin-messages-unread-btn");
const readMessagesBtn = document.querySelectorAll(".admin-messages-read-btn");
const archivedMessagesBtn = document.querySelectorAll(".admin-messages-archived-btn");

function changeDisplay(){
    const elementClasses = this.classList;
    elementClasses
        .forEach(el => el.trim() === 'admin-messages-unread-btn' ? showUnread() : false);
    elementClasses
        .forEach(el => el.trim() === 'admin-messages-read-btn' ? showRead() : false);
    elementClasses
        .forEach(el => el.trim() === 'admin-messages-archived-btn' ? showArchived() : false);
}

function showUnread(){
    unreadMessages.classList.remove("hidden");
    readMessages.classList.add("hidden");
    archivedMessages.classList.add("hidden");
}

function showRead(){
    unreadMessages.classList.add("hidden");
    readMessages.classList.remove("hidden");
    archivedMessages.classList.add("hidden");
}

function showArchived(){
    unreadMessages.classList.add("hidden");
    readMessages.classList.add("hidden");
    archivedMessages.classList.remove("hidden");
}

unreadMessagesBtn.forEach(btn => btn.addEventListener("click", changeDisplay));
readMessagesBtn.forEach(btn => btn.addEventListener("click", changeDisplay));
archivedMessagesBtn.forEach(btn => btn.addEventListener("click", changeDisplay));




