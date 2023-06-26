-- Get all Alice Brown's loan payments, identify the total
SELECT SUM(payments.amount)
FROM payments
INNER JOIN loans ON loans.id = payments.id 
INNER JOIN customers ON customers.id = loans.id 
WHERE customers.name = 'Alice Brown';