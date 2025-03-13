package com.mega_city.controller;

import com.mega_city.model.AdminRegister;
import com.mega_city.service.AdminRegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminRegister")
public class AdminRegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final AdminRegisterService adminRegisterService = new AdminRegisterService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Input validation
        if (fullName.isEmpty() || email.isEmpty() || username.isEmpty() || password.isEmpty()) {
            response.sendRedirect("adminregister.jsp?error=All fields are required.");
            return;
        }

        AdminRegister admin = new AdminRegister();
        admin.setFullName(fullName);
        admin.setEmail(email);
        admin.setUsername(username);
        admin.setPassword(password);

        boolean registrationSuccess = adminRegisterService.registerAdmin(admin);

        if (registrationSuccess) {
            response.sendRedirect("adminregister.jsp?message=Registration successful");
        } else {
            response.sendRedirect("adminregister.jsp?error=Registration failed. Username or email may already exist.");
        }
    }
}
