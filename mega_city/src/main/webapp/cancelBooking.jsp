<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mega_city.util.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Booking - Mega City Cab</title>
</head>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 500px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            margin: 50px auto;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        .message {
            font-size: 16px;
            padding: 10px;
            border-radius: 5px;
            margin: 15px 0;
        }

        .success {
            color: green;
            background-color: #e8f5e9;
            border: 1px solid green;
        }

        .error {
            color: red;
            background-color: #ffebee;
            border: 1px solid red;
        }

        .back-button {
            display: inline-block;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
<body>
    <h2>Cancel Booking</h2>

    <%
        String bookingId = request.getParameter("bookingId");
        if (bookingId != null) {
            Connection con = null;
            PreparedStatement pstmt = null;
            try {
                con = DBConnection.getConnection();
                String sql = "UPDATE bookings SET status = 'Cancelled' WHERE id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(bookingId));
                int rowsUpdated = pstmt.executeUpdate();
                
                if (rowsUpdated > 0) {
                    out.println("<p style='color: green;'>Booking ID " + bookingId + " has been cancelled.</p>");
                } else {
                    out.println("<p style='color: red;'>Error: Booking ID not found.</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    out.println("<p style='color: red;'>Error closing resources: " + e.getMessage() + "</p>");
                }
            }
        } else {
            out.println("<p style='color: red;'>Booking ID is missing.</p>");
        }
    %>
    <a href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>
