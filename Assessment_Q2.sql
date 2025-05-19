/*This query calculates the average number of transactions per customer per month without regard for year.*/
WITH table1 AS (
SELECT
 users.id AS customer,
 EXTRACT(MONTH FROM transaction_date) AS month, COUNT(*) AS total_txn
FROM
 users_customuser AS users
JOIN
 savings_savingsaccount AS savings
ON
 savings.owner_id = users.id
GROUP BY
 users.id,EXTRACT(MONTH FROM transaction_date)
),
table2 AS (
SELECT
 customer, AVG(total_txn) AS avg_transactions_per_month    
FROM table1
GROUP BY customer
 ),
 table3 AS (
SELECT avg_transactions_per_month, customer,
       CASE WHEN avg_transactions_per_month >=10 THEN 'High Frequency'
            WHEN avg_transactions_per_month BETWEEN 3 AND 9.999 THEN 'Medium Frequency'
            ELSE  'Low Frequency' END AS frequency_category
FROM
 table2
)
SELECT
 avg_transactions_per_month,
 COUNT(*) AS customer_count , frequency_category
FROM
 table3
GROUP BY
 frequency_category,  avg_transactions_per_month
