package com.mega_city.service;

import com.mega_city.dao.CustomerBookingDAO;
import com.mega_city.model.CustomerBooking;

public class CustomerBookingService {

    private CustomerBookingDAO customerBookingDAO = new CustomerBookingDAO();

    // Method to confirm the booking
    public boolean confirmBooking(CustomerBooking booking, int userId) {
        return customerBookingDAO.addBooking(booking, userId);  // Pass the userId to DAO for database insertion
    }
    

}
