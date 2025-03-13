<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ride - Mega City Cab</title>
    <link rel="stylesheet" href="assets/css/style.css">
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
            <%-- Logout Button --%>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
    </nav>

    

    <!-- Booking Section -->
    <section class="booking-section">
        <h1>Welcome,! Book Your Ride</h1>
        <p>Choose from our range of comfortable and affordable rides.</p>

        <div class="vehicle-container">
            
            <!-- Budget Category -->
            <div class="vehicle-card">
                <img src="assets/images/altocar.png" alt="Alto">
                <h2>ALTO</h2>
                <p>4-Seater | Budget-friendly | Small luggage space</p>
                <p><strong>Price:</strong> LKR 150/km</p>
                <a href="login.jsp" class="order-button">Book Now</a>
            </div>

            <!-- Standard Category -->
            <div class="vehicle-card">
                <img src="assets/images/Sedancar.png" alt="Sedan">
                <h2>Sedan</h2>
                <p>4-Seater | Comfortable | Medium luggage space</p>
                <p><strong>Price:</strong> LKR 250/km</p>
                <a href="login.jsp" class="order-button">Book Now</a>
            </div>

            <!-- SUV Category -->
            <div class="vehicle-card">
                <img src="assets/images/SUV-Car.png" alt="SUV">
                <h2>SUV</h2>
                <p>6-Seater | Comfortable | Large luggage space</p>
                <p><strong>Price:</strong> LKR 250/km</p>
                <a href="login.jsp" class="order-button">Book Now</a>
            </div>

            <!-- Luxury Category -->
            <div class="vehicle-card">
                <img src="assets/images/wagonr.png" alt="Luxury Car">
                <h2>Wagon-r</h2>
                <p>4-Seater | Premium Ride | Extra Comfort</p>
                <p><strong>Price:</strong> LKR 200/km</p>
                <a href="login.jsp" class="order-button">Book Now</a>
            </div>
            
            <!-- Budget Category -->
            <div class="vehicle-card">
                <img src="assets/images/tuk-tuk.png" alt="Budet">
                <h2>TUK TUK</h2>
                <p>3-Seater | Budget Ride | Small luggage space</p>
                <p><strong>Price:</strong> LKR 100/km</p>
                <a href="login.jsp" class="order-button">Book Now</a>
            </div>

        </div>
    </section>

    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>

</body>
</html>
