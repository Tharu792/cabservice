<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
    // Invalidate the session to log out the user
    session.invalidate();
    
    // Redirect to the login page
    response.sendRedirect("login.jsp");
%>
