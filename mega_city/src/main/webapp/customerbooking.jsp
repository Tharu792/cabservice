<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Booking - Mega City Cab</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
        function calculateDistance() {
            var pickup = document.getElementById("pickupLocation").value;
            var dropoff = document.getElementById("dropoffLocation").value;

            if (pickup && dropoff) {
                // Get lat/lng for pickup and dropoff locations using Nominatim API
                getLatLngFromAddress(pickup, function(pickupLatLng) {
                    getLatLngFromAddress(dropoff, function(dropoffLatLng) {
                        if (pickupLatLng && dropoffLatLng) {
                            var distance = pickupLatLng.distanceTo(dropoffLatLng) / 1000; // Convert meters to kilometers
                            document.getElementById("distance").value = distance.toFixed(2); // Display distance rounded to 2 decimal places
                        } else {
                            alert("Unable to find the locations.");
                        }
                    });
                });
            }
        }

        // Function to fetch lat/lng from address using the Nominatim geocoding API
        function getLatLngFromAddress(address, callback) {
            var url = "https://nominatim.openstreetmap.org/search?format=json&q=" + encodeURIComponent(address);

            var xhr = new XMLHttpRequest();
            xhr.open("GET", url, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var result = JSON.parse(xhr.responseText);
                    if (result && result.length > 0) {
                        var lat = result[0].lat;
                        var lon = result[0].lon;
                        var latLng = L.latLng(lat, lon);
                        callback(latLng); // Pass the latLng to the callback function
                    } else {
                        callback(null); // Return null if no result is found
                    }
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <div class="logo">
            <img src="assets/images/logo.png" alt="Mega City Cab Logo">
        </div>
        <div class="button-group">
            <a href="index.jsp" class="button">Home</a>
            <a href="viewbooking.jsp" class="button">View Booking</a>
            <a href="calculatebill.jsp" class="button">Calculate Bill</a>
            <a href="help.jsp" class="button">Help</a>
            <div class="button-group2">
                <a href="login.jsp" class="button">Login</a>
                <a href="logout.jsp" class="button">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Booking Form Section -->
    <section class="booking-form-section">
        <h1>Book Your Ride</h1>
        <p>Please enter your details to confirm your booking.</p>

        <form action="CustomerBookingController" method="post">
            <label for="customerName">Full Name:</label>
            <input type="text" id="customerName" name="customerName" required>

            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required>

            <label for="pickupLocation">Pickup Location:</label>
            <input type="text" id="pickupLocation" name="pickupLocation" required onblur="calculateDistance()">

            <label for="dropoffLocation">Drop-off Location:</label>
            <input type="text" id="dropoffLocation" name="dropoffLocation" required onblur="calculateDistance()">

            <label for="pickupDate">Pickup Date:</label>
            <input type="date" id="pickupDate" name="pickupDate" required>

            <label for="pickupTime">Pickup Time:</label>
            <input type="time" id="pickupTime" name="pickupTime" required>

            <label for="distance">Estimated Distance (km):</label>
            <input type="number" id="distance" name="distance" required readonly>

            <label for="vehicleType">Select Vehicle Type:</label>
            <select id="vehicleType" name="vehicleType" required>
                <option value="Alto">Alto</option>
                <option value="Sedan">Sedan</option>
                <option value="SUV">SUV</option>
                <option value="Wagon-R">Wagon-R</option>
                <option value="Tuk Tuk">Tuk Tuk</option>
            </select>

            <button type="submit" class="submit-button">Confirm Booking</button>
            
        </form>
    </section>
<footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
        <p>Follow us on: 
        <a href="https://www.facebook.com/megacitycab" target="_blank">Facebook</a> | 
        <a href="https://www.twitter.com/megacitycab" target="_blank">Twitter</a> | 
        <a href="https://www.instagram.com/megacitycab" target="_blank">Instagram</a>
    </p>
    <p>Privacy Policy | Terms and  Conditions </p>
    </footer>
    
</body>
</html>
