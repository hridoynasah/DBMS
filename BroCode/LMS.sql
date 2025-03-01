-- Create the database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Price DECIMAL(5,2)
);

-- Create the Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100),
    JoinDate DATE
);

-- Create the Borrowing table
CREATE TABLE Borrowing (
    BorrowID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Create the Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100),
    BirthDate DATE,
    Nationality VARCHAR(50)
);

-- Create the Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert sample data into Books table
INSERT INTO Books (BookID, Title, Author, Genre, Price) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 10.99),
(2, '1984', 'George Orwell', 'Dystopian', 8.99),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 12.99);

-- Insert sample data into Members table
INSERT INTO Members (MemberID, MemberName, JoinDate) VALUES
(1, 'John Doe', '2022-01-15'),
(2, 'Jane Smith', '2022-02-20'),
(3, 'Emily Johnson', '2022-03-25');

-- Insert sample data into Borrowing table
INSERT INTO Borrowing (BorrowID, MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, 1, '2022-04-01', '2022-04-15'),
(2, 2, 2, '2022-04-05', '2022-04-20'),
(3, 3, 3, '2022-04-10', '2022-04-25');

-- Insert sample data into Authors table
INSERT INTO Authors (AuthorID, AuthorName, BirthDate, Nationality) VALUES
(1, 'Harper Lee', '1926-04-28', 'American'),
(2, 'George Orwell', '1903-06-25', 'British'),
(3, 'F. Scott Fitzgerald', '1896-09-24', 'American');

-- Insert sample data into Reviews table
INSERT INTO Reviews (ReviewID, BookID, MemberID, Rating) VALUES
(1, 1, 1, 5),
(2, 2, 2, 4),
(3, 3, 3, 5);
SELECT 
    MemberID, 
    COUNT(BorrowID) AS TotalBooksBorrowed
FROM 
    Borrowing
GROUP BY 
    MemberID;