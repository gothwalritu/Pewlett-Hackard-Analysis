-- 1. What is the average cost to rent a film in the Sakila stores?

SELECT * FROM film
--GROUP BY store
SELECT AVG(rental_rate) As "Average rental rate" FROM film;
-- 2. What is the average rental cost of films by rating? On average, what is the cheapest rating of films to rent? Most expensive?

SELECT rating, AVG(rental_rate) FROM film GROUP BY rating;

-- 3. How much would it cost to replace all the films in the database?

SELECT rating, SUM(replacement_cost) FROM film GROUP BY rating;

-- 4. How much would it cost to replace all the films in each ratings category?


-- 5. How long is the longest movie in the database? The shortest?
