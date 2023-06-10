-- Output which customer has the most in loan amounts
SELECT SUM(loans.loan_amount) AS total_loans, customers.name
FROM loans
INNER JOIN customers ON customers.id = loans.customer_id
GROUP BY customers.id 
ORDER BY total_loans DESC
LIMIT 1; 

