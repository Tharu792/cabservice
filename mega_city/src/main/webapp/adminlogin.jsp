<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    background-image: url('assets/images/adminlogin.jpeg'); /* Add your background image here */
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    flex-direction: column;
}
.login-container {
    background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
    padding: 40px;
    width: 100%;
    max-width: 400px;
    margin: 100px auto;
    border-radius: 8px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    text-align: center;
}

.login-container h2 {
    color: #333;
    font-size: 24px;
    margin-bottom: 20px;
}

.login-container form {
    display: flex;
    flex-direction: column;
}

.login-container form label {
    font-size: 16px;
    color: #333;
    margin-bottom: 5px;
}

.login-container form input[type="text"],
.login-container form input[type="password"] {
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}

.login-container form button {
    padding: 12px;
    background-color: #1c8bc1;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.login-container form button:hover {
    background-color: #1a6fa2;
}

.login-container form p {
    font-size: 14px;
    color: #555;
}

.login-container form a {
    color: #1c8bc1;
    text-decoration: none;
}

.login-container form a:hover {
    text-decoration: underline;
}
/* Responsive Styles */
@media (max-width: 768px) {
    .login-container {
        padding: 20px;
        width: 90%;
        max-width: 350px;
    }

    .login-container h2 {
        font-size: 20px;
    }

    .login-container form input[type="text"],
    .login-container form input[type="password"] {
        font-size: 14px;
    }

    .login-container form button {
        font-size: 14px;
    }
}


    </style>
</head>
<body>
<nav>
    <div class="logo">
        <img src="assets/images/logo.png" alt="Mega City Cab Logo">
    </div>
    <div class="button-group">
        <a href="index.jsp" class="button">Home</a>
        <a href="adminregister.jsp" class="button">Admin Register</a>
        <div class="button-group2">
            <a href="adminlogin.jsp" class="button">Admin Login</a>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
    </div>
</nav>

    <div class="login-container">
        <h2>Admin Login</h2>
        
        <%-- Display Error Message if Login Fails --%>
        <% String error = request.getParameter("error");
           if (error != null) { %>
            <p style="color: red;"><%= error %></p>
        <% } %>
        
        <form action="AdminLoginController" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
            
             <p>Don't have an account? <a href="adminregister.jsp">Register here</a></p>
        </form>
    </div>
    
    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>

</body>
</html>
