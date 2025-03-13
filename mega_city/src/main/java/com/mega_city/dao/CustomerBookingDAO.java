package com.mega_city.dao;

import com.mega_city.model.CustomerBooking;
import com.mega_city.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerBookingDAO {

    // Constructor
    public CustomerBookingDAO() {
        // Default constructor
    }

    // Method to add booking details to the database
    public boolean addBooking(CustomerBooking booking, int userId) {
        String query = "INSERT INTO bookings (customer_name, phone_number, pickup_location, dropoff_location, pickup_date, pickup_time, distance, vehicle_type, total_cost, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, booking.getCustomerName());
            stmt.setString(2, booking.getPhoneNumber());
            stmt.setString(3, booking.getPickupLocation());
            stmt.setString(4, booking.getDropoffLocation());
            stmt.setString(5, booking.getPickupDate());
            stmt.setString(6, booking.getPickupTime());
            stmt.setDouble(7, booking.getDistance());
            stmt.setString(8, booking.getVehicleType());
            stmt.setDouble(9, booking.getTotalCost());
            stmt.setInt(10, userId);  // Add the user_id from session or context

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
   
}
    
