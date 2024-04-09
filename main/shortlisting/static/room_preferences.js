// Initialize a map to store selected room numbers with their preference numbers
var selectedRooms = {};
var preferenceCounter = Object.keys(selectedRooms).length + 1;

document.addEventListener("DOMContentLoaded", function () {
    // Initialize preference number counter

    // Add click event listener to the document
    document.addEventListener("click", function (event) {
        // Check if the clicked element has the "number" class
        if (event.target.classList.contains("number")) {
            // Get the corresponding room number
            var roomNumber = event.target.innerText;

            // Check if the number is already selected
            if (!event.target.classList.contains("selected")) {
                // Toggle the "selected" class when a number is clicked
                event.target.classList.toggle("selected");

                // Add the room number to the selectedRooms map with a preference number
                selectedRooms[preferenceCounter] = roomNumber;

                // Change the background color of the clicked number
                event.target.style.backgroundColor = "lightblue"; // Change to whatever color you prefer

                // Update the preference list
                updatePreferenceList();

                // Increment preference counter
                preferenceCounter++;
            }
        }
    });
});

function removeRoom(prefNumber) {
    // Get the room number to be removed
    var roomNumber = selectedRooms[prefNumber];

    // Remove the room from the selectedRooms map
    delete selectedRooms[prefNumber];

    var keysToUpdate = [];
    for (var key in selectedRooms) {
        if (selectedRooms.hasOwnProperty(key) && key > prefNumber) {
            keysToUpdate.push(key);
        }
    }

    // Update the preference numbers for the collected keys
    keysToUpdate.forEach(function (key) {
        var newPrefNumber = key - 1; // Decrement the preference number by one
        selectedRooms[newPrefNumber] = selectedRooms[key];
        delete selectedRooms[key];
    });
    preferenceCounter = Object.keys(selectedRooms).length + 1;

    // Update the preference list
    updatePreferenceList();

    // Reset the background color of the removed room number
    var numberElements = document.querySelectorAll(".number");
    numberElements.forEach(function (element) {
        if (element.innerText === roomNumber) {
            element.classList.remove("selected");
            element.style.backgroundColor = ""; // Reset to default background color
        }
    });
}

// Function to update the preference list
function updatePreferenceList() {
    // Get the preference list ul element
    var preferenceList = document.getElementById("preferenceList");

    // Clear the existing list items
    preferenceList.innerHTML = "";

    // Loop through the selectedRooms map and update the preference list
    Object.keys(selectedRooms).forEach(function (prefNumber) {
        // Create a list item element
        var listItem = document.createElement("li");

        // Add HTML content to the list item
        listItem.innerHTML = `
            <span class="PrefNo">${prefNumber}</span>
            <span class="RoomNo">${selectedRooms[prefNumber]}</span>
            <button onclick="removeRoom(${prefNumber})">Remove</button>
        `;

        // Append the list item to the preference list
        preferenceList.appendChild(listItem);
    });
}

function submitForm() {
    // Convert selectedRooms map to array
    var selectedRoomsArray = Object.values(selectedRooms);

    // Get CSRF token from cookies
    // Get CSRF token from cookies
    var csrftoken = getCookie('csrftoken');

    // Send data to Django view using Fetch API
    fetch("/room_preferences/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRFToken": csrftoken
        },
        body: JSON.stringify({ selected_rooms: selectedRoomsArray })
    })
    .then(response => {
        console.log({response})
        if (!response.ok) {
            throw new Error("Failed to send request. Please try again later.");
        }
        return response.json();
    })
    .then(data => {
        console.log({data})
        if (data.success) {
            alert("Preferences saved successfully!");
            window.location.href = data.redirect_url;
        } else {
            alert(data.message);
        }
    })
    .catch(error => {
        
        console.error("Error:", error);
        alert(error.message);
    });

}

// Function to get CSRF token from cookies
function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}