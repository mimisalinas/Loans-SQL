-- Output which customer has the most debt

-- First select total loans for each customer, create temporary table
WITH total_loans_table AS (  
    SELECT SUM(loans.loan_amount) AS total_loans, loans.customer_id
    FROM loans
    GROUP BY loans.customer_id
),

-- Second select total payments for each customer, create temporary table 
total_payments_table AS(
    SELECT SUM(payments.amount) AS total_payments, loans.customer_id 
    FROM payments
    INNER JOIN loans ON loans.id = payments.loan_id
    GROUP BY loans.customer_id
)

-- Get the debt for each customer 
SELECT (tlt.total_loans - IFNULL(tpt.total_payments, 0)) AS total_debt, customers.name 
FROM total_loans_table tlt -- renaming the table
LEFT JOIN total_payments_table tpt ON tpt.customer_id = tlt.customer_id -- joining temporary tables by customer id
INNER JOIN customers ON customers.id = tlt.customer_id
ORDER BY total_debt DESC
LIMIT 1;


