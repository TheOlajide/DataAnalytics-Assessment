WITH table1 AS(
SELECT
 users.id AS customer_id,
 CONCAT(first_name,' ', last_name) AS name,
 DATEDIFF(NOW(), users.date_joined)/30 AS tenure_months,
 COUNT(*) AS total_transactions,
 AVG(0.001* amount) AS avg_profit_per_transaction
FROM
 users_customuser AS users
JOIN
 savings_savingsaccount AS savings
ON
 savings.owner_id = users.id
GROUP BY
 users.id, CONCAT(first_name,' ', last_name)
)

SELECT
 customer_id,
 name,
 tenure_months,
 total_transactions,
 ROUND((total_transactions/tenure_months)*12*avg_profit_per_transaction,2) AS estimated_clv
FROM
 table1
ORDER BY
 estimated_clv DESC