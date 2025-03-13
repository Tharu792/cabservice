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
