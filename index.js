const express = require('express');
const mysql = require('mysql2');
const path = require('path');
require('dotenv').config(); // Load environment variables

const app = express();
const port = 3000;
// Middleware to parse form data
app.use(express.urlencoded({ extended: true }));

// 1.  Database Connection
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: 3306
});

// 2. Connect to the database
db.connect((err) => {
    if (err) {
        console.error('Database connection error:', err);
        return; // Stop if there's an error
    }
    console.log('Connected to the database');
});

// 3. Serve your HTML (index.html)
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// 4.  Example:  Fetch data from the database and send it to the client
app.get('/books', (req, res) => {
    const sql = 'SELECT * FROM Books'; //  Corrected SQL query
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error querying the database:', err);
            res.status(500).json({ error: 'Database error', details: err.message });
            return;
        }
        res.json(results); // Send the data as JSON
    });
});

// 5. Handle the form submission for borrowing a book

app.post('/borrow', (req, res) => {
    const { userId, bookId } = req.body; // Get data from the form
    // Basic validation (you should add more robust validation)
    if (!userId || !bookId) {
        return res.status(400).json({ error: 'Missing user ID or book ID' });
    }
    const sql = 'INSERT INTO borrowedBooks (BookID, UserID, LoanDate, Status) VALUES (?, ?, CURDATE(), "Checked Out")';
    db.query(sql, [bookId, userId], (err, result) => {
        if (err) {
            console.error('Error borrowing book:', err);
            res.status(500).json({ error: 'Database error', details: err.message });
            return;
        }
        res.json({ message: 'Book borrowed successfully!', result: result });
    });
});

//  Start the server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
