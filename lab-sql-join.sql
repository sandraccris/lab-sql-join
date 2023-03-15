-- lab-sql-join
USE sakila;

-- 1. List the number of films per category.

SELECT FC.category_id, COUNT(F.film_id) as total_films
FROM film as F
INNER JOIN film_category as FC
ON F.film_id = FC.film_id
GROUP BY FC.category_id
ORDER BY total_films DESC;


-- 2. Display the first and the last names, as well as the address, of each staff member.

SELECT S.first_name, S.last_name, A.address
FROM staff as S
INNER JOIN address as A
ON S.address_id = A.address_id;


-- 3. Display the total amount rung up by each staff member in August 2005.

SELECT S.first_name, S.last_name, SUM(P.amount)
FROM staff as S
INNER JOIN payment as P
ON S.staff_id = P.staff_id
WHERE P.payment_date LIKE "2005-08%"
GROUP BY S.first_name, S.last_name;


-- 4. List all films and the number of actors who are listed for each film.

SELECT F.title, COUNT(FA.actor_id) AS total_actors
FROM film as F
INNER JOIN film_actor as FA
ON F.film_id = FA.film_id
GROUP BY F.title;


-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
-- -- List the customers alphabetically by their last names.

SELECT C.first_name, C.last_name,  SUM(amount) as total_payment
FROM payment as P
INNER JOIN customer as C
ON P.customer_id = C.customer_id
GROUP BY C.first_name, C.last_name
ORDER BY C.last_name;

