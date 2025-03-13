package com.mega_city.service;

import com.mega_city.model.Register;
import com.mega_city.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterService {

    public boolean registerUser(Register user) {
        System.out.println("Attempting to register user: " + user.getFullname());

        // SQL query to insert user details into the 'users' table
        String query = "INSERT INTO users (fullname, address, nic, email, username, password) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // If DBConnection is null, the SQLException will be thrown
            // so no need to check conn == null explicitly.

            // Set parameters for the PreparedStatement
            stmt.setString(1, user.getFullname());
            stmt.setString(2, user.getAddress());
            stmt.setString(3, user.getNic());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getUsername());
            stmt.setString(6, user.getPassword());

            // Execute the update (INSERT) and check if the operation is successful
            int rowsAffected = stmt.executeUpdate();

            // If rowsAffected is greater than 0, registration was successful
            if (rowsAffected > 0) {
                System.out.println("User registered successfully.");
                return true;  // User registered successfully
            } else {
                System.out.println("Failed to register user.");
                return false;  // Registration failed (no rows affected)
            }
        } catch (SQLException e) {
            // Handle duplicate entry error for NIC, email, or username
            if (e.getMessage().contains("Duplicate entry")) {
                System.err.println("Duplicate entry error: " + e.getMessage());
                return false;  // Return false for duplicate errors
            }

            // For other SQL exceptions, print the error stack trace
            System.err.println("SQLException: " + e.getMessage());
            e.printStackTrace();
            return false;  // Return false if any SQL error occurs
        }
    }
}
