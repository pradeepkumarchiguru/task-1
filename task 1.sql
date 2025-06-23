create database university
use university


--table  authors
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50)
);
-- table books
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL, -- ISBN is a unique identifier for books
    publication_year INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

---table members
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(100) UNIQUE
);
--table loans
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


-----Add some sample data to test


INSERT INTO Authors (first_name, last_name, nationality) VALUES
('Stephen', 'King', 'American'),
('J.K.', 'Rowling', 'British'),
('George', 'Orwell', 'British');

INSERT INTO Books (title, isbn, publication_year, author_id) VALUES
('The Shining', '9780385121675', 1977, 1),
('Harry Potter and the Sorcerer''s Stone', '9780590353427', 1997, 2),
('1984', '9780451524935', 1949, 3);

INSERT INTO Members (first_name, last_name, address, phone_number, email) VALUES
('Alice', 'Smith', '123 Main St', '555-1234', 'alice.s@example.com'),
('Bob', 'Johnson', '456 Oak Ave', '555-5678', 'bob.j@example.com');

INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2025-06-01', '2025-06-15'),
(2, 2, '2025-06-10', NULL);

