<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.mega_city.util.DBConnection" %>

<%
    Connection con = null;
    PreparedStatement pstmt = null;

    // Retrieve form data
    int userId = Integer.parseInt(request.getParameter("id"));
    String fullname = request.getParameter("fullname");
    String address = request.getParameter("address");
    String nic = request.getParameter("nic");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        // Establish DB connection
        con = DBConnection.getConnection();

        // SQL query to update user details
        String sql = "UPDATE users SET fullname=?, address=?, nic=?, email=?, username=?, password=? WHERE id=?";
        pstmt = con.prepareStatement(sql);

        // Set parameters
        pstmt.setString(1, fullname);
        pstmt.setString(2, address);
        pstmt.setString(3, nic);
        pstmt.setString(4, email);
        pstmt.setString(5, username);
        pstmt.setString(6, password);
        pstmt.setInt(7, userId);

        // Execute update query
        int result = pstmt.executeUpdate();

        if (result > 0) {
            // If update is successful, show success message and redirect
            out.println("<p style='color:green;'>User details updated successfully!</p>");
            response.sendRedirect("viewregisterUserAndAdmin.jsp"); // Redirect to view register page
        } else {
            // If update fails, show an error message
            out.println("<p style='color:red;'>Error: User details update failed.</p>");
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Error closing resources: " + e.getMessage() + "</p>");
        }
    }
%>
