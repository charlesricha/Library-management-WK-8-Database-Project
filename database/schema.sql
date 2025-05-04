
create database libraryManagementSystem;
use libraryManagementSystem;
show tables;

/* Creating tables*/
/* Creating a table for authors*/

CREATE TABLE Authors (
	authorID INT PRIMARY KEY,
	AuthorName VARCHAR(100) NOT NULL,
    DateOfBirth date
    );
    
/* Creating a table for Publishers*/

CREATE TABLE Publishers (
	PublisherID INT PRIMARY KEY,
    PubName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(100)
    );

/* Creating a table for Books*/

    CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    PublicationYear INT,
    PublisherID INT
);

 show tables; 


/* Creating a table for Users*/

 CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255)
    
);

/* Creating a table for Borrowed Books*/

CREATE TABLE borrowedBooks (
	borrowedBookID INT AUTO_INCREMENT PRIMARY KEY,  -- Added a primary key for this table
    BookID INT,  
    UserID INT,  
    LoanDate DATE NOT NULL,       
    ReturnDate DATE,       
    Status ENUM('Checked Out', 'Returned', 'Overdue') NOT NULL DEFAULT 'Checked Out', 
    FOREIGN KEY (BookID) REFERENCES Books(BookID),  -- Foreign key to Books
    FOREIGN KEY (UserID) REFERENCES Users(UserID)   -- Foreign Key to Users
    );
 
 /*Inserting Data into Tables Created*/
 
-- Insert data into Authors table
INSERT INTO Authors (AuthorID, AuthorName, DateOfBirth) VALUES
(1, 'Chinua Achebe', '1930-11-16'),
(2, 'Chimamanda Ngozi Adichie', '1976-06-05'),
(3, 'Ngugi wa Thiongo', '1938-01-05'),
(4, 'Wole Soyinka', '1934-07-13'),
(5, 'Ama Ata Aidoo', '1942-03-23');

/* Insert data into Publishers table */
INSERT INTO Publishers (PublisherID, PubName, Address, City) VALUES
(101, 'East African Educational Publishers', 'P.O. Box 45314', 'Nairobi'),
(102, 'Heinemann Educational Books', 'Kijabe Street', 'Nairobi'),
(103, 'Longhorn Publishers', 'Funzi Road', 'Nairobi'),
(104, 'Macmillan Kenya', 'Mfangano Street', 'Nairobi'),
(105, 'Oxford University Press East and Central Africa', 'ABC Place, Waiyaki Way', 'Nairobi');

-- Insert data into Books table
INSERT INTO Books (BookID, Title, ISBN, PublicationYear, PublisherID) VALUES
(1001, 'Things Fall Apart', '978-0141023281', 1958, 101),
(1002, 'Half of a Yellow Sun', '978-0307455925', 2006, 102),
(1003, 'Petals of Blood', '978-0141026930', 1977, 102),
(1004, 'Death and the Kings' , '978-0413549103', 1975, 103),
(1005, 'An American Marriage', '978-0762492485', 2018, 104);

-- Insert data into Users table
INSERT INTO Users (UserID, FirstName, LastName, Email, Phone, Address) VALUES
(2001, 'Chiamaka', 'Okoro', 'chiamaka.okoro@example.com', '+234 901 234 5678', '5 Okpara Avenue, Enugu'),
(2002, 'Fatima', 'Ahmed', 'fatima.ahmed@example.com', '+254 712 345678', 'Kenyatta Avenue, Nairobi'),
(2003, 'David', 'Oluoch', 'david.oluoch@example.com', '+254 722 987654', 'Oginga Odinga Road, Kisumu'),
(2004, 'Aisha', 'Konteh', 'aisha.konteh@example.com', '+220 777 8899', 'Kairaba Avenue, Banjul'),
(2005, 'Kwame', 'Mensah', 'kwame.mensah@example.com', '+233 244 567 890', 'Independence Avenue, Accra');

-- Insert data into borrowedBooks table
INSERT INTO borrowedBooks (borrowedBookID, BookID, UserID, LoanDate, ReturnDate, Status) VALUES
(3001, 1001, 2001, '2024-01-05', '2024-01-12', 'Returned'),
(3002, 1002, 2002, '2024-01-10', NULL, 'Checked Out'),
(3003, 1003, 2003, '2024-01-15', NULL, 'Checked Out'),
(3004, 1001, 2004, '2024-02-01', '2024-02-08', 'Returned'),
(3005, 1004, 2005, '2024-02-10', NULL, 'Overdue');








