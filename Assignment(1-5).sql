show databases
use Lco_films

show tables
desc language;

-- Q1] Which categories of movies released in 2018? Fetch with the number of movies
-- --count of film and its category in 2018
Select * from film;
Select * from category;
Select * from film_category


SELECT  category.name as Category, film.release_year,
COUNT(category.category_id) AS number_of_films 
FROM ((category 
Inner JOIN film_category ON film_category.category_id = category.category_id)
inner JOIN film ON film_category.film_id = film.film_id)
WHERE film.release_year = "2018" 
GROUP BY category.category_id

-- Q2] Update the address of actor id 36 to “677 Jazz Street”.
select * from  actor

UPDATE `address` INNER JOIN actor ON actor.address_id=address.address_id SET
`address`="677 Jazz Street" WHERE actor.actor_id=36

select actor.actor_id, concat (actor.first_name,' ', actor.last_name) as Actor_Fullname, 
address.address  from actor
inner join address on address.address_id = actor.address_id

-- Q3] Add the new actors (id : 105 , 95) in film ARSENIC INDEPENDENCE (id:41)

select * from film_actor
where film_id= 41

insert into film_actor(actor_id, Film_id) values (105,41), (95,41);


select film.title, concat (actor.first_name,' ', actor.last_name) as Actor_Fullname, 
actor.actor_id, Film.film_id
from ((Film_actor
inner join actor on actor.actor_id = Film_actor.actor_id)
inner join film on Film.film_id = Film_actor.film_id)
where film.film_id= 41

-- Q4] Get the name of films of the actors who belong to India.
select * from country

SELECT DISTINCT film.title, country.country, concat (actor.first_name,' ', actor.last_name) as Actor_Fullname,
city.country_id FROM film 
INNER JOIN film_actor ON film_actor.film_id =film.film_id 
INNER JOIN actor ON actor.actor_id = film_actor.actor_id 
INNER JOIN address on address.address_id = actor.address_id 
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id=city.country_id 
WHERE country.country = "India"

-- Q5] How many actors are from the United States?

SELECT count(distinct actor.actor_id) as US_Actors
FROM Actor
INNER JOIN address on address.address_id = actor.address_id 
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id=city.country_id 
WHERE country.country = "United States"

