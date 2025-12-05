# Eventix – Event Organiser

Eventix is a simple web-based event management system built using Spring MVC, Hibernate, and Maven.  
Users can browse events, register, buy tickets, and manage their profiles, while admins can manage events through a secure admin panel.

## Features

User Features:
- User registration and login
- Browse and view events
- Book tickets
- View event schedule
- Manage profile

Admin Features:
- Admin login
- Add new events
- Edit or delete existing events
- Manage user bookings
- View total events and users

## Tech Stack

- Java (JDK 8+)
- Spring MVC
- Hibernate ORM
- MySQL Database
- JSP / Servlets
- Maven
- Apache Tomcat

## Project Structure

```text
Eventix-EventOrganiser/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/ips/
│       │       ├── controller/
│       │       ├── dao/
│       │       ├── daoimpl/
│       │       └── pojo/
│       │
│       ├── resources/
│       │
│       └── webapp/
│           ├── WEB-INF/
│           │   └── views/
│           └── web.xml
│
├── pom.xml
└── EventOrganiser.sql
```

## Database Setup

Use the included SQL file:

EventOrganiser.sql

This file contains:
- Database creation
- userinfo table
- Default admin user
- Sample user

Create database manually (optional):

```sql
CREATE DATABASE EventOrganiser;
```

## Author

Shreyash Sonkar  
GitHub: https://github.com/ShreyashSonkar2003
