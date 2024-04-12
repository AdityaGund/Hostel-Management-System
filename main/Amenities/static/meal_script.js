const date = new Date();

const renderCalendar = () => {
  date.setDate(1);

  const monthDays = document.querySelector(".days");

  const lastDay = new Date(
    date.getFullYear(),
    date.getMonth() + 1,
    0
  ).getDate();

  const prevLastDay = new Date(
    date.getFullYear(),
    date.getMonth(),
    0
  ).getDate();

  const firstDayIndex = date.getDay();

  const lastDayIndex = new Date(
    date.getFullYear(),
    date.getMonth() + 1,
    0
  ).getDay();

  const nextDays = 7 - lastDayIndex - 1;

  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  document.querySelector(".date h1").innerHTML = months[date.getMonth()];

  document.querySelector(".date p").innerHTML = new Date().toDateString();

  let days = "";

  for (let x = firstDayIndex; x > 0; x--) {
    days += `<div class="prev-date"></div>`;
  }

  for (let i = 1; i <= lastDay; i++) {
    if (
      i === new Date().getDate() &&
      date.getMonth() === new Date().getMonth()
    ) {
      days += `<div class="today this_month">${i}</div>`;
    } else {
      days += `<div class="this_month">${i}</div>`;
    }
  }

  for (let j = 1; j <= nextDays; j++) {
    days += `<div class="next-date"></div>`;
    monthDays.innerHTML = days;
  }
};

document.querySelector(".prev").addEventListener("click", () => {
  date.setMonth(date.getMonth() - 1);
  renderCalendar();
});

document.querySelector(".next").addEventListener("click", () => {
  date.setMonth(date.getMonth() + 1);
  renderCalendar();
});

renderCalendar();
document.addEventListener("DOMContentLoaded", function() {
  document.querySelector("div.days").addEventListener("click", function (event) {
      var key = event.target.innerText;
      var year = date.getFullYear();
      var month = date.getMonth() + 1;

      // Extract the month and year from the clicked date
      var clickedDate = new Date(year, month - 1, parseInt(key)); // Month is zero-indexed, so we subtract 1

      var clickedYear = clickedDate.getFullYear();
      var clickedMonth = clickedDate.getMonth() + 1; // Month is zero-indexed, so we add 1 to get the correct month
      var formattedDate = clickedYear + "-" + (clickedMonth < 10 ? "0" + clickedMonth : clickedMonth) + "-" + (parseInt(key) < 10 ? "0" + key : key);
      if (formattedDate.length > 10) {
        formattedDate = formattedDate.slice(0, 10); // Slice the string to a length of 10 characters
      }
      if(formattedDate.startsWith('NaN-NaN-')){
        formattedDate = null;
      }
      if(formattedDate == null){
        document.querySelector(".cal2").style.display = 'none';
      }else{
        document.querySelector(".cal2").style.display = 'block';
        // document.querySelector(".colum3").style.display = 'block';
      }
      console.log(formattedDate);
      
      document.querySelector(".cal2 p.formdate").innerHTML = formattedDate;
      document.getElementById("hiddenInput").value = formattedDate;
      // document.getElementById("hiddenInput1").value = formattedDate;
      // document.querySelector("p.leavestaken.status_date").innerHTML = formattedDate;
      // Access the hidden div containing the attendance data
      
  });
  const toggleButton = document.getElementById("toggleButton");
  const interface1 = document.getElementById("interface1");
  const crossbtn = document.querySelector("div.crossbtn");
  toggleButton.addEventListener("click", function() {
      // Toggle visibility of interfaces
      if (interface1.classList.contains("show")) {
          interface1.classList.remove("show");
      } else {
          interface1.classList.add("show");
      }
  });
  crossbtn.addEventListener("click", function() {
    // Toggle visibility of interfaces
    if (interface1.classList.contains("show")) {
        interface1.classList.remove("show");
    } else {
        interface1.classList.add("show");
    }
});
});


document.addEventListener("DOMContentLoaded", function() {
  
});

