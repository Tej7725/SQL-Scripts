-- Q6] Get all languages in which films are released in the year between 2001 and 2010.
select * from city
where city like 'Man%'
select count(language.language_id) as Total_Lang, Language.Name, Film.release_year from language
inner join film on language.language_id = film.Language_id
Where film.Release_year between 2001 and 2010
Group by language.name
order by film.release_year;

-- Q7] The film ALONE TRIP (id:17) was actually released in Mandarin, update the info
UPDATE `film`
SET language_id = (SELECT language.language_id 
FROM language WHERE language.name = "English") 
WHERE film.film_id = 17

-- Q8] Fetch cast details of films released during 2005 and 2015 with PG rating
Select * from film
select concat(actor.first_name,' ', actor.last_name) as Casting, film.release_year, film.rating
from Film_actor
Inner join actor on Film_actor.actor_id = actor.actor_id
inner join film on film.film_id = Film_actor.film_id
where film.release_year between 2005 and 2015 and film.rating = 'PG'
order by film.release_year;

-- Q9] In which year most films were released?
select count(film.film_id) as Total_films, film.release_year from film
inner join Film_actor on film.film_id = Film_actor.film_id
group by film.release_year
order by Total_films desc limit 1;


-- Q10]In which year least number of films were released?
select count(film.film_id) as Total_films, film.release_year from film
inner join Film_actor on film.film_id = Film_actor.film_id
group by film.release_year
order by Total_films asc limit 1


