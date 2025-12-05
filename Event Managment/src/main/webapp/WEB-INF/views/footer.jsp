<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Footer</title>

<style>
/* Footer Base */
.footer {
  background: #ffffff; 
  color: #000000;      
  padding: 40px 20px;
  font-family: Arial, sans-serif;
  border-top: 1px solid #ddd;
}

/* Main Grid Layout */
.footer-top {
  display: flex;
  flex-wrap: wrap;
  gap: 30px;
  justify-content: space-between;
}

/* Each Column */
.footer-column {
  flex: 1;
  min-width: 200px;
}

/* Footer Headings */
.footer-column h4 {
  font-size: 18px;
  margin-bottom: 15px;
  color: #000;
}

/* Footer Links */
.footer-column ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-column ul li {
  margin-bottom: 8px;
}

.footer-column ul li a {
  text-decoration: none;
  color: #000;
  transition: 0.3s;
}

.footer-column ul li a:hover {
  color: #00c3ff;
}

/* About Section */
.footer-about .sitename {
  font-size: 22px;
  font-weight: bold;
  color: #000;
}

.footer-about .footer-contact p {
  margin: 5px 0;
  color: #000;
}

/* Social Links */
.social-links a {
  display: inline-block;
  margin-right: 10px;
  text-decoration: none;
  font-size: 16px;
  background: #ddd;
  padding: 5px 10px;
  border-radius: 4px;
  color: #000;
  transition: 0.3s;
}

.social-links a:hover {
  background: #bbb;
}

/* Responsive Fix */
@media (max-width: 768px) {
  .footer-top {
    flex-direction: column;
  }
}
</style>
</head>

<body>

<footer class="footer">

  <div class="footer-top">

    <!-- About Section -->
    <div class="footer-column footer-about">
      <span class="sitename">Eventix</span>
      <div class="footer-contact">
        <p>23/4 Harmony Plaza</p>
        <p>Mumbai, Maharashtra, India</p>
        <p><strong>Phone:</strong> +91 98765 43210</p>
        <p><strong>Email:</strong> support@eventix.in</p>
      </div>
      <div class="social-links">
        <a href="#">X</a>
        <a href="#">FB</a>
      </div>
    </div>

    <!-- Quick Links -->
    <div class="footer-column">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="#hero">Home</a></li>
        <li><a href="#about">About Us</a></li>
        <li><a href="#events">Events</a></li>
        <li><a href="#gallery">Gallery</a></li>
        <li><a href="#contact">Contact</a></li>
      </ul>
    </div>

    <!-- Services -->
    <div class="footer-column">
      <h4>Our Services</h4>
      <ul>
        <li><a href="#">Corporate Events</a></li>
        <li><a href="#">Weddings & Ceremonies</a></li>
        <li><a href="#">Concerts</a></li>
        <li><a href="#">Product Launches</a></li>
        <li><a href="#">Private Parties</a></li>
      </ul>
    </div>

    <!-- Support -->
    <div class="footer-column">
      <h4>Support</h4>
      <ul>
        <li><a href="#">FAQs</a></li>
        <li><a href="#">Help Desk</a></li>
        <li><a href="#">Booking Policies</a></li>
        <li><a href="#">Cancellation Policy</a></li>
        <li><a href="#">Event Guidelines</a></li>
      </ul>
    </div>

    <!-- Event Categories -->
    <div class="footer-column">
      <h4>Event Categories</h4>
      <ul>
        <li><a href="#">Music</a></li>
        <li><a href="#">Cultural</a></li>
        <li><a href="#">Fests</a></li>
        <li><a href="#">Workshops</a></li>
        <li><a href="#">Exhibitions</a></li>
      </ul>
    </div>

  </div>

</footer>

</body>
</html>
