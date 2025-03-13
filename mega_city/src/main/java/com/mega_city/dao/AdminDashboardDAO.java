package com.mega_city.dao;

import com.mega_city.model.AdminDashboard;
import com.mega_city.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDashboardDAO {
    public static boolean addCarDriver(AdminDashboard carDriver) {
        String sql = "INSERT INTO CarDriverDetails (car_model, car_number, car_type, capacity, driver_name, contact_number, license_number, driver_nic, car_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, carDriver.getCarModel());
            pstmt.setString(2, carDriver.getCarNumber());
            pstmt.setString(3, carDriver.getCarType());
            pstmt.setInt(4, carDriver.getCapacity());
            pstmt.setString(5, carDriver.getDriverName());
            pstmt.setString(6, carDriver.getContactNumber());
            pstmt.setString(7, carDriver.getLicenseNumber());
            pstmt.setString(8, carDriver.getDriverNIC());
            pstmt.setString(9, carDriver.getCarImage());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<AdminDashboard> getAllCarDrivers() {
        List<AdminDashboard> list = new ArrayList<>();
        String sql = "SELECT * FROM CarDriverDetails";
        try (Connection con = DBConnection.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                list.add(new AdminDashboard(
                    rs.getInt("car_id"),
                    rs.getString("car_model"),
                    rs.getString("car_number"),
                    rs.getString("car_type"),
                    rs.getInt("capacity"),
                    rs.getString("driver_name"),
                    rs.getString("contact_number"),
                    rs.getString("license_number"),
                    rs.getString("driver_nic"),
                    rs.getString("car_image")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

