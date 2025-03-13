<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Mega City Cab</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px gray;
            margin:20px auto;
        }
        h1 {
            text-align: center;
            color:#333:
        }
        h2{
        color:#444;
        border-bottom: 2px solid #ddd;
        padding-bottom: 5px;
        }
        ul {
            line-height: 1.6;
        }
        p{
        font-size: 16px;
        color: #555;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Help & Support</h1>
        <p>Welcome to Mega City Cab! Here’s how you can use our service:</p>
        
        <h2>1. Viewing Car and Driver Details</h2>
        <ul>
            <li>Anyone can browse available cars and driver details without logging in.</li>
            <li>Click on a car to see more details before booking.</li>
            <a href="details.jsp" class="button">Details</a>
        </ul>
        
        <h2>2. Booking a Ride</h2>
        <ul>
            <li>You must be logged in to place a booking.</li>
            <li>New users can register by clicking the <b>Login</b> button and then signing up.</li>
            <li>Once logged in, you can select a car and driver, then confirm your ride.</li>
            <a href="booking.jsp" class="button">Booking Page</a>
        </ul>
        
        <h2>3. Viewing Your Bookings</h2>
        <ul>
            <li>After logging in, you can see all bookings related to your account.</li>
            <li>Track and manage your bookings easily.</li>
            
        </ul>
        
        <h2>4. Calculating Your Bill</h2>
        <ul>
            <li>Before confirming your ride, you can use the <b>Calculate Bill</b> option.</li>
            <li>This will estimate the total cost of your trip based on distance and vehicle type.</li>
        </ul>
        
        <h2>5. Making a Reservation</h2>
        <ul>
            <li>Once you’ve checked your bill, you can proceed to confirm your reservation.</li>
            <li>You'll receive a booking confirmation via email or SMS.</li>
        </ul>
        
        <p>If you need further assistance, please contact our support team.</p>
    </div>
</body>
</html>
