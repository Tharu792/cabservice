<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*, com.mega_city.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register User - Mega City Cab</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
    
/*view registerUser And Admin page*/
/* Sections */
section {
    background: white;
    max-width: 90%;
    margin: 30px auto;
    padding: 20px;
    border-radius: rgb(255, 255, 255);
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h1, h2 {
    color: #2c3e50;
    margin-bottom: 20px;
}

/* Tables */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th {
    background: #34495e;
    color: white;
    padding: 10px;
}

td {
    padding: 10px;
    text-align: center;
}


/* Buttons in Tables */
table .button {
    padding: 8px 12px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
}

table .button:hover {
    opacity: 0.8;
}

table .button:first-child {
    background: #f39c12;
    color: white;
}

table .button:last-child {
    background: #e74c3c;
    color: white;
}

/* Responsive Design */
@media (max-width: 768px) {
    nav {
        flex-direction: column;
        align-items: center;
    }

    .button-group {
        flex-direction: column;
        margin-top: 10px;
    }

    .button, .button-group2 a {
        margin-bottom: 5px;
    }

    section {
        width: 100%;
    }

    table {
        font-size: 14px;
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
        <a href="adminDashboard.jsp" class="button">Admin Dashboard</a>
        <div class="button-group2">
            <a href="adminlogin.jsp" class="button">Admin Login</a>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
    </div>
</nav>

<section class="register_user">
    <h1>Register User Details</h1>

    <!-- Displaying User Data from Database -->
    <table border="1">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Full Name</th>
                <th>Address</th>
                <th>NIC</th>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
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
                String sql = "SELECT * FROM users";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("fullname") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><%= rs.getString("nic") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("username") %></td>
                            <td><%= rs.getString("password") %></td>
                            <td>
                                <!-- Update Button -->
                                <a href="adminupdateUser.jsp?id=<%= rs.getInt("id") %>" class="button">Update</a>
                                <!-- Delete Button -->
                                <a href="admindeleteUser.jsp?id=<%= rs.getInt("id") %>" class="button" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
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

<section class="register_Admin">
    <h2>Register Admin Details</h2>

    <!-- Displaying Admin Data from Database -->
    <table border="2">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Full Name</th>
                <th>Email</th>
           </tr>
        </thead>
        <tbody>
            <%
                
                try {
                    con = DBConnection.getConnection();
                    String sql = "SELECT * FROM admins";
                    pstmt = con.prepareStatement(sql); // Use pstmt here
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("full_name") %></td>
                            <td><%= rs.getString("email") %></td>
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


</body>
</html>
