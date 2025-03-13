package com.mega_city.controller;

import com.mega_city.model.CarDriverDetails;
import com.mega_city.service.CarDriverService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateCarDriverController")
public class UpdateCarDriverController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    private CarDriverService carDriverService = new CarDriverService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from the form
        int carId = Integer.parseInt(request.getParameter("car_id"));
        String carModel = request.getParameter("car_model");
        String carNumber = request.getParameter("car_number");
        String carType = request.getParameter("car_type");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String driverName = request.getParameter("driver_name");
        String contactNumber = request.getParameter("contact_number");
        String licenseNumber = request.getParameter("license_number");
        String driverNic = request.getParameter("driver_nic");
      

        // Create a CarDriverDetails object
        CarDriverDetails carDriver = new CarDriverDetails();
        carDriver.setCarId(carId);
        carDriver.setCarModel(carModel);
        carDriver.setCarNumber(carNumber);
        carDriver.setCarType(carType);
        carDriver.setCapacity(capacity);
        carDriver.setDriverName(driverName);
        carDriver.setContactNumber(contactNumber);
        carDriver.setLicenseNumber(licenseNumber);
        carDriver.setDriverNic(driverNic);
       

        // Update car and driver details using the service
        boolean isUpdated = carDriverService.updateCarDriverDetails(carDriver);

        // Check the result and redirect accordingly
        if (isUpdated) {
            response.sendRedirect("adminDashboard.jsp?message=Car and driver details updated successfully!");
        } else {
            response.sendRedirect("editCarDriver.jsp?carId=" + carId + "&error=Failed to update car details!");
        }
    }
}
