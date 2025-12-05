-- Create database
CREATE DATABASE IF NOT EXISTS EventOrganiser;
USE EventOrganiser;

-- Remove old incorrect table
DROP TABLE IF EXISTS userinfo;

-- Create correct table structure

CREATE TABLE userinfo (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(50),
    roles VARCHAR(50),
    PRIMARY KEY (id)
);



-- Insert correct admin user
INSERT INTO userinfo (username, password, roles)
VALUES ('admin', 'admin123', 'admin');

-- Insert one normal user (optional)
INSERT INTO userinfo (username, password, roles)
VALUES ('user1', 'user123', 'user');

-- Check your data
SELECT * FROM userinfo;

SELECT * FROM events;


