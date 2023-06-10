-- Alternative more efficient solution to query 5 

-- Create only 1 temporary table to get the debt for each loan
WITH loan_debts AS (
    SELECT (loans.loan_amount - IFNULL(SUM(p.amount),0)) AS loan_debt, loans.customer_id
    FROM loans
    LEFT JOIN payments p ON p.loan_id = loans.id
    GROUP BY loans.id
)

SELECT SUM(loan_debts.loan_debt) AS customer_debts, customers.name
FROM loan_debts
INNER JOIN customers ON customers.id = loan_debts.customer_id 
GROUP BY customers.id, customers.name
ORDER BY customer_debts DESC
LIMIT 1;
