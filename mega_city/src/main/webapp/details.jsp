<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mega_city.util.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car and Driver Details</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
 /* Box around content */
.box1 {
    padding: 70px;
    margin: 20px;
    background-color: #e2edfe;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 88%;  /* You can adjust the width as per your preference */
    max-width: 1450px; /* Set a max width for larger screens */
}

/* Button Styling for Back to Dashboard */
.button {
    text-decoration: none;
    padding: 10px 50px;
    background-color: #007bff;
    color: white;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    margin-top: 20px;
}

.button:hover {
    background-color: #0056b3;
}

/* Car and Driver Details Table */
.car-driver-list {
    margin: 20px 0;
}

.car-driver-list h3 {
    font-size: 24px;
    color: #333;
    margin-bottom: 20px;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: center;
}

th {
    background-color: #28a745;
    color: white;
}

td {
    background-color: #f9f9f9;
}

/* Car Image Styling */
td img {
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    width: 100px;
    height: auto;
}

/* Responsive Table */
@media screen and (max-width: 768px) {
    table {
        width: 100%;
        font-size: 14px;
    }

    nav .button-group {
        flex-direction: column;
        align-items: flex-start;
    }

    .button-group a {
        margin-bottom: 10px;
    }

    .car-driver-list {
        padding: 15px;
    }
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
                        
                        <th>Car Image</th>
                        
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
                            <td>
                                <img src="uploads/<%= rs.getString("car_image") %>" alt="Car Image" width="100">
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
            <a href="index.jsp" class="button">Back to Dashboard</a>
        </section>
        
      
    </div>


</body>
</html>
