CREATE DATABASE IF NOT EXISTS LibraryManagement;

USE LibraryManagement;

-- Create tables

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100)
);

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100)
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(255)
);

CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert test data

INSERT INTO authors (author_name)
VALUES
    ('George Orwell'),
    ('Stephen King');

INSERT INTO genres (genre_name)
VALUES
    ('Fiction'),
    ('Horror');

INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES
    ('1984', 1949, 1, 1),
    ('The Shining', 1977, 2, 2);

INSERT INTO users (username, email)
VALUES
    ('john_doe', 'john@example.com'),
    ('jane_smith', 'jane@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES
    (1, 1, '2026-10-01', '2026-10-15'),
    (2, 2, '2026-10-03', '2026-10-17');