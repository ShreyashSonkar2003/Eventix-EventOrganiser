<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Buy Tickets</title>

    <style>
        /* ======== STICKY FOOTER LAYOUT ======== */
        html, body { height: 100%; margin: 0; }
        body { display: flex; flex-direction: column; }

        /* main content pushes footer down */
        .main-area { flex: 1; }

        /* ======== BACKGROUND IMAGE ======== */
        .bg {
            min-height: 100%;
            background: url('${pageContext.request.contextPath}/assets/Event1.jpg') no-repeat center center fixed;
            background-size: cover;
            padding: 40px 20px;
        }

        /* ======== GLASS CARD FORM ======== */
        .ticket-container {
            max-width: 900px;
            width: 100%;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.85);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 5px 20px rgba(0,0,0,0.3);
            backdrop-filter: blur(5px);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-size: 28px;
        }

        /* Inputs */
        .form-group { margin-bottom: 15px; }
        label { font-weight: bold; margin-bottom: 5px; display: block; }
        input, select { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; }

        .btn {
            width: 100%;
            padding: 12px;
            background: #ff6600;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            font-size: 16px;
        }
        .btn:hover { background: #e65c00; }

        /* Footer Styling */
        footer {
            width: 100%;
            background: #111;
            color: white;
            text-align: center;
            padding: 15px 0;
        }
    </style>
</head>

<body>

<!-- HEADER OUTSIDE CONTENT -->
<%@ include file="header.jsp" %>

<!-- MAIN CONTENT -->
<div class="main-area">
    <div class="bg">
        <div class="ticket-container">
            <h2>Buy Tickets</h2>

            <div class="event-info">
                <p><strong>Event:</strong> ${event.title}</p>
                <p><strong>Date:</strong> ${event.date}</p>
                <p><strong>Time:</strong> ${event.time}</p>
                <p><strong>Location:</strong> ${event.location}</p>
            </div>

            <form action="${pageContext.request.contextPath}/buy-tickets" method="post" class="ticket-form">
                <input type="hidden" name="eventId" value="${event.id}">

                <div class="form-group">
                    <label>Ticket Type</label>
                    <select name="ticket_type" id="ticket_type">
                        <option value="early-bird" data-price="199">Early Bird - Rs.199</option>
                        <option value="standard" data-price="249">Standard - Rs.249</option>
                        <option value="vip" data-price="399">VIP - Rs.399</option>
                        <option value="student" data-price="99">Student - Rs.99</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Quantity</label>
                    <select name="quantity" id="quantity">
                        <option value="1">1 Ticket</option>
                        <option value="2">2 Tickets</option>
                        <option value="3">3 Tickets</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="first_name" required>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" required>
                </div>

                <button type="button" class="btn" onclick="payNow()">Pay & Book</button>
            </form>
        </div>
    </div>
</div>

<!-- FOOTER ALWAYS FULL WIDTH -->
<%@ include file="footer.jsp" %>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
function payNow() {
    const ticket = document.getElementById("ticket_type");
    const price = ticket.options[ticket.selectedIndex].getAttribute("data-price");
    const qty = document.getElementById("quantity").value;
    const amount = price * qty * 100;

    const options = {
        key: "rzp_test_RP6DUmLhGEL1EW",
        amount: amount,
        currency: "INR",
        name: "Eventix",
        description: "Ticket Booking for ${event.title}",
        handler: function(response) {
            alert("Payment Successful!");
            document.querySelector('.ticket-form').submit();
        }
    };

    const rzp = new Razorpay(options);
    rzp.open();
}
</script>

</body>
</html>
