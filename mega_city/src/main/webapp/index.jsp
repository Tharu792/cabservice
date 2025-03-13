<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Home</title>
    <link rel="stylesheet" href="assets/css/style.css">  
    
</head>
<body>

    <nav>
        <div class="logo">
                <img src="assets/images/logo.png" alt="Mega City Cab Logo">  
        </div>
            
         <div class="button-group">
           <a href="index.jsp" class="button">Home</a>
           <a href="booking.jsp" class="button">Booking</a>
           <a href="viewbooking.jsp" class="button">View Booking</a>
           <a href="details.jsp" class="button">Details</a>
           <a href="help.jsp" class="button">Help</a>
           <div class="button-group2">
           <a href="login.jsp" class="button">Login</a>
           <a href="logout.jsp" class="button">Logout</a>
         </div>
           
         </div>
    </nav>

    <div class="home">
    <h1>Welcome to Mega City Cab!</h1>
    <p>Your trusted transportation partner in Colombo.<br>
    Whether you're heading to work, the airport, or a night out,<br>
     we ensure a safe, comfortable, and affordable<br> ride at your convenience.</p>
    
    <!-- Call-to-action button -->
    <a href="booking.jsp" class="book-now-btn">Book a Ride</a>

    <!-- Background image -->
    <img src="assets/images/homepage1.jpeg" alt="Mega City Cab Service">
    </div>


   <!-- About Section -->
<section class="about">
    <h2>About Mega City Cab</h2>
    <p>
        Mega City Cab is a leading cab service in Colombo, providing safe, fast, and affordable transportation 
        solutions. Whether you need a ride for work, travel, or leisure, our fleet of well-maintained vehicles 
        and professional drivers ensure a smooth journey every time.
    </p>

    <h3>Why Choose Us?</h3>
    <ul>
        <li>Easy online booking and mobile app access</li>
        <li>Safe and professional drivers</li>
        <li>Affordable pricing with no hidden fees</li>
        <li>24/7 customer support</li>
        <li>Well-maintained and sanitized vehicles</li>
    </ul>
</section>

<!-- Contact Section -->
<section class="contact">
    <h2>Contact Us</h2>
    <p>We’re here to assist you! Reach out to us for any inquiries or support.</p>
    
    <div class="contact-container">
        <div class="contact-box">
            <span class="icon">&#9993;</span> <!-- Email Icon -->
            <p><strong>Email:</strong> <a href="mailto:support@megacitycab.com">support@megacitycab.com</a></p>
        </div>

        <div class="contact-box">
            <span class="icon">&#9742;</span> <!-- Phone Icon -->
            <p><strong>Phone:</strong> <a href="tel:+94761234567">+94 76 123 4567</a></p>
        </div>

        <div class="contact-box">
            <span class="icon">&#127968;</span> <!-- Location Icon -->
            <p><strong>Address:</strong> No. 45, Main Street, Colombo, Sri Lanka</p>
        </div>
    </div>
</section>

    <footer>
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
        <p>Follow us on: 
        <a href="https://www.facebook.com/megacitycab" target="_blank">Facebook</a> | 
        <a href="https://www.twitter.com/megacitycab" target="_blank">Twitter</a> | 
        <a href="https://www.instagram.com/megacitycab" target="_blank">Instagram</a>
    </p>
    <p>Privacy Policy | Terms and  Conditions </p>
    </footer>
</body>
</html>

