<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background: #2c3e50;
            color: #fff;
            transition: all 0.3s;
            z-index: 1000;
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #ecf0f1;
            text-decoration: none;
            transition: 0.3s;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background: #1abc9c;
            color: #fff;
        }

        /* Main content */
        .main {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s;
        }

        /* Mobile */
        @media(max-width: 768px) {
            .sidebar {
                width: 0;
                overflow: hidden;
            }
            .main {
                margin-left: 0;
            }
            .menu-btn {
                display: block !important;
            }
        }

        /* Menu button */
        .menu-btn {
            display: none;
            background: #3498db;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 15px;
            font-size: 18px;
        }

        /* Cards */
        .card {
            background: #fff;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
            transition: 0.3s;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 10px 20px rgba(0,0,0,0.2);
        }

        .card i {
            font-size: 40px;
            margin-bottom: 10px;
            color: #3498db;
            transition: 0.3s;
        }

        .card:hover i {
            transform: rotate(15deg);
        }

        .text-success { color: #2ecc71 !important; }
        .text-primary { color: #3498db !important; }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <h2><i class="fas fa-cogs"></i> Admin</h2>
    <a href="dashboard" class="active">Dashboard</a>
    <a href="manageevents">Manage Event</a>
    <a href="logout">Logout</a>
</div>

<!-- Main content -->
<div class="main">
    <button class="menu-btn" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
    </button>

    <h1 class="mb-4">Admin Dashboard</h1>

    <div class="card">
        <i class="fas fa-calendar-alt text-primary"></i>
        <h5>Total Events</h5>
        <h3>${totalEvents}</h3>
    </div>

    <div class="card">
        <i class="fas fa-users text-success"></i>
        <h5>Total Users</h5>
        <h3>${totalUsers}</h3>
    </div>
</div>

<script>
    function toggleSidebar() {
        let sb = document.getElementById("sidebar");
        sb.style.width = (sb.style.width === "250px" || sb.style.width === "") ? "0" : "250px";
    }
</script>

</body>
</html>
