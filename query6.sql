-- Output which customer made the most payments 
SELECT COUNT(*) AS number_of_payments, customers.name
FROM payments
INNER JOIN loans ON loans.id = payments.loan_id
INNER JOIN customers ON customers.id = loans.customer_id 
GROUP BY customers.id
ORDER BY number_of_payments DESC
LIMIT 1;