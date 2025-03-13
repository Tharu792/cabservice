package com.mega_city.controller;

import com.mega_city.model.AdminLogin;
import com.mega_city.service.AdminLoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    private AdminLoginService adminLoginService = new AdminLoginService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create an AdminLogin object
        AdminLogin admin = new AdminLogin();
        admin.setUsername(username);
        admin.setPassword(password);

        // Validate credentials
        if (adminLoginService.validateAdmin(admin)) {
            // Create session and redirect to Admin Dashboard
            HttpSession session = request.getSession();
            session.setAttribute("adminUsername", username);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            // Redirect back to login with error message
            response.sendRedirect("adminlogin.jsp?error=Invalid username or password.");
        }
    }
}
