package com.mega_city.service;

import com.mega_city.dao.AdminLoginDAO;
import com.mega_city.model.AdminLogin;

public class AdminLoginService {
    private AdminLoginDAO adminLoginDAO = new AdminLoginDAO();

    public boolean validateAdmin(AdminLogin admin) {
        return adminLoginDAO.checkCredentials(admin.getUsername(), admin.getPassword());
    }
}
