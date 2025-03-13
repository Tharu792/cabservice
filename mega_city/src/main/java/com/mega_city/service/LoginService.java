package com.mega_city.service;

import com.mega_city.dao.LoginDAO;
import com.mega_city.model.Login;

public class LoginService {

    private LoginDAO loginDAO = new LoginDAO();

    // Validate user credentials
    public boolean loginUser(Login login) {
        // Your logic to validate the username and password (e.g., check with the database)
        return loginDAO.validateUser(login);
    }

    // Get the user ID based on the username (you need to implement this method)
    public Integer getUserId(String username) {
        // Call the DAO to fetch the user ID based on username
        return loginDAO.getUserIdByUsername(username); // This will return the user ID from the database
    }
}
