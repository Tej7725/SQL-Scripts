-- Q26] What is the total length of all movies played in 2008?
use lco_films
select sum(length) as Total_length, release_year from Film
where release_year = 2008;

-- Q27] Which film has the shortest length? In which language and year was it released?

Select film.length as Movie_length, language.name as Language, film.title as Movie, film.release_year as Release_year from film 
right join Language on language.language_id = film.language_id
where film.length = (select min(film.length) from film)

-- Q28] How many movies were released each year?

select count(film_id) as Total_movie_releases, release_year from Film
group by Release_year

-- Q29] How many languages of movies were released each year?
select count(film.language_id)as Language_count, language.name from Film
inner join language on language.language_id = film.language_id
group by film.language_id
 
-- Q30] Which actor did least movies?
select count(film_actor.film_id) as Film_counts, concat(actor.first_name,' ', actor.last_name) as Actor, actor.actor_id from film_actor
inner join actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id 
order by Film_counts limit 1
