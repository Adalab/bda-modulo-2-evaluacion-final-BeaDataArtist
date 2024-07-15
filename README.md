# Final Evaluation Module 2

### SQL Review Exercise using the Sakila BDD.
Sakila is a sample database that simulates a movie rental store. It contains tables such as film, actor, customer, rental, category, among others. These tables contain information about movies, actors, customers, rentals and more, and are used to perform queries and data analysis in the context of a movie rental store.


## Technologies

- MySQL 
- MySQL Workbench


## Installation

1. Install **MySQL** and **MySQL Workbench**:
- Download and install MySQL from [MySQL Community Downloads](https://dev.mysql.com/downloads/mysql/).
- Download and install [MySQL Workbench](https://dev.mysql.com/downloads/workbench/).

2. Install **Sakila BDD**
- Open and execute in the *MySQL Workbench* the files `sakila-data.squl` and `sakila-schemas.sql`.

3. Execute queries:
- Open *MySQL Workbench* and connect to the database.
- Open the `mod_2_final_evaluation.sql` file in *MySQL Workbench* and run the SQL queries to get results.

    
## Exercises

- [x] 1. Select all the movie names without duplicates.
- [x] 2. Displays the names of all movies that have a "PG-13" rating.
- [x] 3. Find the title and description of all movies that contain the word "amazing" in their description.
- [x] 4. Find the title of all movies longer than 120 minutes.
- [x] 5. Retrieve the names of all the actors.
- [x] 6. Find the first and last names of actors who have "Gibson" in their last name.
- [x] 7. Find the names of actors with an actor_id between 10 and 20.
- [x] 8. Find the title of movies in the film table that are neither "R" nor "PG-13" in rating.
- [x] 9. Find the total number of films in each rating in the film table and display the rating along with the count.
- [x] 10. Finds the total number of movies rented by each customer and displays the customer's ID, first and last name along with the number of movies rented.
- [x] 11. Finds the total number of movies rented by category and displays the category name along with the rental count.
- [x] 12. Find the average length of the films for each rating from the film table and display the rating along with the average length.
- [x] 13. Find the first and last name of the actors appearing in the movie titled "Indian Love".
- [x] 14. Displays the title of all movies that contain the word "dog" or "cat" in their description.
- [x] 15. There is an actor or actress who does not appear in any film in the film_actor table.
- [x] 16. Find the title of all the movies that were released between 2005 and 2010.
- [x] 17. Find the title of all the movies that are in the same category as "Family".
- [x] 18. Displays the first and last names of actors appearing in more than 10 movies.
- [x] 19. Find the title of all the films that are "R" and have a duration longer than 2 hours in the film table.
- [x] 20. Finds categories of movies that have an average running time longer than 120 minutes and displays the category name along with the average running time.
- [x] 21. Finds actors who have acted in at least 5 movies and displays the actor's name along with the number of movies they have acted in.
- [x] 22. Find the title of all movies that were rented for more than 5 days. Use a subquery to find the rental_ids with a duration longer than 5 days and then select the corresponding movies.
- [x] 23. Find the first and last name of actors who have not acted in any movie in the "Horror" category. Use a subquery to find actors who have acted in movies in the "Horror" category and then exclude them from the list of actors.

### Bonus

- [x] 24. Find the title of the movies that are comedies and have a duration longer than 180 minutes in the film table.
- [x] 25. Find all actors who have acted together in at least one movie. The query must show the first and last name of the actors and the number of movies in which they have acted together.



## Authors

- Beatriz Díaz- *Resolution of queries*-[BeaDataArtist](https://github.com/BeaDataArtist)
- Adalab- *Examining body*-[Adalab](https://github.com/Adalab)


## Acknowledgements

To the ADALAB professors for the attention given throughout module 2 and during the final evaluation.

