use sakila;

-- 1. In the table actor, which are the actors whose last names are not repeated?
select * from actor;
select concat(first_name," ",last_name) as "Actors n/ repeated last names", count(last_name) as "Q"
from actor
group by first_name
having count(last_name) = 1;


-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

select * from actor;
select last_name "Repeated Last names", count(last_name) as "Q"
from actor
group by last_name
having count(last_name) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
select * from rental;
select staff_id, count(rental_id) as "Amount of Rentals"
from rental
group by staff_id;

-- 4. Using the film table, find out how many films were released each year.
select * from film;
select count(distinct release_year) from film; 	-- inpescting how many unique values are there in release_year
												-- there is only 1 value for year (2006) in table film, so the query could be a simple count
select release_year, count(film_id) as "Amount of films"
from film
group by release_year;

-- 5. Using the film table, find out for each rating how many films were there.
select count(distinct rating) from film; -- inpescting how many unique values are there in rating
select rating, count(film_id) as "Amount of films"
from film
group by rating; 

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, round(avg(length), 2) as "Film Length Mean"
from film
group by rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length), 2) as "Film Length Mean"
from film
group by rating
having round(avg(length), 2) > 120;