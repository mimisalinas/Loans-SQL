-- Select all of Jane Smith's loans 
SELECT loans.loan_amount
FROM loans
INNER JOIN customers ON loans.customer_id = customers.id
WHERE customers.name = 'Jane Smith';
