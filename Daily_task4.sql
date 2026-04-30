CREATE DATABASE IF NOT EXISTS CineMagic CHARACTER SET utf8mb4;
USE CineMagic;

CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration_minutes INT NOT NULL,
    -- Mặc định giới hạn độ tuổi là 0
    age_restriction INT DEFAULT 0 
);

CREATE TABLE rooms (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    max_seats INT NOT NULL,
    -- Trạng thái mặc định là 'active'
    status VARCHAR(50) DEFAULT 'active' 
);

CREATE TABLE showtimes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    room_id INT,
    show_time DATETIME NOT NULL,
    -- Giá vé không được nhỏ hơn 0
    ticket_price DECIMAL(10, 2) NOT NULL CHECK (ticket_price >= 0),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    showtime_id INT,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (showtime_id) REFERENCES showtimes(id)
);