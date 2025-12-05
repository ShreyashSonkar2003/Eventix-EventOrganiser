<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Contact</title>

  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f9f9f9;
      color: #333;
    }

    /* ======= Hero Section ======= */
    .half-page {
      height: 300px;
      width: 100%;
      background-image: url('assets/Event1.jpg');
      background-size: cover;
      background-position: center;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
    }

    .half-page .content {
      text-align: center;
      color: #fff;
      background: rgba(0, 0, 0, 0.5);
      padding: 25px 35px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.3);
    }

    .btn-message {
      display: inline-block;
      margin-top: 15px;
      padding: 12px 22px;
      background: #ff5e00;
      color: white;
      text-decoration: none;
      border-radius: 6px;
      transition: background 0.3s;
    }

    .btn-message:hover { background: #e65300; }

    /* ======= Contact Layout ======= */
    .contact-wrapper {
      max-width: 900px;
      margin: 40px auto;
      padding: 0 15px;
    }

    .contact-info-panel,
    .contact-form-panel {
      background: white;
      padding: 25px 20px;
      margin-bottom: 25px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    h3, h4 { margin-bottom: 12px; color: #222; }

    .icon-container {
      display: inline-block;
      width: 28px;
      text-align: center;
      margin-right: 10px;
      font-size: 18px;
    }

    /* ======= Form Styling ======= */
    .form-container input,
    .form-container textarea {
      width: 100%;
      padding: 12px;
      margin-bottom: 12px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
      transition: border-color 0.3s;
    }

    .form-container input:focus,
    .form-container textarea:focus {
      border-color: #ff5e00;
      outline: none;
    }

    .btn-submit {
      width: 100%;
      padding: 12px;
      background: #ff5e00;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      transition: background 0.3s;
    }

    .btn-submit:hover { background: #e65300; }

    /* ======= Popup ======= */
    .popup-alert {
      position: fixed;
      top: 20px;
      right: 20px;
      background: #4BB543;
      color: white;
      padding: 14px 20px;
      border-radius: 6px;
      display: none;
      box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }

    .popup-close {
      cursor: pointer;
      margin-left: 12px;
      font-weight: bold;
    }
  </style>
</head>

<body>

<%@ include file="header.jsp" %>

<main>
  <!-- Hero Section -->
  <div class="half-page">
    <div class="content">
      <h1>Get in touch</h1>
      <p>Thanks for your interest in Ultimate Events</p>
      <a href="#contact1" class="btn-message">Send a message</a>
    </div>
  </div>

  <!-- Contact Section -->
  <section id="contact">
    <div class="contact-wrapper">

      <!-- Info Panel -->
      <div class="contact-info-panel">
        <h3>Contact Information</h3>
        <!-- Add your address, phone, email here if needed -->
      </div>

      <!-- Form Panel -->
      <div class="contact-form-panel">
        <div id="contact1" class="form-container">
          <h3>Send Us a Message</h3>

          <!-- Success popup -->
          <c:if test="${param.success eq 'true'}">
            <div id="successPopup" class="popup-alert" style="display:block;">
              Message sent successfully!
              <span class="popup-close" onclick="closePopup()">✖</span>
            </div>
          </c:if>

          <form action="${pageContext.request.contextPath}/contact" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="text" name="subject" placeholder="Subject" required>
            <textarea name="message" rows="4" placeholder="Your Message"></textarea>
            <button type="submit" class="btn-submit">Send Message</button>
          </form>
        </div>
      </div>

    </div>
  </section>
</main>

<%@ include file="footer.jsp" %>

<script>
function closePopup() {
  document.getElementById("successPopup").style.display = "none";
  window.history.replaceState({}, document.title, window.location.pathname);
}
</script>

</body>
</html>
