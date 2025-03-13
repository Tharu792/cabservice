package com.mega_city.controller;

import com.mega_city.model.CustomerBooking;
import com.mega_city.service.CustomerBookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CustomerBookingController")
public class CustomerBookingController extends HttpServlet {

    private CustomerBookingService customerBookingService = new CustomerBookingService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the form data
    	
        String customerName = request.getParameter("customerName");
        String phoneNumber = request.getParameter("phoneNumber");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropoffLocation");
        String pickupDate = request.getParameter("pickupDate");
        String pickupTime = request.getParameter("pickupTime");
        double distance = Double.parseDouble(request.getParameter("distance"));
        String vehicleType = request.getParameter("vehicleType");

        // Get the user_id from session (assuming the user is logged in)
        Integer userId = (Integer) request.getSession().getAttribute("userId");

        if (userId == null) {
            // If userId is not found in session, redirect to the login page
            response.sendRedirect("login.jsp?error=Please login to continue.");
            return;
        }

        // Vehicle pricing logic
        double pricePerKm = 0;
        switch (vehicleType) {
            case "Alto":
                pricePerKm = 150;
                break;
            case "Sedan":
                pricePerKm = 250;
                break;
            case "SUV":
                pricePerKm = 250;
                break;
            case "Wagon-R":
                pricePerKm = 200;
                break;
            case "Tuk Tuk":
                pricePerKm = 100;
                break;
            default:
                pricePerKm = 150; // Default to Alto price if no match
                break;
        }

        // Apply discount if the distance is greater than 50 km (₹20 discount per km)
        double discount = 0;
        if (distance > 50) {
            discount = 20 * distance;
        }

        // Calculate total cost
        double totalCost = (distance * pricePerKm) - discount;

        // Create the CustomerBooking object
        CustomerBooking booking = new CustomerBooking();
        booking.setCustomerName(customerName);
        booking.setPhoneNumber(phoneNumber);
        booking.setPickupLocation(pickupLocation);
        booking.setDropoffLocation(dropoffLocation);
        booking.setPickupDate(pickupDate);
        booking.setPickupTime(pickupTime);
        booking.setDistance(distance);
        booking.setVehicleType(vehicleType);
        booking.setTotalCost(totalCost);

        // Confirm the booking by saving it to the database
        if (customerBookingService.confirmBooking(booking, userId)) {
            // Redirect to the calculatebill.jsp page to show the bill with the calculated details
            response.sendRedirect("calculatebill.jsp?customerName=" + customerName +
            	    "&phoneNumber=" + phoneNumber +
                    "&pickupLocation=" + pickupLocation +
                    "&dropoffLocation=" + dropoffLocation +
                    "&distance=" + distance +
                    "&vehicleType=" + vehicleType +
                    "&totalCost=" + totalCost +
                    "&discount=" + discount);
        } else {
            // If booking failed, show an error message
            response.sendRedirect("customerbooking.jsp?error=Booking failed. Please try again.");
        }
    }
}
