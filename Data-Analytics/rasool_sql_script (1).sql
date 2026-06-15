USE RASOOLBABU;
CREATE TABLE disney_movies
(
	movie_title VARCHAR(50),
	release_date VARCHAR(50),
	genre VARCHAR(50),
	mpaa_rating VARCHAR(50),
	total_gross BIGINT,
	inflation_adjusted_gross BIGINT
)
SELECT * FROM disney_movies