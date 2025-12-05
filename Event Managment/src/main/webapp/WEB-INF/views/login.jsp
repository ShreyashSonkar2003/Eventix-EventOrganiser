<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Here</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    html, body {
        height: 100%;
        width: 100%;
        font-family: 'Segoe UI', Tahoma, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        background: url('assets/Lgn.jpg') no-repeat center center fixed;
        background-size: cover;
    }

    .overlay {
        position: fixed;
        top:0;
        left:0;
        width:100%;
        height:100%;
        background: rgba(0,0,0,0.4);
        z-index:-1;
    }

    .login-container {
        width: 380px;
        padding: 30px;
        background: #111;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0,0,0,0.6);
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #fff;
        letter-spacing: 1px;
    }

    .login-container input[type="text"],
    .login-container input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 12px 0;
        background: #222;
        border: 1px solid #333;
        border-radius: 8px;
        color: #fff;
        outline: none;
    }

    .login-container input::placeholder {
        color: #aaa;
    }

    .login-container input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: #333;
        border: none;
        border-radius: 8px;
        color: #fff;
        cursor: pointer;
        transition: 0.3s;
    }

    .login-container input[type="submit"]:hover {
        background: #444;
    }

    .register-link {
        display: block;
        text-align: center;
        margin-top: 15px;
        color: #fff;
        text-decoration: none;
    }

    .register-link:hover {
        text-decoration: underline;
    }

    .error-msg {
        color: #ff5c5c;
        text-align: center;
        margin-bottom: 10px;
        font-weight: bold;
    }
</style>
</head>

<body>

<div class="overlay"></div>

<div class="login-container">
    <h2>Login Here</h2>

    <% String msg = (String) request.getAttribute("msg");
       if (msg != null) { %>
        <div class="error-msg"><%= msg %></div>
    <% } %>

    <form action="checkUser" method="post">
        <input type="text" name="username" placeholder="Enter Username" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <input type="submit" value="Login">
    </form>

    <a href="reg" class="register-link">Don't have an account? Register here</a>
</div>

</body>
</html>
