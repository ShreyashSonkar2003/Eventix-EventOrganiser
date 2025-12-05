<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>About</title>

<style>
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f4f6f8;
    color: #333;
}

header, footer {
    background: #4a76a8;
    color: #fff;
    padding: 15px 20px;
    text-align: center;
}
header h2 { margin: 0; font-size: 24px; }

.container {
    width: 90%;
    max-width: 1200px;
    margin: auto;
    padding: 20px 0;
}

/* About Section */
.about-section {
    background: #e3f2fd;
    padding: 50px 25px;
    margin-bottom: 50px;
    border-radius: 10px;
    text-align: center;
}
.about-section h1 {
    font-size: 40px;
    margin-bottom: 20px;
    color: #0d47a1;
}
.about-section p {
    font-size: 18px;
    max-width: 850px;
    margin: 12px auto;
    line-height: 1.8;
}

/* Team Section */
.team-section {
    padding: 40px 0;
}
.team-section h2 {
    text-align: center;
    font-size: 32px;
    margin-bottom: 40px;
    color: #1e88e5;
    position: relative;
}
.team-section h2::after {
    content: "";
    width: 70px;
    height: 4px;
    background: #1e88e5;
    position: absolute;
    left: 50%;
    bottom: -10px;
    transform: translateX(-50%);
}

/* Team Grid */
.team-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 25px;
}

.team-card {
    width: 200px;
    background: #fff;
    border-radius: 10px;
    text-align: center;
    padding: 15px;
    transition: transform 0.3s, box-shadow 0.3s;
}
.team-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

/* Team Images */
.team-card img {
    width: 140px;
    height: 140px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #42a5f5;
    margin-bottom: 10px;
}

/* Name */
.team-card h5 {
    font-size: 18px;
    color: #222;
    margin-bottom: 10px;
    font-weight: 600;
}

/* Social Links */
.social-icons {
    display: flex;
    flex-direction: column;
    gap: 5px;
    align-items: center;
    font-size: 14px;
}
.social-icons a {
    text-decoration: none;
    color: #1e88e5;
}
.social-icons a:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 600px) { .team-card { width: 45%; } }
@media (max-width: 400px) { .team-card { width: 90%; } }

</style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">

    <!-- About Section -->
    <section class="about-section">
        <h1>About Eventix</h1>
        <p>
            Eventix is your ultimate platform for discovering, organizing, and attending events of all kinds. 
            We strive to make event management effortless and enjoyable for both organizers and participants.
        </p>
        <p>
            Whether you are looking for workshops, concerts, conferences, or local meetups, Eventix provides a seamless experience for browsing events, registering quickly, and securing tickets safely.
        </p>
        <p>
            Join thousands of users who trust Eventix to connect, explore, and celebrate experiences that matter.
        </p>
    </section>

    <!-- Team Section -->
    <section class="team-section">
        <h2>Meet Our Team</h2>
        <div class="team-grid">

            <div class="team-card">
                <img src="assets/Profile1.jpeg" alt="Shreyash">
                <h5>Shreyash Sonkar</h5>
                <div class="social-icons">
                    <a href="https://www.linkedin.com/in/shreyashsonkar">LinkedIn</a>
                </div>
            </div>

            <div class="team-card">
                <img src="assets/Profile2.jpeg" alt="Sakshi">
                <h5>Sakshi Patel</h5>
                <div class="social-icons">
                    <a href="https://www.linkedin.com/in/sakshipatel02/">LinkedIn</a>
                </div>
            </div>

            <div class="team-card">
                <img src="assets/Profile3.png" alt="Bhumika">
                <h5>Bhumika Sen</h5>
                <div class="social-icons">
                    <a href="https://www.linkedin.com/in/bhumika-sen-013b98310/">LinkedIn</a>
                </div>
            </div>

        </div>
    </section>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>
