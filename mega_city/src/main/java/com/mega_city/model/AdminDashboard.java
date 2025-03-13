package com.mega_city.model;

public class AdminDashboard {
    private int carId;
    private String carModel;
    private String carNumber;
    private String carType;
    private int capacity;
    private String driverName;
    private String contactNumber;
    private String licenseNumber;
    private String driverNIC;
    private String car_image;

    public AdminDashboard() {}

    public AdminDashboard(int carId, String carModel, String carNumber, String carType, int capacity, String driverName, String contactNumber, String licenseNumber, String driverNIC, String car_image) {
        this.carId = carId;
        this.carModel = carModel;
        this.carNumber = carNumber;
        this.carType = carType;
        this.capacity = capacity;
        this.driverName = driverName;
        this.contactNumber = contactNumber;
        this.licenseNumber = licenseNumber;
        this.driverNIC = driverNIC;
        this.car_image = car_image;
    }

    // Getters and Setters
    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }

    public String getCarModel() { return carModel; }
    public void setCarModel(String carModel) { this.carModel = carModel; }

    public String getCarNumber() { return carNumber; }
    public void setCarNumber(String carNumber) { this.carNumber = carNumber; }

    public String getCarType() { return carType; }
    public void setCarType(String carType) { this.carType = carType; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    public String getDriverNIC() { return driverNIC; }
    public void setDriverNIC(String driverNIC) { this.driverNIC = driverNIC; }

    public String getCarImage() { return car_image; }
    public void setCarImage(String carImage) { this.car_image = car_image; }
}
