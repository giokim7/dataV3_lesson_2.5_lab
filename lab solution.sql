
    #Select all the actors with the first name ‘Scarlett’.
    SELECT *
	FROM actors
	WHERE first_name = 'Scarlett';
    #How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
    SELECT 
    SUM(inventory.id) AS total_copies_available,
    COUNT(DISTINCT film.title) AS unique_movie_titles
	FROM
		inventory
	JOIN
		film ON inventory.film_id = film.film_id;
    #What are the shortest and longest movie duration? Name the values max_duration and min_duration.
    SELECT 
    MIN(film.length) AS min_duration,
    MAX(film.length) AS max_duration
	FROM
    film;

    #What's the average movie duration expressed in format (hours, minutes)?
    SELECT 
    CONCAT(FLOOR(AVG(film.length) / 60), ' hours, ', AVG(film.length) % 60, ' minutes') AS average_duration
	FROM
    film;

    #How many distinct (different) actors' last names are there?
    SELECT 
    COUNT(DISTINCT last_name) 
	FROM
    actor;

    #How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
    SELECT 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
	FROM
    rental;

    #Show rental info with additional columns month and weekday. Get 20 results.
    SELECT 
    rental_id,
    rental_date,
    MONTH(rental_date) AS month,
    WEEKDAY(rental_date) AS weekday
	FROM
    rental
	LIMIT 20;

    #Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
    SELECT 
    rental_id,
    rental_date,
    CASE 
        WHEN WEEKDAY(rental_date) < 5 THEN 'workday'
        ELSE 'weekend'
    END AS day_type
	FROM
    rental;

    #Get release years.
    SELECT 
    DISTINCT (release_year)
	FROM
    film;

    #Get all films with ARMAGEDDON in the title.
    SELECT 
    *
	FROM
    film
	WHERE
    title LIKE '%ARMAGEDDON%';

    #Get all films which title ends with APOLLO.
    SELECT 
    *
	FROM
    film
	WHERE
    title LIKE '%APOLLO';

    #Get 10 the longest films.
    SELECT 
    *
	FROM
    film
	ORDER BY
    duration DESC
	LIMIT 10;

    #How many films include Behind the Scenes content?
    SELECT 
    COUNT(*)
	FROM
    film
	WHERE
    special_features LIKE '%Behind the Scenes%';

