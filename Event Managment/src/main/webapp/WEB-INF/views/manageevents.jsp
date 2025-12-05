<%@page import="com.ips.pojo.Event"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Events</title>

<style>
* { margin:0; padding:0; box-sizing:border-box; }

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background: #f0f2f5;
  color: #333;
  min-height: 100vh;
}

header {
  background: #4a76a8;
  color: #fff;
  padding: 15px 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

header h2 { font-size: 24px; }

header a {
  text-decoration: none;
  color: #fff;
  font-weight: bold;
  background: #e74c3c;
  padding: 8px 15px;
  border-radius: 5px;
  transition: 0.3s;
}

header a:hover { background: #c0392b; }

.container { padding: 20px; }

.top-bar {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  justify-content: flex-end;
  margin-bottom: 20px;
}

.top-bar button {
  background:#4a76a8;
  color:white;
  border:none;
  padding:8px 15px;
  border-radius:5px;
  cursor:pointer;
  transition:0.3s;
}

.top-bar button:hover { background:#3a5d7a; }

.events {
  background:#fff;
  padding:20px;
  border-radius:10px;
  box-shadow:0 4px 10px rgba(0,0,0,0.1);
  overflow-x:auto;
}

table {
  width:100%;
  border-collapse:collapse;
  min-width:600px;
}

table th, table td {
  padding:12px;
  border-bottom:1px solid #ddd;
  text-align:left;
}

table th { background:#4a76a8; color:white; font-weight:600; }
table tr:nth-child(even) { background:#f9f9f9; }
table tr:hover { background:#e0f0ff; }

/* MODALS */
.modal {
  display:none;
  position:fixed;
  top:0; left:0;
  width:100%; height:100%;
  background: rgba(0,0,0,0.5);
  justify-content:center;
  align-items:center;
  z-index:1000;
}

.modal-content {
  background:white;
  padding:25px;
  border-radius:10px;
  width:90%;
  max-width:400px;
  box-shadow:0 5px 15px rgba(0,0,0,0.3);
  position:relative;
  max-height:90vh;
  overflow-y:auto;
}

.modal-content h3 { margin-bottom:20px; color:#4a76a8; }

.modal-content form {
  display:flex;
  flex-direction:column;
  gap:10px;
}

.modal-content input {
  width:100%;
  padding:8px;
  border:1px solid #ccc;
  border-radius:5px;
  transition:0.3s;
}

.modal-content input:focus {
  outline:none;
  border-color:#4a76a8;
  box-shadow:0 0 5px #4a76a8;
}

.btn-save, .btn-cancel, .btn-delete {
  padding:8px 15px;
  border:none;
  border-radius:5px;
  cursor:pointer;
  transition:0.3s;
}

.btn-save { background:#2ecc71; color:white; }
.btn-save:hover { background:#27ae60; }
.btn-cancel { background:#95a5a6; color:white; }
.btn-cancel:hover { background:#7f8c8d; }
.btn-delete { background:#e74c3c; color:white; }
.btn-delete:hover { background:#c0392b; }

.modal-buttons {
  display:flex;
  justify-content:flex-end;
  gap:10px;
  flex-wrap:wrap;
  margin-top:10px;
}

@media (max-width:500px){
  .modal-buttons, .top-bar { flex-direction:column; align-items:stretch; }
  .top-bar button { width:100%; }
}
</style>
</head>

<body style="text-align:center;">

<%
String msg = (String)request.getAttribute("msg");
if(msg!=null) {
    out.print("<p style='color:green;font-weight:bold;'>"+msg+"</p>");
}
%>

<header>
  <h2>Manage Events</h2>
  <a href="back">Back</a>
</header>

<div class="container">
  <div class="top-bar">
    <button onclick="openModal('addEventModal')">+ Add Event</button>
    <button onclick="openModal('updateEventModal')">Update Event</button>
    <button onclick="openModal('deleteEventModal')">Delete Event</button>
  </div>

  <div class="events">
    <h3>All Events</h3>
    <table>
      <thead>
        <tr>
          <th>ID</th><th>Title</th><th>Description</th><th>Date</th>
          <th>Time</th><th>Location</th><th>Sponsor</th><th>Category</th>
        </tr>
      </thead>
      <tbody>
      <%
        List<Event> lst = (List<Event>)request.getAttribute("allevents");
        if(lst != null && !lst.isEmpty()) {
            for(Event e : lst) {
      %>
        <tr>
          <td><%=e.getId()%></td>
          <td><%=e.getTitle()%></td>
          <td><%=e.getDescription()%></td>
          <td><%=e.getDate()%></td>
          <td><%=e.getTime()%></td>
          <td><%=e.getLocation()%></td>
          <td><%=e.getSponsor()%></td>
          <td><%=e.getCategory()%></td>
        </tr>
      <%
            }
        } else {
      %>
        <tr>
          <td colspan="8" style="text-align:center;color:red;">No Events Found</td>
        </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>

<!-- MODALS -->
<%-- Add Event Modal --%>
<div class="modal" id="addEventModal">
  <div class="modal-content">
    <h3>Add Event</h3>
    <form action="saveEvents" method="post">
      Title<input type="text" name="title">
      Description<input type="text" name="description">
      Date<input type="date" name="date">
      Time<input type="time" name="time">
      Location<input type="text" name="location">
      Sponsor<input type="text" name="sponsor">
      Category<input type="text" name="category">
      <div class="modal-buttons">
        <input type="submit" name="b1" value="Add Event" class="btn-save">
        <button type="button" class="btn-cancel" onclick="closeModal('addEventModal')">Cancel</button>
      </div>
    </form>
  </div>
</div>

<%-- Update Event Modal --%>
<div class="modal" id="updateEventModal">
  <div class="modal-content">
    <h3>Update Event</h3>
    <form action="saveEvents" method="post">
      ID<input type="text" name="id">
      Title<input type="text" name="title">
      Description<input type="text" name="description">
      Date<input type="date" name="date">
      Time<input type="time" name="time">
      Location<input type="text" name="location">
      Sponsor<input type="text" name="sponsor">
      Category<input type="text" name="category">
      <div class="modal-buttons">
        <input type="submit" name="b1" value="Update Event" class="btn-save">
        <button type="button" class="btn-cancel" onclick="closeModal('updateEventModal')">Cancel</button>
      </div>
    </form>
  </div>
</div>

<%-- Delete Event Modal --%>
<div class="modal" id="deleteEventModal">
  <div class="modal-content">
    <h3>Delete Event</h3>
    <form action="saveEvents" method="post">
      ID<input type="text" name="id">
      <div class="modal-buttons">
        <input type="submit" name="b1" value="Delete Event" class="btn-delete">
        <button type="button" class="btn-cancel" onclick="closeModal('deleteEventModal')">Cancel</button>
      </div>
    </form>
  </div>
</div>

<script>
function openModal(id){ document.getElementById(id).style.display = "flex"; }
function closeModal(id){ document.getElementById(id).style.display = "none"; }

// Close modal if click outside
window.onclick = function(event){
    ['addEventModal','updateEventModal','deleteEventModal'].forEach(function(mid){
        var modal = document.getElementById(mid);
        if(event.target == modal) modal.style.display = "none";
    });
}
</script>

</body>
</html>
