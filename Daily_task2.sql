CREATE DATABASE IF NOT EXISTS book_worm_db ;
USE book_worm_db;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(100) NOT NULL
);


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL -- Chốt chặn để không trùng Email
);


CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    Genre VARCHAR(50),
    Price DECIMAL(15, 2) CHECK (Price >= 0),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Thêm 3 Tác giả
INSERT INTO Authors (AuthorName) VALUES 
('Nguyễn Nhật Ánh'),
('Arthur Conan Doyle'),
('Dale Carnegie');

INSERT INTO Customers (FullName, Email) VALUES 
('Lương Huy', 'huy.luong@email.com'),
('Nguyễn Quốc Thắng', 'thang.nq@email.com'),
('Phan Hoàng Sơn', 'son.ph@email.com'),
('Lê Trung Hiếu', 'hieu.lt@email.com'),
('Hoàng Mai Phương', 'phuong.hm@email.com');

INSERT INTO Books (Title, Genre, Price, AuthorID) VALUES 
('Mắt Biếc', 'Văn học', 120000, 1),
('Cho tôi xin một vé đi tuổi thơ', 'Văn học', 110000, 1),
('Sherlock Holmes: Chiếc nhẫn tình cờ', 'Trinh thám', 150000, 2),
('Sherlock Holmes: Con chó của dòng họ Baskerville', 'Trinh thám', 160000, 2),
('Đắc Nhân Tâm', 'Kỹ năng', 80000, 3),
('Quẳng gánh lo đi và vui sống', 'Kỹ năng', 85000, 3),
('Cô gái đến từ hôm qua', 'Văn học', 95000, 1),
('Sherlock Holmes: Những cộng sự', 'Trinh thám', 140000, 2);

-- Thử thêm 1 khách hàng mới nhưng dùng email đã tồn tại 
INSERT INTO Customers (FullName, Email) 
VALUES ('Khách hàng ảo', 'huy.luong@email.com');