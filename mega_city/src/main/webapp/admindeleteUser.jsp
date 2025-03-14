<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.mega_city.util.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        .message {
            font-size: 18px;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .success {
            color: green;
            background: #d4edda;
            border: 1px solid #c3e6cb;
        }
        .error {
            color: red;
            background: #f8d7da;
            border: 1px solid #f5c6cb;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background: #007bff;
            text-decoration: none;
            border-radius: 5px;
        }
        .button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            String userId = request.getParameter("id");
            if (userId != null) {
                Connection con = null;
                PreparedStatement pstmt = null;
                int rowsAffected = 0;
                try {
                    con = DBConnection.getConnection();
                    String sql = "DELETE FROM users WHERE id = ?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1, Integer.parseInt(userId));
                    rowsAffected = pstmt.executeUpdate();
                    if (rowsAffected > 0) {
        %>
                        <p class="message success">User with ID <%= userId %> was successfully deleted.</p>
        <%
                    } else {
        %>
                        <p class="message error">Error: No user found with the provided ID.</p>
        <%
                    }
                } catch (Exception e) {
        %>
                    <p class="message error">Error: <%= e.getMessage() %></p>
        <%
                } finally {
                    try {
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
        %>
                        <p class="message error">Error closing resources: <%= e.getMessage() %></p>
        <%
                    }
                }
            } else {
        %>
                <p class="message error">No user ID provided. Please try again.</p>
        <%
            }
        %>
        <a href="viewregisterUserAndAdmin.jsp" class="button">Admin Dashboard</a>
    </div>
</body>
</html>
