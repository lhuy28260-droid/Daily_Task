CREATE DATABASE IF NOT EXISTS BookWorm;
USE BookWorm;

-- 1. Tạo bảng tác giả (authors)
CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    birth_year INT,
    nationality VARCHAR(100)
);

-- 2. Tạo bảng sách (books)
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    author_id INT,
    -- Ràng buộc: Không trống, mặc định là 0 và >= 0
    price DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK (price >= 0),
    publish_year INT,
    -- Thiết lập Khóa ngoại liên kết với bảng authors
    CONSTRAINT FK_Book_Author FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- 3. Tạo bảng khách hàng (customers)
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    -- Ràng buộc: Mặc định là ngày hiện tại
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);