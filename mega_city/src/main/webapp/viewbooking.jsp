<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mega_city.util.DBConnection" %>

<%
    // Ensure user is logged in
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
    
    .booking-section {
    padding: 40px;
    text-align: center;
    max-width: 1200px;
    margin: 40px auto;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.booking-section h1 {
    color: #333;
    font-size: 32px;
    margin-bottom: 20px;
}

.booking-section p {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 20px;
}

.booking-section table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.booking-section table th, .booking-section table td {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
}

.booking-section table th {
    background-color: #1c8bc1;
    color: white;
    font-size: 16px;
}

.booking-section table td {
    font-size: 14px;
}

.booking-section table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.booking-section table tr:hover {
    background-color: #f1f1f1;
}

.booking-section table td button {
    background-color: #ff4c4c;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.booking-section table td button:hover {
    background-color: #e03a3a;
}

.booking-section table td p {
    color: red;
    font-weight: bold;
}

.booking-section .back-button {
    display: inline-block;
    margin-top: 20px;
    padding: 12px 20px;
    background-color: #1c8bc1;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.booking-section .back-button:hover {
    background-color: #1a6fa2;
}

@media (max-width: 768px) {
    .booking-section {
        padding: 20px;
    }

    .booking-section table th, .booking-section table td {
        font-size: 12px;
        padding: 8px;
    }

    .booking-section .back-button {
        padding: 10px 18px;
    }
}
    
    </style>
</head>
<body>

    <nav>
        <div class="logo">
            <img src="assets/images/logo.png" alt="Mega City Cab Logo" style="height: 50px; width: auto;">
        </div>
        <div class="button-group">
            <a href="index.jsp" class="button">Home</a>
            <a href="calculatebill.jsp" class="button">Calculate Bill</a>
            <a href="help.jsp" class="button">Help</a>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
    </nav>

    <section class="booking-section">
        <h1>Your Bookings</h1>

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

        <table border="1">
            <tr>
                <th>Booking ID</th>
                <th>User ID</th>
                <th>Pickup Location</th>
                <th>Dropoff Location</th>
                <th>Distance (km)</th>
                <th>Vehicle Type</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
                try (Connection conn = DBConnection.getConnection()) {
                    String sql = "SELECT * FROM bookings WHERE user_id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setInt(1, userId);
                        ResultSet rs = stmt.executeQuery();
                        
                        while (rs.next()) {
            %>
                            <tr>
                                <td><%= rs.getInt("id") %></td>
                                <td><%= rs.getInt("user_id") %></td>
                                <td><%= rs.getString("pickup_location") %></td>
                                <td><%= rs.getString("dropoff_location") %></td>
                                <td><%= rs.getDouble("distance") %></td>
                                <td><%= rs.getString("vehicle_type") %></td>
                                <td><%= rs.getString("status") %></td>
                                <td>
                                    <% if (!"Cancelled".equals(rs.getString("status"))) { %>
                                        <form action="customerdeleteOrder.jsp" method="post" onsubmit="return confirm('Are you sure you want to cancel this booking?');">
                                            <input type="hidden" name="bookingId" value="<%= rs.getInt("id") %>">
                                            <button type="submit" class="button">Cancel Booking</button>
                                        </form>
                                    <% } else { %>
                                        <p style="color: red;">Cancelled</p>
                                    <% } %>
                                </td>
                            </tr>
            <%
                        }
                    }
                } catch (Exception e) {
                    out.println("<p>Error loading bookings: " + e.getMessage() + "</p>");
                }
            %>
        </table>

        <a href="calculatebill.jsp" class="button back-button">Back to calculate bill</a>
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
