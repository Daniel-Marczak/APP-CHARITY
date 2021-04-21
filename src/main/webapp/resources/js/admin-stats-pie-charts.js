////////////////////////////////////////////////////////COMMON//////////////////////////////////////////////////////////
const chartInstitutionText = document.querySelector("#chart-institution-text").innerText;
const chartInstitutionTextActive = document.querySelector("#chart-institution-text-active").innerText;
const chartInstitutionTextInactive = document.querySelector("#chart-institution-text-inactive").innerText;
const chartDonationText = document.querySelector("#chart-donation-text").innerText;
const chartDonationTextAwaiting = document.querySelector("#chart-donation-text-awaiting").innerText;
const chartDonationTextCollected = document.querySelector("#chart-donation-text-collected").innerText;
const chartDonationTextCancelled = document.querySelector("#chart-donation-text-cancelled").innerText;
const chartDonationTextUnarchived = document.querySelector("#chart-donation-text-unarchived").innerText;
const chartDonationTextArchived = document.querySelector("#chart-donation-text-archived").innerText;
const chartUserText = document.querySelector("#chart-users-text").innerText;
const chartUserTextActive = document.querySelector("#chart-users-text-active").innerText;
const chartUserTextSuspended = document.querySelector("#chart-users-text-suspended").innerText;
const chartAdminText = document.querySelector("#chart-admin-text").innerText;
const chartAdminTextActive = document.querySelector("#chart-admin-text-active").innerText;
const chartAdminTextSuspended = document.querySelector("#chart-admin-text-suspended").innerText;
const chartMessageText = document.querySelector("#chart-messages-text").innerText;
const chartMessageTextUnread = document.querySelector("#chart-messages-text-unread").innerText;
const chartMessageTextRead = document.querySelector("#chart-messages-text-read").innerText;
const chartMessageTextArchived = document.querySelector("#chart-messages-text-archived").innerText;

const plugin = {
    id: 'custom_canvas_background_color',
    beforeDraw: (chart) => {
        const ctx = chart.canvas.getContext('2d');
        ctx.save();
        ctx.globalCompositeOperation = 'destination-over';
        ctx.fillStyle = 'rgb(255, 255, 255)';
        ctx.fillRect(0, 0, chart.width, chart.height);
        ctx.restore();
    }
};

function addData(chart, labels, dataSet) {
    labels.forEach( el => chart.data.labels.push(el) );
    dataSet.forEach( el => chart.data.datasets.forEach((dataset) => { dataset.data.push(el) }));
    chart.update();
}

function removeData(chart, numberOfLabels) {
    for (let i = 0; i < numberOfLabels; i++) {
        chart.data.labels.pop();
        chart.data.datasets.forEach((dataset) => { dataset.data.pop(); });
    }
    chart.update();
}

const institutionInterval = setInterval(updateInstitutionChart, 1000);
const donationInterval = setInterval(updateDonationChart, 1000);
const userInterval = setInterval(updateUserChart, 1000);
const adminInterval = setInterval(updateAdminChart, 1000);
const messageInterval = setInterval(updateMessagesChart, 1000);

//////////////////////////////////////////////////////INSTITUTION///////////////////////////////////////////////////////

let institutionLabels = [chartInstitutionTextActive,chartInstitutionTextInactive];
let institutionDataSet = [1, 0];
let updatedInstitutionDataSet = [null, null];

async function updateInstitutionChart(){
    institutionDataSet = await countInstitutionsByEnabled();
    if (updatedInstitutionDataSet[0] === null || updatedInstitutionDataSet[0] !== institutionDataSet[0] ||
        updatedInstitutionDataSet[1] !== institutionDataSet[1]
    ) {
        removeData(institutionChart, 2);
        addData(institutionChart, institutionLabels, institutionDataSet);
        updatedInstitutionDataSet = institutionDataSet;
    }
}

function countInstitutionsByEnabled(){
    const apiHost = `http://localhost:8080/api/charity/countInstitutionsByStatus`;
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

let institutionChartCanvas = document.querySelector("#institution-chart").getContext('2d');
let institutionChart = new Chart(institutionChartCanvas, {
    type: 'doughnut',
    plugins: [plugin],
    data: {
        labels: [
            chartInstitutionTextActive,
            chartInstitutionTextInactive
        ],
        datasets: [{
            data: [1, 0],
            backgroundColor: [
                'rgb(76, 175, 80)',
                'rgb(244, 67, 54)'
            ],
            hoverBackgroundColor: [
                'rgb(56, 142, 60)',
                'rgb(198, 40, 40)'
            ],
        }],
    },
    options: {
        radius: 85,
        cutout: '75%',
        rotation: 180,
        hoverOffset: 4,
        animation: {
            animateScale: true,
        },
        layout: {
            padding: {
                bottom: 25
            }
        },
        plugins: {
            title:{
                text: chartInstitutionText,
                display: true,
                position: 'top',
                color: 'rgb(75,75,75)',
                font: {
                    style: 'bold',
                    size: 20,
                }
            },
            legend: {
                position: 'bottom',
                display: true,
                labels: {
                    color: 'rgb(75,75,75)',
                    boxWidth: 15,
                    boxHeight: 15,
                    font: {
                        size: 12,
                    }
                },
            },
        },
        maintainAspectRatio: true,
    }
});

//////////////////////////////////////////////////////DONATION//////////////////////////////////////////////////////////

let donationLabels = [
    chartDonationTextAwaiting,
    chartDonationTextCollected,
    chartDonationTextCancelled,
    chartDonationTextUnarchived,
    chartDonationTextArchived
];
let donationDataSet = [1, 2, 3, 4, 5];
let updatedDonationDataSet = [null, null, null, null, null];

async function updateDonationChart(){
    donationDataSet = await countDonationsByStatus();
    if (updatedInstitutionDataSet[0] === null || updatedDonationDataSet[0] !== donationDataSet[0] ||
        updatedDonationDataSet[1] !== donationDataSet[1] || updatedDonationDataSet[2] !== donationDataSet[2] ||
        updatedDonationDataSet[3] !== donationDataSet[3] || updatedDonationDataSet[4] !== donationDataSet[4]
    ) {
        removeData(donationChart, 5);
        addData(donationChart, donationLabels, donationDataSet);
        updatedDonationDataSet = donationDataSet;
    }
}

function countDonationsByStatus(){
    const apiHost = `http://localhost:8080/api/charity/countDonationsByStatus`;
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

let donationChartCanvas = document.querySelector("#donation-chart").getContext('2d');
let donationChart = new Chart(donationChartCanvas, {
    type: 'doughnut',
    plugins: [plugin],
    data: {
        labels: [
            chartDonationTextAwaiting,
            chartDonationTextCollected,
            chartDonationTextCancelled,
            chartDonationTextUnarchived,
            chartDonationTextArchived
        ],
        datasets: [{
            data: [0, 1, 0, 0, 0],
            backgroundColor: [
                'rgb(253, 216, 53)',
                'rgb(76, 175, 80)',
                'rgb(244, 67, 54)',
                'rgb(120, 144, 156)',
                'rgb(69, 90, 100)'
            ],
            hoverBackgroundColor: [
                'rgb(251, 192, 45)',
                'rgb(56, 142, 60)',
                'rgb(198, 40, 40)',
                'rgb(84, 110, 122)',
                'rgb(38, 50, 56 )'
            ],
        }]
    },
    options: {
        radius: 85,
        cutout: '75%',
        rotation: 180,
        hoverOffset: 4,
        animation: {
            animateScale: true,
        },
        plugins: {
            title:{
                text: chartDonationText,
                display: true,
                position: 'top',
                color: 'rgb(75,75,75)',
                font: {
                    style: 'bold',
                    size: 20,
                }
            },
            legend: {
                position: 'bottom',
                display: true,
                labels: {
                    color: 'rgb(75,75,75)',
                    boxWidth: 15,
                    boxHeight: 15,
                    font: {
                        size: 12,
                    }
                },
            },
        },
        maintainAspectRatio: true,
    }
});

//////////////////////////////////////////////////////User//////////////////////////////////////////////////////////////

let userLabels = [chartUserTextActive, chartUserTextSuspended];
let userDataSet = [1, 0];
let updatedUserDataSet = [null, null];

async function updateUserChart(){
    userDataSet = await countUsersByEnabled();
    if(updatedUserDataSet[0] === null || updatedUserDataSet[0] !== userDataSet[0] ||
        updatedUserDataSet[1] !== userDataSet[1]
    ){
        removeData(userChart, 2);
        addData(userChart, userLabels, userDataSet);
        updatedUserDataSet = userDataSet;
    }
}

function countUsersByEnabled(){
    const apiHost = `http://localhost:8080/api/charity/countUsersByEnabled`;
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

let userChartCanvas = document.querySelector("#user-chart").getContext('2d');
let userChart = new Chart(userChartCanvas, {
    type: 'doughnut',
    plugins: [plugin],
    data: {
        labels: [
            chartUserTextActive,
            chartUserTextSuspended
        ],
        datasets: [{
            data: [1, 0],
            backgroundColor: [
                'rgb(76, 175, 80)',
                'rgb(244, 67, 54)'
            ],
            hoverBackgroundColor: [
                'rgb(56, 142, 60)',
                'rgb(198, 40, 40)'
            ],
        }]
    },
    options: {
        radius: 85,
        cutout: '75%',
        rotation: 180,
        hoverOffset: 4,
        animation: {
            animateScale: true,
        },
        layout: {
            padding: {
                bottom: 25
            }
        },
        plugins: {
            title:{
                text: chartUserText,
                display: true,
                position: 'top',
                color: 'rgb(75,75,75)',
                font: {
                    style: 'bold',
                    size: 20,
                }
            },
            legend: {
                position: 'bottom',
                display: true,
                labels: {
                    color: 'rgb(75,75,75)',
                    boxWidth: 15,
                    boxHeight: 15,
                    font: {
                        size: 12,
                    }
                },
            },
        },
        maintainAspectRatio: true,
    }
});

//////////////////////////////////////////////////////ADMIN/////////////////////////////////////////////////////////////

let adminLabels = [chartAdminTextActive, chartAdminTextSuspended];
let adminDataSet = [1, 0];
let updatedAdminDataSet = [null, null];

async function updateAdminChart(){
    adminDataSet = await countAdminsByEnabled();
    if(updatedAdminDataSet[0] === null || updatedAdminDataSet[0] !== adminDataSet[0] ||
        updatedAdminDataSet[1] !== adminDataSet[1]
    ) {
        removeData(adminChart, 2);
        addData(adminChart, adminLabels, adminDataSet);
        updatedAdminDataSet = adminDataSet;
    }
}

function countAdminsByEnabled(){
    const apiHost = `http://localhost:8080/api/charity/countAdminsByEnabled`;
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

let adminChartCanvas = document.querySelector("#admin-chart").getContext('2d');
let adminChart = new Chart(adminChartCanvas, {
    type: 'doughnut',
    plugins:[ plugin],
    data: {
        labels: [
            chartAdminTextActive,
            chartAdminTextSuspended
        ],
        datasets: [{
            data: [1, 0],
            backgroundColor: [
                'rgb(76, 175, 80)',
                'rgb(244, 67, 54)'
            ],
            hoverBackgroundColor: [
                'rgb(56, 142, 60)',
                'rgb(198, 40, 40)'
            ],
        }]
    },
    options: {
        radius: 85,
        cutout: '75%',
        rotation: 180,
        hoverOffset: 4,
        animation: {
            animateScale: true,
        },
        layout: {
            padding: {
                bottom: 25
            }
        },
        plugins: {
            title:{
                text: chartAdminText,
                display: true,
                position: 'top',
                color: 'rgb(75,75,75)',
                font: {
                    style: 'bold',
                    size: 20,
                }
            },
            legend: {
                position: 'bottom',
                display: true,
                labels: {
                    color: 'rgb(75,75,75)',
                    boxWidth: 15,
                    boxHeight: 15,
                    font: {
                        size: 12,
                    }
                },
            },
        },
        maintainAspectRatio: true,
    }
});

//////////////////////////////////////////////////////MESSAGES//////////////////////////////////////////////////////////

let messagesLabels = [chartMessageTextUnread, chartMessageTextRead, chartMessageTextArchived];
let messagesDataSet = [1, 0];
let updatedMessagesDataSet = [null, null, null];

async function updateMessagesChart(){
    messagesDataSet = await countMessagesByStatus();
    if(updatedMessagesDataSet[0] === null || updatedMessagesDataSet[0] !== messagesDataSet[0] ||
        updatedMessagesDataSet[1] !== messagesDataSet[1] || updatedMessagesDataSet[2] !== messagesDataSet[2]
    ) {
        removeData(messageChart, 3);
        addData(messageChart, messagesLabels, messagesDataSet);
        updatedMessagesDataSet = messagesDataSet;
    }
}

function countMessagesByStatus(){
    const apiHost = `http://localhost:8080/api/charity/countMessagesByStatus`;
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

let messageChartCanvas = document.querySelector("#message-chart").getContext('2d');
let messageChart = new Chart(messageChartCanvas, {
    type: 'doughnut',
    plugins:[ plugin],
    data: {
        labels: [
            chartMessageTextUnread,
            chartMessageTextRead,
            chartMessageTextArchived
        ],
        datasets: [{
            data: [0, 1, 0],
            backgroundColor: [
                'rgb(244, 67, 54)',
                'rgb(76, 175, 80)',
                'rgb(0, 150, 136)'
            ],
            hoverBackgroundColor: [
                'rgb(198, 40, 40)',
                'rgb(56, 142, 60)',
                'rgb(0, 121, 107)'
            ],
        }]
    },
    options: {
        radius: 85,
        cutout: '75%',
        rotation: 180,
        hoverOffset: 4,
        animation: {
            animateScale: true,
        },
        layout: {
            padding: {
                bottom: 25
            }
        },
        plugins: {
            title:{
                text: chartMessageText,
                display: true,
                position: 'top',
                color: 'rgb(75,75,75)',
                font: {
                    style: 'bold',
                    size: 20,
                },
            },
            legend: {
                position: 'bottom',
                display: true,
                labels: {
                    color: 'rgb(75,75,75)',
                    boxWidth: 15,
                    boxHeight: 15,
                    font: {
                        size: 12,
                    }
                },
            },
        },
        maintainAspectRatio: true,
    }
});











