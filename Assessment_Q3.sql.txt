WITH inactivity AS (
  SELECT
    savings.plan_id,
    savings.owner_id,
    MAX(savings.transaction_date) AS last_transaction_date,
    DATEDIFF(NOW(), MAX(savings.transaction_date)) AS inactivity_days
  FROM
    plans_plan AS plans
  JOIN
    savings_savingsaccount AS savings
  ON
    plans.id = savings.plan_id
  WHERE
     is_regular_savings = 1
  OR
     is_a_fund = 1
  GROUP BY
    savings.plan_id, savings.owner_id
)
SELECT
  plan_id,
  owner_id,
  last_transaction_date,
  inactivity_days
FROM
  inactivity
WHERE
  inactivity_days >= 365;