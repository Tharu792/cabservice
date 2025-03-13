package com.mega_city.controller;

import com.mega_city.model.AdminDashboard;
import com.mega_city.service.AdminDashboardService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AdminDashboardController")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 10 * 1024 * 1024,  // 10MB
    maxRequestSize = 50 * 1024 * 1024 // 50MB
)
public class AdminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final AdminDashboardService service = new AdminDashboardService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // ✅ Retrieve form data safely
            String carModel = request.getParameter("car_model");
            String carNumber = request.getParameter("car_number");
            String carType = request.getParameter("car_type");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            String driverName = request.getParameter("driver_name");
            String contactNumber = request.getParameter("contact_number");
            String licenseNumber = request.getParameter("license_number");
            String driverNIC = request.getParameter("driver_nic");

            // ✅ Handle file upload safely
            Part filePart = request.getPart("car_image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            if (fileName.isEmpty()) {
                response.sendRedirect("adminDashboard.jsp?error=No file selected");
                return;
            }

            // ✅ Define a proper upload directory
            String uploadPath = getServletContext().getRealPath("/uploads");
            File fileUploadDir = new File(uploadPath);
            if (!fileUploadDir.exists() && !fileUploadDir.mkdirs()) {
                response.sendRedirect("adminDashboard.jsp?error=Failed to create upload directory");
                return;
            }

            // ✅ Save file
            filePart.write(uploadPath + File.separator + fileName);

            // ✅ Create an object and insert into the database
            AdminDashboard carDriver = new AdminDashboard(0, carModel, carNumber, carType, capacity, driverName, contactNumber, licenseNumber, driverNIC, fileName);
            boolean isAdded = service.addCarDriver(carDriver);

            if (isAdded) {
                response.sendRedirect("adminDashboard.jsp?message=Successfully added");
            } else {
                response.sendRedirect("adminDashboard.jsp?error=Failed to add data");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("adminDashboard.jsp?error=Invalid number format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp?error=An error occurred while processing the request");
        }
    }
}
