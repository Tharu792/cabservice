<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.mega_city.util.DBConnection" %>

<%! 
    public Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }
%>

 <% 
        // Retrieve user ID from request parameter
        String userId = request.getParameter("id");
        
        if (userId != null) {
            Connection con = null;
            PreparedStatement pstmt = null;
            int rowsAffected = 0;
            try {
                // Establish a database connection
                con = DBConnection.getConnection();
                
                // Prepare SQL query to delete user by ID
                String sql = "DELETE FROM users WHERE id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(userId));
                
                // Execute the update and get the number of rows affected
                rowsAffected = pstmt.executeUpdate();

                // If rows were affected, user was successfully deleted
                if (rowsAffected > 0) {
    %>
                    <p style="color:green;">User with ID <%= userId %> was successfully deleted.</p>
                    <a href="viewregisterUserAndAdmin.jsp" class="button">AdminDashbord</a>
    <%
                } else {
    %>
                    <p style="color:red;">Error: No user found with the provided ID.</p>
                    <a href="viewregisterUserAndAdmin.jsp" class="button">AdminDashbord</a>
    <%
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
        } else {
    %>
            <p style="color:red;">No user ID provided. Please try again.</p>
    <%
        }
    %>
