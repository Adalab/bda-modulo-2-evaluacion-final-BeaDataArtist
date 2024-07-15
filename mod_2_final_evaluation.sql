USE sakila;

-- 1. Select all the movie names without duplicates.
    
SELECT DISTINCT title AS Movie
	FROM film;
    
-- 2. Displays the names of all movies that have a "PG-13" rating.

SELECT title AS Movie_PG13
 FROM film
 WHERE rating = "PG-13";
 
-- 3. Find the title and description of all movies that contain the word "amazing" in their description.

SELECT title AS Amazing_Movies, description
	FROM film
    WHERE description LIKE '%amazing%';
    
-- 4. Find the title of all movies longer than 120 minutes.

SELECT title AS Movie_120
	FROM film
    WHERE length > 120;
    
-- 5. Retrieve the names of all the actors.

SELECT first_name 
	FROM actor;
    
-- 6. Find the first and last names of actors who have "Gibson" in their last name.

SELECT first_name, last_name
	FROM actor
    WHERE last_name IN ('Gibson');

/*
Although I can use either IN or LIKE, in this case it asks for a specific last name. 
If the column contained surnames composed of a text string, the correct way would be to use the LIKE as it allows us to search for patterns.

SELECT first_name, last_name
	FROM actor
    WHERE last_name LIKE '%Gibson%';
    */
    
-- 7. Find the names of actors with an actor_id between 10 and 20.

SELECT first_name AS Actors
	FROM actor
    WHERE actor_id BETWEEN 10 AND 20;
 
-- 8. Find the title of movies in the film table that are neither "R" nor "PG-13" in rating.

SELECT title AS Movie_Title
	FROM film
	WHERE rating NOT IN ('R', 'PG-13');
    
-- 9. Find the total number of films in each rating in the film table and display the rating along with the count.

SELECT rating, COUNT(*) AS Count
	FROM film
    GROUP BY rating;
    
-- 10. Finds the total number of movies rented by each customer and displays the customer's ID, first and last name along with the number of movies rented.

SELECT c.customer_id, c.first_name, c. last_name, COUNT(rental_id) AS Total_Rentals
	FROM rental AS r
	INNER JOIN  customer AS c ON r.customer_id = c.customer_id
    GROUP BY c.customer_id;
    
-- 11. Finds the total number of movies rented by category and displays the category name along with the rental count.

SELECT c.name AS Category_Name, COUNT(r.rental_id) AS Total_Rental
	FROM category AS c
	INNER JOIN film_category AS fc ON c.category_id = fc.category_id
	INNER JOIN film AS f ON fc.category_id = f.film_id
	INNER JOIN inventory AS i ON f.film_id = i.film_id
	INNER JOIN rental AS r ON i.film_id = r.inventory_id
	GROUP BY c.name;

-- 12. Find the average length of the films for each rating from the film table and display the rating along with the average length.

SELECT rating, AVG(length) AS Average_Length
	FROM film 
    GROUP BY rating;
    
-- 13. Find the first and last name of the actors appearing in the movie titled "Indian Love".
     
SELECT a.first_name, a.last_name
	FROM actor AS a
    INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
    INNER JOIN film AS f ON fa.film_id = f.film_id
    WHERE f.title = 'Indian Love';
    
-- 14. Displays the title of all movies that contain the word "dog" or "cat" in their description.
     
SELECT title AS Dog_Cat_Movie
	FROM film
    WHERE description LIKE '%dog%' OR '%cat%';
    
-- 15. There is an actor or actress who does not appear in any film in the film_actor table.

SELECT *
	FROM actor AS a
    LEFT JOIN film_actor AS fa ON a.actor_id = fa.actor_id
    WHERE fa.film_id IS NULL;
    -- There are not

-- 16. Find the title of all the movies that were released between 2005 and 2010.

SELECT title, release_year
	FROM film
    WHERE release_year BETWEEN 2005 AND 2010;
 
-- 17. Find the title of all the movies that are in the same category as "Family".

SELECT f.title AS Family_Movies
	FROM film AS f
    INNER JOIN film_category AS fc ON f.film_id = fc.film_id
    INNER JOIN category AS c ON fc.category_id = c.category_id
    WHERE c.name = 'Family';

-- 18. Displays the first and last names of actors appearing in more than 10 movies.

SELECT a.first_name, a.last_name
	FROM actor AS a
    INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
    HAVING COUNT(fa.film_id) > 10;
    
-- 19. Find the title of all the films that are "R" and have a duration longer than 2 hours in the film table.

SELECT title
	FROM film
    WHERE rating = 'R' AND length > 120;
    
-- 20. Finds categories of movies that have an average running time longer than 120 minutes and displays the category name along with the average running time.

SELECT c.name, AVG(f.length) AS Average_Length
	FROM category AS c
    INNER JOIN film_category AS fc ON c.category_id = fc.category_id
    INNER JOIN film AS f ON fc.film_id = f.film_id
    GROUP BY c.name
    HAVING AVG(f.length) > 120;
    
-- 21. Finds actors who have acted in at least 5 movies and displays the actor's name along with the number of movies they have acted in.

SELECT a.first_name, COUNT(fa.film_id) AS Actor_Films
	FROM actor AS a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
    HAVING COUNT(fa.film_id) >= 5;

-- 22. Find the title of all movies that were rented for more than 5 days. Use a subquery to find the rental_ids with a duration longer than 5 days and then select the corresponding movies.

SELECT f.title
	FROM film AS f
    INNER JOIN inventory AS i ON f.film_id = i.film_id
    INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
    WHERE r.rental_id IN (SELECT rental_id
							FROM rental
							WHERE DATEDIFF(rental_date, return_date) > 5);
							
-- 23. Find the first and last name of actors who have not acted in any movie in the "Horror" category. Use a subquery to find actors who have acted in movies in the "Horror" category and then exclude them from the list of actors.

SELECT a.first_name, a.last_name
	FROM actor AS a
    WHERE a.actor_id NOT IN (SELECT DISTINCT fa.actor_id
								FROM film_actor AS fa
                                INNER JOIN film_category AS fc ON fa.film_id = fc.film_id
                                INNER JOIN category AS c ON fc.category_id = c.category_id
                                WHERE c.name = 'Horror');
    
-- 24. BONUS: Find the title of the movies that are comedies and have a duration longer than 180 minutes in the film table.

-- This is the answer using the view that already has both data.
SELECT title
	FROM film_list
    WHERE category = 'Comedy' AND length > 180;

-- And here's the answer if you didn't have that view.

SELECT f.title
	FROM film AS f
    INNER JOIN film_category AS fc ON f.film_id = fc.film_id
    INNER JOIN category AS c ON fc.category_id = c.category_id
    WHERE c.name = 'Comedy'AND f.length > 180;

-- 25. BONUS: Find all actors who have acted together in at least one movie. The query must show the first and last name of the actors and the number of movies in which they have acted together.
    
SELECT CONCAT(a1.first_name, ' ', a1.last_name) AS actor1,
       CONCAT(a2.first_name, ' ', a2.last_name) AS actor2,
       COUNT(*) AS movies_together
	FROM film_actor AS fa1
	INNER JOIN film_actor AS fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
	INNER JOIN actor AS a1 ON fa1.actor_id = a1.actor_id
	INNER JOIN actor AS a2 ON fa2.actor_id = a2.actor_id
	GROUP BY actor1, actor2;
