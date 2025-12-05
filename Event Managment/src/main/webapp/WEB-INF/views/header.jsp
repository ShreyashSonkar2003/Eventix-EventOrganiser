<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
        }

        /* HEADER */
        header {
            width: 100%;
            height: 80px;
            position: fixed;
            top: 0;
            left: 0;
            background: #4a76a8;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            z-index: 1000;
        }

        .header-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
        }

        .logo img {
            height: 50px;
            width: auto;
        }

        .navmenu ul {
            display: flex;
            list-style: none;
            gap: 20px;
        }

        .navmenu ul li a {
            text-decoration: none;
            color: white;
            font-size: 14px;
            padding: 5px 10px;
            transition: 0.3s;
        }

        .navmenu ul li a:hover,
        .navmenu ul li a.active {
            color: #00c3ff;
        }

        .mobile-nav-toggle {
            display: none;
            cursor: pointer;
            font-size: 24px;
            color: white;
        }

        @media (max-width: 768px) {
            .navmenu ul {
                display: none;
                flex-direction: column;
                background: rgba(0, 0, 0, 0.9);
                position: absolute;
                top: 80px;
                right: 10px;
                padding: 15px;
                border-radius: 5px;
            }

            .navmenu ul.show {
                display: flex;
            }

            .mobile-nav-toggle {
                display: block;
            }
        }

        /* Prevent overlap with header */
        .content-wrapper {
            padding-top: 90px;
        }
    </style>

    <script>
        function toggleMenu() {
            const menu = document.getElementById("nav-list");
            menu.classList.toggle("show");
        }
    </script>
</head>

<body>
    <header>
        <div class="header-container">
            <a href="${pageContext.request.contextPath}/user-home" class="logo">
                <img src="assets/EventLogo.png" alt="Eventix Logo">
            </a>

            <nav class="navmenu">
                <span class="mobile-nav-toggle" onclick="toggleMenu()">☰</span>
                <ul id="nav-list">
                    <li><a href="${pageContext.request.contextPath}/user-home" class="active">HOME</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">ABOUT</a></li>
                    <li><a href="${pageContext.request.contextPath}/schedule">EVENTS</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">CONTACT</a></li>
                    <li><a href="${pageContext.request.contextPath}/buy-tickets">BUY TICKETS</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Wrapper to prevent header overlap -->
    <div class="content-wrapper"></div>
</body>
</html>
