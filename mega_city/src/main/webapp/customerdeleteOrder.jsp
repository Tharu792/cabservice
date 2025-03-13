<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.mega_city.util.DBConnection" %>

<%! 
    public Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }
%>

<%
    // Get bookingId from request
    String bookingIdStr = request.getParameter("bookingId");
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        // Validate the bookingId before proceeding
        if (bookingIdStr != null && !bookingIdStr.trim().isEmpty()) {
            try {
                int bookingId = Integer.parseInt(bookingIdStr);

                // Establish database connection
                con = getConnection();
                String sql = "DELETE FROM bookings WHERE id = ?";  // Ensure the column name is correct
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, bookingId);
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    session.setAttribute("message", "Booking successfully cancelled.");
                } else {
                    session.setAttribute("error", "No booking found with the given ID.");
                }

                // Redirect back to calculatebill.jsp
                response.sendRedirect("calculatebill.jsp");
            } catch (NumberFormatException e) {
                session.setAttribute("error", "Invalid booking ID format.");
                response.sendRedirect("calculatebill.jsp");
            }
        } else {
            session.setAttribute("error", "Booking ID is missing.");
            response.sendRedirect("calculatebill.jsp");
        }
    } catch (Exception e) {
        session.setAttribute("error", "Error cancelling booking: " + e.getMessage());
        response.sendRedirect("calculatebill.jsp");
    } finally {
        // Close resources
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Error closing resources: " + e.getMessage() + "</p>");
        }
    }
%>    