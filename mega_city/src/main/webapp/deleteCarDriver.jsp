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

    try {
        con = getConnection();
        String sql = "DELETE FROM CarDriverDetails WHERE car_id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(carId));
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("adminDashboard.jsp?message=Record deleted successfully.");
        } else {
            response.sendRedirect("adminDashboard.jsp?error=Failed to delete the record.");
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
