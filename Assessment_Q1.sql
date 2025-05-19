/* question 1*/
SELECT
 plans.owner_id,
 CONCAT(first_name,' ', last_name) AS name,
 SUM(is_regular_savings) AS savings_count,
 SUM(is_a_fund) AS investment_count,
 SUM(savings.confirmed_amount) AS total_deposit
FROM
 users_customuser AS users
JOIN
 savings_savingsaccount AS savings
ON
 savings.owner_id = users.id
JOIN
 plans_plan AS plans
ON
 plans.id = savings.plan_id
GROUP BY
 plans.owner_id, CONCAT(first_name,' ', last_name)
HAVING
 SUM(plans.is_regular_savings) >= 1 
AND
 SUM(plans.is_a_fund) >= 1
ORDER BY
 total_deposit DESC;