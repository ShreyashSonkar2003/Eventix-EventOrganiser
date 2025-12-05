<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Eventix - Event Organizer</title>
<style>
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f0f2f5;
    color: #333;
}
header, footer {
    background: #4a76a8;
    color: #fff;
    padding: 15px 20px;
    text-align: center;
}
header h2, footer p { margin: 0; }
main { max-width: 1200px; margin: auto; padding: 20px; }

/* Hero Section */
.hero {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-bottom: 40px;
    background: #e0f0ff;
    padding: 40px 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    text-align: center;
}
.hero-text { flex: 1; min-width: 280px; }
.hero-text h1 {
    font-size: 26px;
    color: #1a3d6b;
    margin-bottom: 15px;
}
.hero-text p { color: #555; margin-bottom: 10px; }
.hero-text .btn {
    display: inline-block;
    padding: 10px 20px;
    background: #4a76a8;
    color: #fff;
    text-decoration: none;
    border-radius: 50px;
    font-weight: bold;
    transition: 0.3s;
}
.hero-text .btn:hover { background: #6b8fcf; }
.hero-image-wrapper { flex: 1; min-width: 280px; text-align: center; }
.hero-image-wrapper img {
    width: 100%;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

/* Events Section */
.events { padding: 50px 20px; background: #f9f9f9; }
.events h2 {
    text-align: center;
    font-size: 28px;
    color: #1a3d6b;
    margin-bottom: 30px;
    font-weight: 600;
}
.events-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}
.event-card {
    position: relative;
    width: 250px;
    border-radius: 10px;
    overflow: hidden;
}
.event-card img { width: 100%; display: block; border-radius: 10px; }
.event-overlay {
    position: absolute;
    bottom: 0; left: 0; right: 0;
    background: rgba(0,0,0,0.7);
    color: #fff;
    padding: 15px;
    opacity: 0;
    transition: 0.3s;
}
.event-card:hover .event-overlay { opacity: 1; }
.event-overlay h4 { margin: 0 0 5px 0; }
.event-overlay p { font-size: 14px; margin: 0 0 10px 0; }
.event-overlay a {
    text-decoration: none;
    color: #fff;
    font-size: 14px;
    margin-right: 10px;
}
.event-overlay a:hover { text-decoration: underline; }

/* Responsive */
@media (max-width: 768px) {
    .hero { flex-direction: column; text-align: center; }
    .hero-text, .hero-image-wrapper { min-width: 100%; }
    .event-card { width: 100%; }
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<main>
    <section class="hero">
        <div class="hero-text">
            <h1>Welcome to Eventix</h1>
            <p>Your trusted event management and ticketing partner</p>
            <p>Discover concerts, workshops, conferences, meetups and more all in one place.</p>
            <div style="margin-bottom:20px; color:#333; font-size:14px; line-height:1.6;">
                <div>Plan | Organize | Celebrate</div>
                <div>Professional Event Solutions</div>
                <div>Trusted by Thousands</div>
            </div>
            <a href="${pageContext.request.contextPath}/schedule" class="btn">Explore Events</a>
        </div>
        <div class="hero-image-wrapper">
            <img src="assets/Event5.jpg" alt="Event Banner">
        </div>
    </section>

    <section class="events">
        <h2>Featured Events</h2>
        <div class="events-grid">
            <div class="event-card">
                <a href="${pageContext.request.contextPath}/schedule">
                    <img src="assets/Event1.jpg" alt="Music Event">
                </a>
                <div class="event-overlay">
                    <h4>Music Concert</h4>
                    <p>Live Performances | Open Arena</p>
                    <div>
                        <a href="${pageContext.request.contextPath}/schedule">View</a>
                        <a href="${pageContext.request.contextPath}/schedule">Details</a>
                    </div>
                </div>
            </div>

            <div class="event-card">
                <a href="${pageContext.request.contextPath}/schedule">
                    <img src="assets/Event2.jpg" alt="Corporate Event">
                </a>
                <div class="event-overlay">
                    <h4>Business Conference</h4>
                    <p>Industry Leaders | Networking</p>
                    <div>
                        <a href="${pageContext.request.contextPath}/schedule">View</a>
                        <a href="${pageContext.request.contextPath}/schedule">Details</a>
                    </div>
                </div>
            </div>

            <div class="event-card">
                <a href="${pageContext.request.contextPath}/schedule">
                    <img src="assets/Event3.jpg" alt="Tech Event">
                </a>
                <div class="event-overlay">
                    <h4>Tech Expo</h4>
                    <p>Innovation & Startups</p>
                    <div>
                        <a href="${pageContext.request.contextPath}/schedule">View</a>
                        <a href="${pageContext.request.contextPath}/schedule">Details</a>
                    </div>
                </div>
            </div>

            <div class="event-card">
                <a href="${pageContext.request.contextPath}/schedule">
                    <img src="assets/Event4.jpg" alt="Workshop">
                </a>
                <div class="event-overlay">
                    <h4>Creative Workshop</h4>
                    <p>Learn | Build | Grow</p>
                    <div>
                        <a href="${pageContext.request.contextPath}/schedule">View</a>
                        <a href="${pageContext.request.contextPath}/schedule">Details</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
