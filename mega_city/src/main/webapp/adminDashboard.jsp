
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mega_city.util.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="assets/css/style.css">
   <style>
/* Main container for the dashboard */
.admin-dashboard-container {
    max-width: 1200px;
    margin: 20px auto;
    background: #d6e4f0; /* Dark light blue background for the page */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 30px;
    background: transparent; /* Remove the background color */
    border-radius: 10px;
    box-shadow: none; /* No extra shadow on the table */
}

/* Table Cells */
th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

/* Table Header */
th {
    background: #007bff; /* Blue color for header */
    color: white;
}

/* Images inside table */
td img {
    border-radius: 5px;
    max-width: 100px;
    height: auto;
}

/* Buttons in Table */
table a {
    display: inline-block;
    text-decoration: none;
    padding: 10px 15px;
    border-radius: 6px;
    color: white;
    text-align: center;
    margin: 5px 0;
    width: 100px;
}

/* Different colors for each button */
table a:first-child {
    background: #28a745;  /* Green for first button */
}

table a:nth-child(2) {
    background: #ffc107;  /* Yellow for second button */
}

table a:nth-child(3) {
    background: #dc3545;  /* Red for third button */
}

table a:hover {
    opacity: 0.8;
}

/* Form Styling */
form {
    background: #d7ffd7;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 30px auto;
}

label {
    font-weight: bold;
    font-size: 16px;
    display: block;
    margin-bottom: 5px;
}

input, select, button {
    width: 100%;
    padding: 12px;
    margin-top: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

button {
    background: #28a745;
    color: white;
    border: none;
    cursor: pointer;
    margin-top: 10px;
    font-size: 16px;
    font-weight: bold;
}

button:hover {
    background: #218838;
}

/* Responsive Design */
@media (max-width: 768px) {
    .admin-dashboard-container {
        margin: 10px;
        padding: 15px;
    }

    table, th, td {
        font-size: 12px;
    }

    form {
        padding: 30px;
    }

    .button-group {
        flex-direction: column;
    }

    .button-group a {
        margin-top: 5px;
    }
}

/* Button group for admin actions */
.button-group2 {
    display: flex;
    gap: 10px;
}

   
   </style>
    
</head>
<body>

<nav>
    <div class="logo">
        <img src="assets/images/logo.png" alt="Mega City Cab Logo">
    </div>
    <div class="button-group">
        <a href="index.jsp" class="button">Home</a>
        <a href="#booking-list" class="button">BookingDetails</a>
        <a href="viewregisterUserAndAdmin.jsp" class="button">RegisterUser</a>
        <div class="button-group2">
            <a href="adminregister.jsp" class="button">AdminRegister</a>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
    </div>
</nav>


    <div class="admin-dashboard-container">
        <h2>Admin Dashboard</h2>

        <% if (request.getParameter("error") != null) { %>
            <p style="color: red;"><%= request.getParameter("error") %></p>
        <% } %>
        <% if (request.getParameter("message") != null) { %>
            <p style="color: green;"><%= request.getParameter("message") %></p>
        <% } %>

        <!-- Car and Driver Details -->
        <section class="car-driver-list">
            <h3>Car and Driver Details</h3>
            <table border="1">
                <thead>
                    <tr>
                        <th>Car ID</th>
                        <th>Car Model</th>
                        <th>Car Number</th>
                        <th>Car Type</th>
                        <th>Capacity</th>
                        <th>Driver Name</th>
                        <th>Contact Number</th>
                        <th>License Number</th>
                        <th>Driver NIC</th>
                        <th>Car Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        try {
                            con = DBConnection.getConnection();
                            String sql = "SELECT * FROM CarDriverDetails";
                            pstmt = con.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt("car_id") %></td>
                            <td><%= rs.getString("car_model") %></td>
                            <td><%= rs.getString("car_number") %></td>
                            <td><%= rs.getString("car_type") %></td>
                            <td><%= rs.getInt("capacity") %></td>
                            <td><%= rs.getString("driver_name") %></td>
                            <td><%= rs.getString("contact_number") %></td>
                            <td><%= rs.getString("license_number") %></td>
                            <td><%= rs.getString("driver_nic") %></td>
                            <td>
                                <img src="uploads/<%= rs.getString("car_image") %>" alt="Car Image" width="100">
                            </td>
                            <td>
                                <a href="details.jsp?carId=<%= rs.getInt("car_id") %>">View Details</a> |
                                <a href="editCarDriver.jsp?carId=<%= rs.getInt("car_id") %>">Edit</a> |
                                <a href="deleteCarDriver.jsp?carId=<%= rs.getInt("car_id") %>" onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
                            </td>
                        </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (pstmt != null) pstmt.close();
                                if (con != null) con.close();
                            } catch (SQLException e) {
                                out.println("<p style='color:red;'>Error closing resources: " + e.getMessage() + "</p>");
                            }
                        }
                    %>
                </tbody>
            </table>
        </section>
        
         <!-- Add New Car and Driver Details -->
        <section class="add-car-driver">
            <h3>Add New Car and Driver Details</h3>
            <form action="AdminDashboardController" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="action" value="add">

                <label for="car_model">Car Model:</label>
                <input type="text" id="car_model" name="car_model" required><br><br>

                <label for="car_number">Car Number:</label>
                <input type="text" id="car_number" name="car_number" required><br><br>

                <label for="car_type">Car Type:</label>
                <select id="car_type" name="car_type" required>
                    <option value="car">Car</option>
                    <option value="van">Van</option>
                    <option value="cab">Cab</option>
                    <option value="TUK TUK">TUK TUK</option>
                </select><br><br>

                <label for="capacity">Capacity:</label>
                <input type="number" id="capacity" name="capacity" required><br><br>

                <label for="driver_name">Driver Name:</label>
                <input type="text" id="driver_name" name="driver_name" required><br><br>

                <label for="contact_number">Contact Number:</label>
                <input type="text" id="contact_number" name="contact_number" required><br><br>

                <label for="license_number">License Number:</label>
                <input type="text" id="license_number" name="license_number" required><br><br>

                <label for="driver_nic">Driver NIC:</label>
                <input type="text" id="driver_nic" name="driver_nic" required><br><br>

                <label for="car_image">Upload Car Image:</label>
                <input type="file" id="car_image" name="car_image" accept="image/*" required><br><br>

                <button type="submit">Add Car and Driver</button>
            </form>
        </section>

        <!-- Booking Details -->
        <section class="booking-list" id="booking-list">

        <h3>Booking Details</h3>
            <table border="1">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Phone Number</th>
                        <th>Pickup Location</th>
                        <th>Dropoff Location</th>
                        <th>Pickup Date</th>
                        <th>Pickup Time</th>
                        <th>Distance</th>
                        <th>Vehicle Type</th>
                        <th>Total Cost</th>
                        <th>User ID</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            con = DBConnection.getConnection();
                            String sql = "SELECT * FROM bookings";
                            pstmt = con.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("customer_name") %></td>
                            <td><%= rs.getString("phone_number") %></td>
                            <td><%= rs.getString("pickup_location") %></td>
                            <td><%= rs.getString("dropoff_location") %></td>
                            <td><%= rs.getDate("pickup_date") %></td>
                            <td><%= rs.getTime("pickup_time") %></td>
                            <td><%= rs.getDouble("distance") %></td>
                            <td><%= rs.getString("vehicle_type") %></td>
                            <td><%= rs.getDouble("total_cost") %></td>
                            <td><%= rs.getInt("user_id") %></td>
                            <td>
                                <a href="completeBooking.jsp?bookingId=<%= rs.getInt("id") %>">Complete</a> | 
                                <a href="cancelBooking.jsp?bookingId=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure you want to cancel this booking?');">Cancel</a>
                            </td>
                        </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (pstmt != null) pstmt.close();
                                if (con != null) con.close();
                            } catch (SQLException e) {
                                out.println("<p style='color:red;'>Error closing resources: " + e.getMessage() + "</p>");
                            }
                        }
                    %>
                </tbody>
            </table>
        </section>

       
    </div>


</body>
</html>
