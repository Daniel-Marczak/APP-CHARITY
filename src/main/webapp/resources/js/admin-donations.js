const awaitingPickupSection = document.querySelector("#awaiting-pickup-donations");
const collectedSection = document.querySelector("#collected-donations");
const cancelledSection = document.querySelector("#cancelled-donations");
const nonArchivedSection = document.querySelector("#non-archived-donations");
const archivedSection = document.querySelector("#archived-donations");

const awaitingPickupBtn = document.querySelectorAll(".admin-donations-awaiting-pickup-btn");
const collectedBtn = document.querySelectorAll(".admin-donations-collected-btn");
const cancelledBtn = document.querySelectorAll(".admin-donations-cancelled-btn");
const nonArchivedBtn = document.querySelectorAll(".admin-donations-non-archived-btn");
const archivedBtn = document.querySelectorAll(".admin-donations-archived-btn");

function changeDisplay(){
    const elementClasses = this.classList;
    elementClasses
        .forEach(el => el.trim() === 'admin-donations-awaiting-pickup-btn' ? showAwaitingPickup() : false);
    elementClasses
        .forEach(el => el.trim() === 'admin-donations-collected-btn' ? showCollected() : false);
    elementClasses
        .forEach(el => el.trim() === 'admin-donations-cancelled-btn' ? showCancelled() : false);
    elementClasses
        .forEach(el => el.trim() === 'admin-donations-non-archived-btn' ?showNonArchived() : false);
    elementClasses
        .forEach(el => el.trim() === 'admin-donations-archived-btn' ? showArchived() :false);

}

function showAwaitingPickup(){
    awaitingPickupSection.classList.remove("hidden");
    collectedSection.classList.add("hidden");
    cancelledSection.classList.add("hidden");
    nonArchivedSection.classList.add("hidden");
    archivedSection.classList.add("hidden");
}

function showCollected(){
    awaitingPickupSection.classList.add("hidden");
    collectedSection.classList.remove("hidden");
    cancelledSection.classList.add("hidden");
    nonArchivedSection.classList.add("hidden");
    archivedSection.classList.add("hidden");
}

function showCancelled(){
    awaitingPickupSection.classList.add("hidden");
    collectedSection.classList.add("hidden");
    cancelledSection.classList.remove("hidden");
    nonArchivedSection.classList.add("hidden");
    archivedSection.classList.add("hidden");
}

function showNonArchived(){
    awaitingPickupSection.classList.add("hidden");
    collectedSection.classList.add("hidden");
    cancelledSection.classList.add("hidden");
    nonArchivedSection.classList.remove("hidden");
    archivedSection.classList.add("hidden");
}

function showArchived(){
    awaitingPickupSection.classList.add("hidden");
    collectedSection.classList.add("hidden");
    cancelledSection.classList.add("hidden");
    nonArchivedSection.classList.add("hidden");
    archivedSection.classList.remove("hidden");
}

awaitingPickupBtn.forEach(btn => btn.addEventListener("click", changeDisplay));
collectedBtn.forEach(btn => btn.addEventListener("click", changeDisplay));
cancelledBtn.forEach(btn => btn.addEventListener("click", changeDisplay));
nonArchivedBtn.forEach(btn => btn.addEventListener("click", changeDisplay));
archivedBtn.forEach(btn => btn.addEventListener("click", changeDisplay));





