-- Output all Jane Smith's loans payments done before 2023-06-01
SELECT payments.amount, payments.date, loans.name
FROM payments
INNER JOIN loans ON loans.id = payments.loan_id
INNER JOIN customers ON customers.id = loans.customer_id
WHERE customers.name = 'Jane Smith' AND payments.date < '2023-06-01';