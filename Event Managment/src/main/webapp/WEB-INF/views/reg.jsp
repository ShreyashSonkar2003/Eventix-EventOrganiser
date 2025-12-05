<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>

<style>
* { margin:0; padding:0; box-sizing:border-box; }

html, body {
    height: 100%;
    width: 100%;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #000;
    overflow: hidden;
}

body {
    background: url('assets/Lgn.jpg') no-repeat center center fixed;
    background-size: cover;
}

.overlay {
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.4);
    top: 0;
    left: 0;
    z-index: -1;
}

.reg-container {
    width: 380px;
    padding: 30px;
    background: #111;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.6);
}

.reg-container h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #fff;
}

.reg-container input[type="text"],
.reg-container input[type="password"] {
    width: 100%;
    padding: 12px;
    margin: 12px 0;
    background: #222;
    border: 1px solid #333;
    border-radius: 8px;
    color: #fff;
    outline: none;
}

.reg-container input::placeholder {
    color: #aaa;
}

.reg-container input[type="submit"] {
    width: 100%;
    padding: 12px;
    background: #333;
    border: none;
    border-radius: 8px;
    color: #fff;
    cursor: pointer;
    transition: 0.3s;
}

.reg-container input[type="submit"]:hover {
    background: #444;
}

.login-link {
    display: block;
    margin-top: 15px;
    text-align: center;
    color: #fff;
    text-decoration: none;
}

.login-link:hover {
    text-decoration: underline;
}

.error-msg {
    color: #ff5c5c;
    text-align: center;
    margin-bottom: 10px;
}
</style>
</head>
<body>

<div class="overlay"></div>

<div class="reg-container">
    <h2>Register</h2>

    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
            out.print("<div class='error-msg'>" + msg + "</div>");
        }
    %>

    <form action="addNewUser" method="post">
        <input type="text" name="username" placeholder="Enter Username" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <input type="submit" value="Register">
    </form>

    <a href="login" class="login-link">Already have an account? Login here</a>
</div>

</body>
</html>
