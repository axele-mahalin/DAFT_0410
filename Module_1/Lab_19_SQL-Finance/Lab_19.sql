select max(price), min(price) from order_items; #The price for the highest order is 6735 and the price for the lowest price order is 0.85

select max(shipping_limit_date), min(shipping_limit_date) from order_items; #The range of the orders shipping date is from the 19th of September 2016 to the 10th of April 2020

select count(distinct customer_id) as nb_customers, customer_state
from customers
group by customer_state
order by nb_customers desc; #The states with the greatest number of customers

select count(distinct customer_id) as nb_customers, customer_city
from customers
where customer_state = 'SP'
group by customer_city
order by nb_customers desc; #The cities within the states with the greatest number of customers that also got the greatest number of customers

with temp_table as (
select distinct business_segment, if(business_segment is null, 0, 1) as business_segment_count from closed_deals
)

select sum(business_segment_count) from temp_table; #There are 33 distinct business segments

select business_segment, sum(declared_monthly_revenue)
from closed_deals
group by business_segment
order by sum(declared_monthly_revenue) desc
limit 3; #The 3 business segments with the highest declared monthly revenue (of those that declared revenue)alter

select count(distinct review_score) from order_reviews; #There are 5 total number of distinct review score values

select review_score, count(review_score) as review_number,
	case when review_score = 1 then "Bad"
		 when review_score = 2 then "Low"
		 when review_score = 3 then "Ok"
		 when review_score = 4 then "Good"
		 when review_score = 5 then "Excellent!"
    end as description
from order_reviews
group by review_score
order by review_number desc; #the review score and category occurring most frequently in the table is 5 and "Excellent!"

select review_score, count(review_score) as review_number
from order_reviews
group by review_score
order by review_number desc; #the review score that occurs the most frequently is "5" and it occurs 57420 times



