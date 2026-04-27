--  Khởi tạo Database hỗ trợ tiếng Việt
DROP DATABASE IF EXISTS BookWorm;
CREATE DATABASE BookWorm ;
USE BookWorm;

--  Tạo bảng Tác giả (Authors) - Phải tạo trước để làm gốc
CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    birth_year INT,
    nationality VARCHAR(100)
);

--  Tạo bảng Sách (Books) - Có khóa ngoại nối tới Authors
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    author_id INT,
    -- Ràng buộc: Giá mặc định là 0 và không được âm
    price DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK (price >= 0),
    publish_year INT,
    CONSTRAINT FK_Book_Author FOREIGN KEY (author_id) REFERENCES authors(id)
);

--  Tạo bảng Khách hàng (Customers)
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    -- Ràng buộc: Email và SĐT không được trùng lặp
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    -- Mặc định lấy thời gian hiện tại khi đăng ký
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Thêm 3 Tác giả
INSERT INTO authors (full_name, birth_year, nationality) VALUES 
('Nguyễn Nhật Ánh', 1955, 'Việt Nam'),
('Arthur Conan Doyle', 1859, 'Anh'),
('Dale Carnegie', 1888, 'Mỹ');

-- Thêm 8 Cuốn sách (AuthorID 1: Ánh, 2: Doyle, 3: Carnegie)
INSERT INTO books (book_name, category, author_id, price, publish_year) VALUES 
('Mắt Biếc', 'Văn học', 1, 120000, 1990),
('Cho tôi xin một vé đi tuổi thơ', 'Văn học', 1, 110000, 2008),
('Sherlock Holmes: Chiếc nhẫn tình cờ', 'Trinh thám', 2, 85000, 1887),
('Sherlock Holmes: Con chó của dòng họ Baskerville', 'Trinh thám', 2, 160000, 1902),
('Đắc Nhân Tâm', 'Kỹ năng', 3, 80000, 1936),
('Quẳng gánh lo đi và vui sống', 'Kỹ năng', 3, 85000, 1948),
('Cô gái đến từ hôm qua', 'Văn học', 1, 95000, 1989),
('Sherlock Holmes: Những cộng sự', 'Trinh thám', 2, 90000, 1917);

-- Thêm 5 Khách hàng
INSERT INTO customers (full_name, email, phone) VALUES 
('Lương Huy', 'huy.luong@gmail.com', '0912345678'),
('Nguyễn Quốc Thắng', 'thang.nq@gmail.com', '0987654321'),
('Phan Hoàng Sơn', 'son.ph@outlook.com', '0905111222'),
('Lê Trung Hiếu', 'hieu.lt@gmail.com', '0933444555'),
('Hoàng Mai Phương', 'phuong.hm@yahoo.com', '0977888999');

--  In ra sách Trinh thám giá dưới 100.000đ
SELECT * FROM books 
WHERE category = 'Trinh thám' AND price < 100000;

--  Tìm khách hàng sử dụng email Google (@gmail.com)
SELECT * FROM customers 
WHERE email LIKE '%@gmail.com';

--  Lấy ra Top 3 cuốn sách đắt nhất cửa hàng
SELECT * FROM books 
ORDER BY price DESC 
LIMIT 3;

--  Giảm giá 10% cho sách xuất bản trước năm 2020
UPDATE books 
SET price = price * 0.9 
WHERE publish_year < 2020;

-- Xem lại kết quả sau khi giảm giá
SELECT book_name, price, publish_year FROM books;