package com.mega_city.service;

import com.mega_city.dao.AdminRegisterDAO;
import com.mega_city.model.AdminRegister;

public class AdminRegisterService {
    private final AdminRegisterDAO adminRegisterDAO = new AdminRegisterDAO();

    public boolean registerAdmin(AdminRegister admin) {
        return adminRegisterDAO.registerAdmin(admin);
    }
}
