-- What are the different genres?

use applestore_formacusers;
select distinct prime_genre from applestore_formacusers

# Response: There are 24 genres: Games, Productivity...

-- Which is the genre with the most apps rated?

select prime_genre, sum(rating_count_tot)
from applestore_formacusers
group by prime_genre;
order by sum(rating_count_tot) desc

# Response: The genre with the most apps rated is: Games

-- Which is the genre with most apps?

select count(1), prime_genre
from applestore_formacusers
group by prime_genre
order by count(1) desc;

# Response: The genre with the most apps is: Game

-- Which is the one with least?

select count(1), prime_genre
from applestore_formacusers
group by prime_genre
order by count(1) asc;

# Response: The genre with the least apps is: Medical

-- Find the top 10 apps most rated.

select track_name, rating_count_tot
from applestore_formacusers
order by rating_count_tot desc
limit 10;

-- Find the top 10 apps best rated by users.

select track_name, user_rating
from applestore_formacusers
order by user_rating desc
limit 10;

-- Take a look at the data you retrieved in question 5

select track_name, rating_count_tot, prime_genre, price, size_bytes
from applestore_formacusers
order by rating_count_tot desc
limit 10;

# Response: It looks like the apps that get the most rates are the ones that are free, not sure we can actually make a correlation with the size bytes but it looks like the one that has the most rates is the one that is the heaviest. Maybe because this is the one with the most features?

-- Take a look at the data you retrieved in question 6

select track_name, user_rating, prime_genre, price, size_bytes
from applestore_formacusers
order by user_rating desc
limit 10;

#Response: It looks like the apps that get the best rates are the ones that are not free, between 0.99$ and 3.99$, not sure we can actually make a correlation with the size bytes but it looks like the two first ones which got the best rates are the heaviest. Maybe here again because this is the one with the most features?

-- Now compare the data from questions 5 and 6. What do you see?

select track_name, user_rating, rating_count_tot, prime_genre, price, size_bytes
from applestore_formacusers
order by user_rating and rating_count_tot desc
limit 10;

#Response: We see that the apps that are the most and best rated in the same time are not the ones that got a 5/5 as rate, but indeed the ones that are from the Games category as we've seen previously, and the ones that are paid.

-- How could you take the top 3 regarding both user ratings and number of votes?

select track_name, user_rating, rating_count_tot, prime_genre
from applestore_formacusers
order by user_rating and rating_count_tot desc
limit 3;

-- Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

select track_name, user_rating, prime_genre, price #we're gonna check the correlation between the rate given by the user and the price of the apps
from applestore_formacusers
order by user_rating desc
limit 10;

#we see that most of the apps in the top 10 are paid, only 3 (=30%) of them are free so it looks like a paid app offers a better experience than a free one.

select track_name, user_rating, rating_count_tot, prime_genre, price #here, we're gonna check the correlation between the number of ratings and the price of the apps
from applestore_formacusers
order by rating_count_tot desc
limit 10;

#we see that most of the apps in the top 10 are free, only 1 (=1%) of them is paid, so it looks like free apps have most chance to receive more ratings than paid ones.

select avg(user_rating) as rating, prime_genre, avg(price) as price #finally, we're gonna check the correlation between the user ratings and the price of the apps in average
from applestore_formacusers
group by prime_genre #we group by prime_genre cause we don't want an analysis too detailed as above, by name app
order by rating desc
limit 10;

#we see here that the apps that got the best rating, 4.5 in average are also the ones that cost the most in average. Therefore, users do care about the price and generally give a better rate for paid apps. However, they are more used to giving a rate for free apps.






