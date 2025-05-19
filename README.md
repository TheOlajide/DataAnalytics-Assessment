Question One:

Based on the provision in the hint, my understanding of "customers who have both a savings and an investment plan" is that if a customer has a savings plan then a column called is_regular_savings must be equal to 1 and if customer has
investment plan column is_a_fund = 1. Both columns are in binary, with 0 indicating no investment or savings. simply, to calculate the number of investments and savings plan each customer has, we sum the columns and group by the iwner_id
and full name(the concat of both first name and last name to achieve this, noting that name column on users_customuser table is full of null values). The question also requests that we calculate the total_deposit. For this, i assumed
(based on my understanding of the given hints) that the sum of confirmed_account only is the total_deposit. The hint says 'confirmed_amount is the field for value of inflow'. I assumend based on my understanding that inflow means
deposited amount,and that the sum of this per owner_id is their total_deposit.

Question two:

Here, i am to calculate the average number of transactions per customer per month and categorize them.
But first thing i noticed is that the question did not state wether the months should be separated by year or consolidated ignoring the respective years. Because it was not explicitly stated, i assumed that it is not a requirement and
proceeded. Id on users table is used to represent each customer, month is extracted from date and COUNT is used to get number of transactions for each customer for each month(GROUPing BY customer and the extracted month). i.e each rows
represents a transaction.

i then found the average of these monthly transactions, categorized them and found the number of customers in each category by doing a count grouped by category.


Question Three:

 Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days).
I have interpreted this to mean that we want accounts that have not made any transaction in a year using today as a starting point/metric and counting backwards till the last 365 days. To get the last time a transaction was made, i used
the MAX of transaction_date and then subtracted that date from today's date, giving us the interval. i also went ahead to write a condition to filter out days interval less than 365.
However, i had a very big challenge writing this query as i could not understand what is meant by 'all active accounts (savings or investments). Having cheched through all the columns on both tables used in this query, there was none
that looked like or identify account types as 'savings', 'investment' etc. I then decided to work with my best understanding of the dataset and set a condition WHERE is_regular_savings = 1(to denote account is savings) OR is_a_fund = 1
(to denote account as investment).
This interpretation was the best of my understanding as the particular part was obfuscating.

Question Four:

The problem requires a mathematical calculation of Customer Lifetime Value (CLV) Estimation.
A CTE is used to create a result where the outer query draws data from. This is for clarity and readability. Tenure month is calculated as the difference between today and the joining date/30 days(i have assumed that this column meets
the description of account tenure(months since signup). The formular for CLV is then applied in the outer query with all the calculated parameters from the first CTE.


Conclusion:
Challenges faced in this this task is simply from little clarity on major aspects of the data. A data dictionary would have helped on familiarity with the dataset. Some of the columns used was based on my best understanding.
