<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Mega City Cab</title>
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
        <a href="help.jsp" class="button">Help</a>
        <div class="button-group2">
            <a href="login.jsp" class="button">Login</a>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
    </div>
</nav>

<div class="box1">
    <div class="register-container">
        <h2>Register for Mega City Cab</h2>

        <% if (request.getParameter("error") != null) { %>
            <p style="color: red;"><%= request.getParameter("error") %></p>
        <% } %>

        <% if (request.getParameter("message") != null) { %>
            <p style="color: green;"><%= request.getParameter("message") %></p>
        <% } %>

        <form action="register" method="POST">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="nic">NIC:</label>
            <input type="text" id="NIC" name="NIC" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>

            <input type="submit" value="Register">
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</div>

</body>
</html>
