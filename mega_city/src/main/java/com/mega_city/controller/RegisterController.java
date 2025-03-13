package com.mega_city.controller;

import com.mega_city.model.Register;
import com.mega_city.service.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RegisterService registerService = new RegisterService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String nic = request.getParameter("NIC");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a new Register object to hold the data from the request
        Register user = new Register();
        user.setFullname(fullname);
        user.setAddress(address);
        user.setNic(nic);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);

        // Call the registerUser method in the service to register the user
        boolean registrationSuccess = registerService.registerUser(user);

        if (registrationSuccess) {
            // Registration successful
            response.sendRedirect("register.jsp?message=Registration successful");
        } else {
            // Registration failed, check if it was due to duplicate values
            response.sendRedirect("register.jsp?error=Registration failed. Username, email, or NIC may already exist.");
        }
    }
}
