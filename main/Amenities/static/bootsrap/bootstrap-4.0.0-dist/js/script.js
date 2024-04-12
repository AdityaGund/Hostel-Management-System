document.addEventListener('DOMContentLoaded', function () {
    const checkInBtn = document.getElementById('checkInBtn');
    const checkOutBtn = document.getElementById('checkOutBtn');
    const servicesContainer = document.getElementById('services');
  
    checkInBtn.addEventListener('click', function () {
      alert('Checked In successfully!');
    });
  
    checkOutBtn.addEventListener('click', function () {
      alert('Checked Out successfully!');
    });
  
    // Simulated data for available services
    const availableServices = ['WiFi', 'Laundry', 'Cafeteria'];
  
    // Display available services
    const servicesList = document.createElement('ul');
    availableServices.forEach(service => {
      const listItem = document.createElement('li');
      listItem.textContent = service;
      servicesList.appendChild(listItem);
    });
  
    servicesContainer.appendChild(servicesList);
  });
  