<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.mega_city.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User - Mega City Cab</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<nav>
    <div class="logo">
        <img src="assets/images/logo.png" alt="Mega City Cab Logo">
    </div>
    <div class="button-group">
        <a href="index.jsp" class="button">Home</a>
        <a href="adminDashboard.jsp" class="button">Admin Dashboard</a>
        <a href="registerUser.jsp" class="button">Back to Users</a>
    </div>
</nav>

<section class="update_user">
    <h1>Update User Details</h1>

    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int userId = Integer.parseInt(request.getParameter("id"));
        String fullname = "", address = "", nic = "", email = "", username = "", password = "";

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM users WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                fullname = rs.getString("fullname");
                address = rs.getString("address");
                nic = rs.getString("nic");
                email = rs.getString("email");
                username = rs.getString("username");
                password = rs.getString("password");
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

    <form action="adminupdateUserProcess.jsp" method="post">

        <input type="hidden" name="id" value="<%= userId %>">
        
        <label>Full Name:</label>
        <input type="text" name="fullname" value="<%= fullname %>" required>

        <label>Address:</label>
        <input type="text" name="address" value="<%= address %>" required>

        <label>NIC:</label>
        <input type="text" name="nic" value="<%= nic %>" required>

        <label>Email:</label>
        <input type="email" name="email" value="<%= email %>" required>

        <label>Username:</label>
        <input type="text" name="username" value="<%= username %>" required>

        <label>Password:</label>
        <input type="password" name="password" value="<%= password %>" required>

        <button type="submit">Update User</button>
    </form>
</section>

</body>
</html>
