package com.mega_city.dao;

import com.mega_city.model.AdminRegister;
import com.mega_city.util.DBConnection;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminRegisterDAO {
    public boolean registerAdmin(AdminRegister admin) {
        String checkQuery = "SELECT id FROM admins WHERE username = ? OR email = ?";
        String insertQuery = "INSERT INTO admins (username, password, email, full_name) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {

            // Check if username or email already exists
            checkStmt.setString(1, admin.getUsername());
            checkStmt.setString(2, admin.getEmail());

            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("❌ Registration failed: Username or email already exists.");
                    return false;
                }
            }

            

            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                insertStmt.setString(1, admin.getUsername());
                insertStmt.setString(2, admin.getPassword());
                insertStmt.setString(3, admin.getEmail());
                insertStmt.setString(4, admin.getFullName());

                int rowsAffected = insertStmt.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("✅ Registration successful!");
                    return true;
                } else {
                    System.out.println("❌ Registration failed: No rows inserted.");
                    return false;
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
