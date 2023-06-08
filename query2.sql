-- Get all John Doe's loan payments, identify the total
SELECT SUM(payments.amount)
FROM payments
INNER JOIN loans ON loans.id = payments.loan_id
INNER JOIN customers ON customers.id = loans.customer_id
WHERE customers.name = 'John Doe';