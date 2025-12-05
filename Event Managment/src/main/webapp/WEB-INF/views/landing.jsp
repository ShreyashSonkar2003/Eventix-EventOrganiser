<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eventix</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Skranji:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            width: 100%;
            font-family: "Kdam Thmor Pro", sans-serif;
            overflow: hidden;
        }

        /* Video Background */
        .video-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
            z-index: -1;
        }

        #bg-video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Call-to-Action Button */
        .cta-button {
            position: fixed;
            bottom: 40px;
            left: 50%;
            transform: translateX(-50%);
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            color: white;
            text-decoration: none;
            letter-spacing: 1px;
            background: rgba(0, 80, 102, 0.5);
            box-shadow: 0 6px 15px rgba(0, 80, 102, 0.8);
            transition: 0.3s ease;
            animation: pulse 1.5s infinite;
            z-index: 10;
        }

        .cta-button:hover {
            background: #005050;
            transform: translateX(-50%) scale(1.08);
            box-shadow: 0 8px 25px rgba(0, 80, 102, 1);
        }

        @keyframes pulse {
            0%, 100% { transform: translateX(-50%) scale(1); }
            50% { transform: translateX(-50%) scale(1.04); }
        }
    </style>
</head>
<body>

    <!-- Video Background -->
    <div class="video-container">
        <video autoplay muted loop id="bg-video">
            <source src="assets/Timeline 1.mov" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>

    <!-- CTA Button -->
    <a href="login" class="cta-button">Explore Events</a>

</body>
</html>
