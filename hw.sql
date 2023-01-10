-- 1. How many actors are there with the last name ‘Wahlberg’?

-- 2 actors
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg'

-- 2. How many payments were made between $3.99 and $5.99?

-- 3238 payments were made
SELECT COUNT(*)
FROM payment
WHERE amount > 3.99 and amount < 5.99

-- 3. What film does the store have the most of? (search in inventory)

-- trick question: there are 72 films that the store has the most of, all in quantities of exactly 8.... right?

SELECT COUNT(film_id), film_id
from inventory
GROUP BY inventory.film_id
ORDER BY COUNT(film_id) DESC

-- 4. How many customers have the last name ‘William’?

-- 0 have last name William, but 1 has last name Williams

SELECT last_name
FROM customer
WHERE last_name = 'William'

SELECT last_name
FROM customer
WHERE last_name = 'Williams'


-- 5. What store employee (get the id) sold the most rentals?
-- Mike Hillyer sold the most rentals (8,040: correct?)

SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY rental.staff_id

SELECT first_name, last_name
FROM staff
WHERE staff_id = 1


-- 6. How many different district names are there?

-- 378 distinct districts

SELECT COUNT(DISTINCT district)
FROM address

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

-- Grosse Wonderful has the most actors in it ## Did I do the join correctly?

SELECT film_id, title -- COUNT(actor)
FROM film
LEFT JOIN actor
ON film.film_id = actor.actor_id
-- GROUP BY film.film_id
-- ORDER BY COUNT(actor) DESC

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

-- 13 customers have last name ending with 'es'

SELECT last_name
FROM customer
WHERE store_id = 1 and last_name LIKE '%es'

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

-- 3 payment amounts. ## why does my code block below not filter out amounts under 250?

SELECT DISTINCT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY payment.amount
HAVING SUM(amount) > 250

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

-- 5 rating categories. PG-13 has the most ratings total at 223. 
-- ## I still don't know when I should be using the GROUP BY clause..?

select DISTINCT rating, count(rating)
from film
GROUP BY film.rating -- 