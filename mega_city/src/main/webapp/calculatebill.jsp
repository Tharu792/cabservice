<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mega_city.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill - Mega City Cab</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full viewport height */
    margin: 0;
    background-color: #f5f5f5; /* Light gray background */
}
.bill-section {
    width: 100%;
    max-width: 600px;
    padding: 20px;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    text-align: center;
}
/* Headings */
.bill-section h1 {
    font-size: 24px;
    color: #333;
    margin-bottom: 20px;
}

/* Success and Error Messages */
.bill-section p {
    font-size: 16px;
}

.bill-section p.error-message {
    color: red;
    font-weight: bold;
}

.bill-section p.success-message {
    color: green;
    font-weight: bold;
}

/* Bill Details */
.bill-details {
    text-align: left;
    margin-top: 20px;
    padding: 15px;
    background-color: #f9f9f9;
    border-radius: 8px;
}

.bill-details p {
    font-size: 16px;
    margin: 5px 0;
}

.bill-details p strong {
    color: #333;
}

/* Buttons */
.button {
    display: inline-block;
    width: 100%;
    padding: 10px;
    background-color: #ff6600;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 15px;
    text-align: center;
}

.button:hover {
    background-color: #cc5200;
}
.back-button {
    display: inline-block;
    width: 200px;
    padding: 10px;
    background-color: #28a745;  
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;  
    margin-top: 20px;  
    transition: background 0.3s ease, transform 0.2s ease; 
}
.back-button:hover {
    background-color: #218838; 
    transform: scale(1.05);  
}
 </style>
 
</head>
<body>

    

    <!-- Bill Section -->
    <section class="bill-section">
        <h1>Your Total Bill</h1>

        <!-- Display Success or Error Messages -->
        <%
            String successMessage = (String) session.getAttribute("message");
            String errorMessage = (String) session.getAttribute("error");

            if (successMessage != null) { 
        %>
            <p style="color: green; font-weight: bold;"><%= successMessage %></p>
        <%
                session.removeAttribute("message");
            } 
            if (errorMessage != null) { 
        %>
            <p style="color: red; font-weight: bold;"><%= errorMessage %></p>
        <%
                session.removeAttribute("error");
            }
        %>

        <!-- Retrieve booking details from request parameters -->
        <%
            String customerName = request.getParameter("customerName");
            String phoneNumber = request.getParameter("phoneNumber");
            String pickupLocation = request.getParameter("pickupLocation");
            String dropoffLocation = request.getParameter("dropoffLocation");
            String distanceStr = request.getParameter("distance");
            String vehicleType = request.getParameter("vehicleType");

            // Default values if parameters are missing
            customerName = (customerName != null) ? customerName : "Not Available";
            phoneNumber = (phoneNumber != null) ? phoneNumber : "Not Available";
            pickupLocation = (pickupLocation != null) ? pickupLocation : "Not Available";
            dropoffLocation = (dropoffLocation != null) ? dropoffLocation : "Not Available";
            vehicleType = (vehicleType != null) ? vehicleType : "Not Available";

            // Validate and parse distance safely
            double distance = 0;
            if (distanceStr != null && !distanceStr.trim().isEmpty()) {
                try {
                    distance = Double.parseDouble(distanceStr);
                } catch (NumberFormatException e) {
                    distance = 0; // Set to 0 if parsing fails
                }
            }

            // Price logic based on vehicle type
            double pricePerKm = 0;
            switch (vehicleType) {
                case "Alto":
                    pricePerKm = 150;
                    break;
                case "Sedan":
                case "SUV":
                    pricePerKm = 250;
                    break;
                case "Wagon-R":
                    pricePerKm = 200;
                    break;
                case "Tuk Tuk":
                    pricePerKm = 100;
                    break;
            }

            // Apply discount if distance > 50 km
            double discountPerKm = (distance > 50) ? 20 : 0;
            double totalCost = distance * (pricePerKm - discountPerKm);
        %>

        <!-- Display Booking Details -->
        <div class="bill-details">
            <p><strong>Customer Name:</strong> <%= customerName %></p>
            <p><strong>Phone Number:</strong> <%= phoneNumber %></p>
            <p><strong>Pickup Location:</strong> <%= pickupLocation %></p>
            <p><strong>Dropoff Location:</strong> <%= dropoffLocation %></p>
            <p><strong>Distance:</strong> <%= distance %> km</p>
            <p><strong>Vehicle Type:</strong> <%= vehicleType %></p>
            <p><strong>Discount per Km:</strong> ₹<%= discountPerKm %></p>
            <p><strong>Total Cost:</strong> ₹<%= totalCost %></p>
        </div>

       <!-- Booking Cancellation Logic -->
        <%
            String status = request.getParameter("status");
            String bookingId = request.getParameter("bookingId");

            if ("Cancelled".equals(status)) { 
        %>
            <p style="color: red;"><strong>This booking has already been cancelled.</strong></p>
        <%
            } else { 
        %>
            <form action="viewbooking.jsp" method="post" onsubmit="return confirm('Are you sure you want to cancel this booking?');">
                <input type="hidden" name="bookingId" value="<%= bookingId %>">
                <button type="submit" class="button">View and Delete Booking</button>
            </form>
        <% } %>

        <a href="index.jsp" class="button back-button">Back to Home</a>
        
    </section>
    
    
</body>
</html>