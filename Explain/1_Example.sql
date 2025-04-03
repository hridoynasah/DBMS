CREATE DATABASE IF NOT EXISTS myBook;
SHOW DATABASES;
USE myBook;
CREATE TABLE myBooks(
    ISBN VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    PublicationsYear INT,
    Summary TEXT
)

INSERT INTO Books(ISBN, Title, PublicationsYear, Summary) VALUES
('978-0321765723', 'The Lord of the Rings', 1954, 'Epic fantacy tale..'),
('978-0321765724', 'Harray Potter', 1954, 'Epic fantacy tale..');

SELECT * FROM Books;