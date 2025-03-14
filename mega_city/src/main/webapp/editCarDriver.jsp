<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.mega_city.util.DBConnection" %>

<%! 
    public Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }
%>

<%
    String carId = request.getParameter("carId");
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String carModel = "", carNumber = "", carType = "", driverName = "", contactNumber = "", licenseNumber = "", driverNic = "";
    int capacity = 0;

    try {
        con = getConnection();
        String sql = "SELECT * FROM CarDriverDetails WHERE car_id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(carId));
        rs = pstmt.executeQuery();

        if (rs.next()) {
            carModel = rs.getString("car_model");
            carNumber = rs.getString("car_number");
            carType = rs.getString("car_type");
            capacity = rs.getInt("capacity");
            driverName = rs.getString("driver_name");
            contactNumber = rs.getString("contact_number");
            licenseNumber = rs.getString("license_number");
            driverNic = rs.getString("driver_nic");
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Car and Driver Details</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
    
/* Main container */
.box1 {
    max-width: 600px;
    background: white;
    padding: 20px;
    margin: 50px auto;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

.admin-dashboard-container {
    text-align: center;
}

h2 {
    color: #333;
}

/* Form styles */
form {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

label {
    font-weight: bold;
    margin-bottom: 5px;
    display: block;
}

input, select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
}

button:hover {
    background-color: #45a049;
}
    </style>
    
</head>
<body>

<nav>
    <div class="logo">
        <img src="assets/images/logo.png" alt="Mega City Cab Logo">
    </div>
    
    <div class="button-group2">
            <a href="adminDashboard.jsp" class="button">Back</a>
    </div>
    
</nav>

<div class="box1">
    <div class="admin-dashboard-container">
        <h2>Edit Car and Driver Details</h2>

        <form action="UpdateCarDriverController" method="POST">
            <input type="hidden" name="car_id" value="<%= carId %>">

            <label for="car_model">Car Model:</label>
            <input type="text" id="car_model" name="car_model" value="<%= carModel %>" required><br><br>

            <label for="car_number">Car Number:</label>
            <input type="text" id="car_number" name="car_number" value="<%= carNumber %>" required><br><br>

            <label for="car_type">Car Type:</label>
            <select id="car_type" name="car_type" required>
                <option value="car" <%= "car".equals(carType) ? "selected" : "" %>>Car</option>
                <option value="van" <%= "van".equals(carType) ? "selected" : "" %>>Van</option>
                <option value="cab" <%= "cab".equals(carType) ? "selected" : "" %>>Cab</option>
                <option value="TUK TUK" <%= "TUK TUK".equals(carType) ? "selected" : "" %>>TUK TUK</option>
            </select><br><br>

            <label for="capacity">Capacity:</label>
            <input type="number" id="capacity" name="capacity" value="<%= capacity %>" required><br><br>

            <label for="driver_name">Driver Name:</label>
            <input type="text" id="driver_name" name="driver_name" value="<%= driverName %>" required><br><br>

            <label for="contact_number">Contact Number:</label>
            <input type="text" id="contact_number" name="contact_number" value="<%= contactNumber %>" required><br><br>

            <label for="license_number">License Number:</label>
            <input type="text" id="license_number" name="license_number" value="<%= licenseNumber %>" required><br><br>

            <label for="driver_nic">Driver NIC:</label>
            <input type="text" id="driver_nic" name="driver_nic" value="<%= driverNic %>" required><br><br>

            <button type="submit">Update Car and Driver</button>
        </form>
    </div>
</div>

</body>
</html>
