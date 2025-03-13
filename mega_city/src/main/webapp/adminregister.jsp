<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
/* Heading */
h1 {
    text-align: center;
    color: #333;
    font-size: 36px;
    margin-top: 30px;
}

/* Form Styles */
form {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    padding: 40px;
    width: 100%;
    max-width: 500px;
    margin: 30px auto;
    border-radius: 10px;
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
}

form label {
    font-size: 16px;
    margin-bottom: 8px;
    color: #333;
}

form input {
    padding: 12px;
    margin-bottom: 20px;
    width: 100%;
    max-width: 450px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    background-color: #fafafa;
    transition: border 0.3s;
}

form input:focus {
    border-color: #1c8bc1;
    outline: none;
    background-color: white;
}

form input[type="submit"] {
    background-color: #1c8bc1;
    color: white;
    padding: 14px;
    font-size: 18px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
}

form input[type="submit"]:hover {
    background-color: #3c5376;
}

/* Links */
p {
    text-align: center;
    font-size: 16px;
}

p a {
    color: #1c8bc1;
    font-weight: bold;
    text-decoration: none;
}

p a:hover {
    text-decoration: underline;
}

/* Responsive Design */
@media (max-width: 768px) {
    form {
        width: 90%;
        padding: 20px;
    }
    h1 {
        font-size: 28px;
    }
    form input, form input[type="submit"] {
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
         <a href="adminDashboard.jsp" class="button">AdminDashboard</a>
        
        <div class="button-group2">
            <a href="adminlogin.jsp" class="button">Admin Login</a>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
    </div>
</nav>


    

    <%-- Display messages --%>
    <% 
        String message = request.getParameter("message");
        String error = request.getParameter("error");
        if (message != null) { 
    %>
        <p style="color: green;"><%= message %></p>
    <% } else if (error != null) { %>
        <p style="color: red;"><%= error %></p>
    <% } %>

    <form action="adminRegister" method="post">
    
    <h1>Register Admin</h1>
    
        <label for="username">Username: </label>
        <input type="text" id="username" name="username" required/><br><br>
        
        <label for="password">Password: </label>
        <input type="password" id="password" name="password" required/><br><br>
        
        <label for="email">Email: </label>
        <input type="email" id="email" name="email" required/><br><br>
        
        <label for="full_name">Full Name: </label>
        <input type="text" id="full_name" name="full_name" required/><br><br>
        
        <input type="submit" value="Register">
        
        <p>Already have an account? <a href="adminlogin.jsp">Login here</a></p>
    </form>
    
   <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
        <p>Follow us on: 
        <a href="https://www.facebook.com/megacitycab" target="_blank">Facebook</a> | 
        <a href="https://www.twitter.com/megacitycab" target="_blank">Twitter</a> | 
        <a href="https://www.instagram.com/megacitycab" target="_blank">Instagram</a>
    </p>
    <p>Privacy Policy | Terms and  Conditions </p>
    </footer> 
    

</body>
</html>
