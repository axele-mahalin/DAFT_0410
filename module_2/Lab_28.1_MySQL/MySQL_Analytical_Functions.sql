#Question 1

select customer_id, payment_date, amount,
sum(amount) over (partition by customer_id order by payment_date) as total_amount
from payment;

#Question 2

select amount, date_format(payment_date, '%Y-%m-%d' ) as date,
Rank() over (partition by date_format(payment_date, '%Y-%m-%d' ) order by amount desc) as rnk,
Dense_rank() over (partition by date_format(payment_date, '%Y-%m-%d' ) order by amount desc) as dense_rnk
from payment;

#Question 3

select name as category, title as film_title, rental_rate,
Rank() over (partition by name order by rental_rate desc) as rnk,
Dense_rank() over (partition by name order by rental_rate desc) as dense_rnk
from sakila.film as f
left join sakila.film_category as fca
	on f.film_id = fca.film_id
left join sakila.category as ca
	on fca.category_id = ca.category_id
;

#Question 4 (Bonus) -> will do if I catch up on the other labs

#Question 5

#Hint: select the payment_id, customer_id, amount, and payment_date columns from the payment table, and then applying the LAG and LEAD functions to the amount column, partitioning by customer_id and ordering by payment_date.

select payment_id, customer_id, amount, payment_date,
amount - Lag(amount) over (partition by customer_id order by payment_date asc) as diff_from_prev,
amount - Lead(amount) over (partition by customer_id order by payment_date asc) as diff_from_next
from payment;












