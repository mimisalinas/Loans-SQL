CREATE TABLE loans (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    customer_id INTEGER REFERENCES customers(id),
    interest_rate DECIMAL(4,2),
    loan_amount DECIMAL(19,4),
    start_date DATE, 
    end_date DATE
);

CREATE TABLE customers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    phone VARCHAR(20)
);

CREATE TABLE payments(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE, 
    amount DECIMAL(19,4),
    loan_id INTEGER REFERENCES loans(id)
);