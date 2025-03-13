package com.mega_city.service;

import com.mega_city.model.CarDriverDetails;
import com.mega_city.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CarDriverService {

    public boolean updateCarDriverDetails(CarDriverDetails carDriver) {
        boolean isUpdated = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE CarDriverDetails SET car_model = ?, car_number = ?, car_type = ?, capacity = ?, driver_name = ?, contact_number = ?, license_number = ?, driver_nic = ? WHERE car_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, carDriver.getCarModel());
            pstmt.setString(2, carDriver.getCarNumber());
            pstmt.setString(3, carDriver.getCarType());
            pstmt.setInt(4, carDriver.getCapacity());
            pstmt.setString(5, carDriver.getDriverName());
            pstmt.setString(6, carDriver.getContactNumber());
            pstmt.setString(7, carDriver.getLicenseNumber());
            pstmt.setString(8, carDriver.getDriverNic());
            pstmt.setInt(9, carDriver.getCarId());

            int result = pstmt.executeUpdate();

            if (result > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isUpdated;
    }
}
