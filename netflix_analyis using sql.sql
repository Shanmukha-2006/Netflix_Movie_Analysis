create database netflix
use netflix
 
RENAME TABLE netflix_movies TO netflix;
 
#Total Number of Titles
SELECT COUNT(*) AS total_titles
FROM netflix;

#Count Movies and TV Shows
SELECT type, COUNT(*) AS total
FROM netflix
GROUP BY type;

#3. Top 10 Countries with Most Content
SELECT country, COUNT(*) AS total
FROM netflix
GROUP BY country
ORDER BY total DESC
LIMIT 10;

#4. Top 10 Directors
SELECT director, COUNT(*) AS total_titles
FROM netflix
WHERE director <> 'Unknown'
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

#5. Top 10 Ratings
SELECT rating, COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC;

#6. Number of Movies Released Each Year
SELECT release_year, COUNT(*) AS movies
FROM netflix
WHERE type='Movie'
GROUP BY release_year
ORDER BY release_year;

#7. Number of TV Shows Released Each Year
SELECT release_year, COUNT(*) AS tv_shows
FROM netflix
WHERE type='TV Show'
GROUP BY release_year
ORDER BY release_year;

# Latest 20 Movies
SELECT title, release_year
FROM netflix
WHERE type='Movie'
ORDER BY release_year DESC
LIMIT 20;

#Oldest 20 Movies
SELECT title, release_year
FROM netflix
WHERE type='Movie'
ORDER BY release_year
LIMIT 20;

# Content Added Each Year
SELECT year_added, COUNT(*) AS total
FROM netflix
GROUP BY year_added
ORDER BY year_added;

# Movies Released After 2020
SELECT title
FROM netflix
WHERE type='Movie'
AND release_year > 2020;

#TV Shows Released After 2020
SELECT title
FROM netflix
WHERE type='TV Show'
AND release_year > 2020;

# Indian Content
SELECT title, type
FROM netflix
WHERE country LIKE '%India%';

# US Content
SELECT title, type
FROM netflix
WHERE country LIKE '%United States%';

#TV-MA Rated Content
SELECT title
FROM netflix
WHERE rating='TV-MA';

# PG-13 Movies
SELECT title
FROM netflix
WHERE rating='PG-13';

#Count Content by Country
SELECT country, COUNT(*) AS total
FROM netflix
GROUP BY country
ORDER BY total DESC;

#Count Content by Director
SELECT director, COUNT(*) AS total
FROM netflix
GROUP BY director
ORDER BY total DESC;

#Search Movies with "Love"
SELECT title
FROM netflix
WHERE title LIKE '%Love%';

#Search Movies with "Life"
SELECT title
FROM netflix
WHERE title LIKE '%Life%';

# Count Content by Genre
SELECT listed_in, COUNT(*) AS total
FROM netflix
GROUP BY listed_in
ORDER BY total DESC;

# Movies Only
SELECT *
FROM netflix
WHERE type='Movie';

#TV Shows Only
SELECT *
FROM netflix
WHERE type='TV Show';

#Movies Released Between 2015 and 2020
SELECT title, release_year
FROM netflix
WHERE release_year BETWEEN 2015 AND 2020
AND type='Movie';

#Content Without Director
SELECT title
FROM netflix
WHERE director='Unknown';

#Count Movies and TV Shows by Country
SELECT country, type, COUNT(*) AS total
FROM netflix
GROUP BY country, type
ORDER BY country;

#27. Top 5 Years with Most Content Added
SELECT year_added, COUNT(*) AS total
FROM netflix
GROUP BY year_added
ORDER BY total DESC
LIMIT 5;

# Distinct Ratings
SELECT DISTINCT rating
FROM netflix;

29. Total Number of Countries
SELECT COUNT(DISTINCT country) AS total_countries
FROM netflix;

#Top 20 Recently Added Titles
SELECT title, date_added
FROM netflix
ORDER BY date_added DESC
LIMIT 20;

# Top 5 Countries by Number of Movies
SELECT country, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
GROUP BY country
ORDER BY total_movies DESC
LIMIT 5;

#Percentage of Movies vs TV Shows
SELECT
    type,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix), 2) AS percentage
FROM netflix
GROUP BY type;

#Find the Release Year with the Most Titles
SELECT release_year, COUNT(*) AS total_titles
FROM netflix
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 1;