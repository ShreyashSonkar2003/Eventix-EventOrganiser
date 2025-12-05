<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<%@ page import="com.ips.pojo.Event"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Events</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: url('assets/Events.jpg') no-repeat center center/cover;
    color: #333;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

header, footer {
    background: #4a76a8;
    color: #fff;
    padding: 15px 20px;
    text-align: center;
}
header h2 { margin: 0; font-size: 24px; }

main {
    padding: 20px;
    max-width: 1000px;
    margin: 30px auto;
    flex: 1; 
}

.section-title h2 {
    text-align: center;
    font-size: 28px;
    margin-bottom: 5px;
}
.section-title p {
    text-align: center;
    font-size: 16px;
    color: #555;
    margin-bottom: 25px;
}

.event-card {
    background: #fff;
    padding: 18px;
    margin-bottom: 20px;
    border-radius: 10px;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    box-shadow: 0 3px 12px rgba(0,0,0,0.1);
    transition: transform 0.2s;
}
.event-card:hover { transform: translateY(-3px); }

.event-time {
    flex: 0 0 100px;
    text-align: center;
    margin-right: 15px;
}
.event-time span {
    display: block;
    font-weight: bold;
    color: #4a76a8;
    font-size: 16px;
}
.event-time small { color: #555; font-size: 13px; }

.event-details {
    flex: 1;
    min-width: 200px;
}
.event-details h5 {
    margin: 0 0 6px 0;
    font-size: 18px;
    color: #222;
}
.event-details p {
    margin: 0 0 10px 0;
    color: #555;
    font-size: 14px;
}

.badges {
    display: flex;
    gap: 6px;
    flex-wrap: wrap;
    margin-bottom: 10px;
}
.badge {
    padding: 4px 10px;
    border-radius: 6px;
    font-size: 12px;
    font-weight: bold;
    color: #fff;
}
.badge.category { background: #17a2b8; }
.badge.location { background: #6c757d; }
.badge.sponsor { background: #ffc107; color: #000; }

.buy-btn {
    flex: 0 0 120px;
    text-align: center;
}
.buy-btn a {
    display: inline-block;
    padding: 8px 14px;
    background: #4a76a8;
    color: #fff;
    text-decoration: none;
    border-radius: 6px;
    transition: 0.3s;
}
.buy-btn a:hover { background: #3a5d7a; }

@media (max-width: 600px) {
    .event-card { flex-direction: column; align-items: flex-start; }
    .event-time { margin-right: 0; margin-bottom: 10px; }
    .buy-btn { margin-top: 10px; flex: 1; text-align: left; }
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<main>
<section id="schedule">
    <div class="section-title">
        <h2>Available Events</h2>
    </div>

    <%
    List<Event> events = (List<Event>) request.getAttribute("events");
    if(events != null && !events.isEmpty()) {
        for(Event e : events) {
    %>
        <div class="event-card">
            <div class="event-time">
                <span><%= e.getTime() %></span>
                <small><%= e.getDate() %></small>
            </div>
            <div class="event-details">
                <h5><%= e.getTitle() %></h5>
                <p><%= e.getDescription() %></p>
                <div class="badges">
                    <span class="badge category"><%= e.getCategory() %></span>
                    <span class="badge location"><%= e.getLocation() %></span>
                    <span class="badge sponsor">Sponsor: <%= e.getSponsor() %></span>
                </div>
            </div>
            <div class="buy-btn">
                <a href="${pageContext.request.contextPath}/buy-tickets?eventId=<%= e.getId() %>">Buy Tickets</a>
            </div>
        </div>
    <%
        }
    } else {
    %>
        <p style="text-align:center; color:red; font-weight:bold;">No events found.</p>
    <% } %>
</section>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
