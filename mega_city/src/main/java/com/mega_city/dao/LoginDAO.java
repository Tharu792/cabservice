package com.mega_city.dao;

import com.mega_city.model.Login;
import com.mega_city.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    // Validate the user login
    public boolean validateUser(Login login) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, login.getUsername());
            stmt.setString(2, login.getPassword());

            ResultSet rs = stmt.executeQuery();
            return rs.next(); // Returns true if the username and password match
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Fetch the user ID based on username
    public Integer getUserIdByUsername(String username) {
        String query = "SELECT id FROM users WHERE username = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("id"); // Return the user ID
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // Return null if no user is found
    }
}
