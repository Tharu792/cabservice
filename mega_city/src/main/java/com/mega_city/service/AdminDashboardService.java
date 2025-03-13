package com.mega_city.service;

import com.mega_city.dao.AdminDashboardDAO;
import com.mega_city.model.AdminDashboard;

import java.util.List;

public class AdminDashboardService {
    public boolean addCarDriver(AdminDashboard carDriver) {
        return AdminDashboardDAO.addCarDriver(carDriver);
    }

    public List<AdminDashboard> getAllCarDrivers() {
        return AdminDashboardDAO.getAllCarDrivers();
    }
}

