CREATE DATABASE IF NOT EXISTS CineMagic CHARACTER SET utf8mb4;
USE CineMagic;

CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration_minutes INT NOT NULL,
    -- Giới hạn độ tuổi mặc định là 0
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

INSERT INTO movies (title, duration_minutes, age_restriction) VALUES 
('Kung Fu Panda 4', 94, 0),
('Dune: Part Two', 166, 13),
('Exhuma: Quật Mộ Trùng Tang', 134, 16),
('Deadpool & Wolverine', 127, 18);

INSERT INTO rooms (name, max_seats, status) VALUES 
('Phòng 01 - IMAX', 200, 'active'),
('Phòng 02 - Gold Class', 50, 'active'),
('Phòng 03 - Standard', 150, 'maintenance');

INSERT INTO showtimes (movie_id, room_id, show_time, ticket_price) VALUES 
(1, 1, '2026-05-01 09:00:00', 120000), 
(2, 1, '2026-05-01 13:00:00', 150000), 
(3, 2, '2026-05-01 19:00:00', 250000), 
(4, 2, '2026-05-01 22:30:00', 300000), 
(1, 2, '2026-05-02 10:30:00', 200000);

INSERT INTO bookings (showtime_id, customer_name, phone) VALUES 
(1, 'Nguyễn Văn A', '0912345678'),
(1, 'Trần Thị B', '0987654321'),
(2, 'Lê Văn C', '0905111222'),
(2, 'Phạm Thị D', '0933444555'),
(3, 'Hoàng Văn E', '0977888999'),
(3, 'Ngô Thị F', '0966555444'),
(4, 'Đỗ Văn G', '0944333222'),
(4, 'Vũ Thị H', '0922111000'),
(5, 'Bùi Văn I', '0911222333'),
(5, 'Lương Huy', '0900111222');

SELECT * FROM movies;
SELECT * FROM rooms;
SELECT * FROM showtimes;
SELECT * FROM bookings;