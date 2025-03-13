package com.mega_city.controller;

import com.mega_city.model.Login;
import com.mega_city.service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    private LoginService loginService = new LoginService();

    // Handles login form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create Login object with username and password
        Login login = new Login();
        login.setUsername(username);
        login.setPassword(password);

        // Validate user credentials
        if (loginService.loginUser(login)) {
            // Successful login: Start session and store user info
            HttpSession session = request.getSession();
            
            Integer userId = loginService.getUserId(username); // Get the user ID using getUserId method
            
            if (userId != null) {
                session.setAttribute("userId", userId);  // Store userId in session
                session.setAttribute("username", username); // Store username in session (optional)
                
                // Redirect to booking page
                response.sendRedirect("customerbooking.jsp");
            } else {
                // If userId is not found, redirect to login page
                response.sendRedirect("login.jsp?error=User ID not found.");
            }
        } else {
            // If login fails, send error message to the login page
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);  // Forward error message to login.jsp
        }
    }
}  