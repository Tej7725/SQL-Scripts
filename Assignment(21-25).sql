-- Q21] The entire cast of the movie WEST LION has changed. The new actors are DAN TORN,
-- MAE HOFFMAN, SCARLETT DAMON. How would you update the record in the safest way ?
use LCO_films
select * from Actor
where first_name like "M__"

Select concat (actor. first_name, " ", actor.last_name) as Actor, film.title from film_actor
inner join actor on film_actor.actor_id = actor.actor_id
inner join film on film.film_id = film_actor.film_id
where film.title = "WEST LION"

delete from film_actor
where film_id = (select film_id from Film where film.title = "WEST LION")

insert into film_actor (actor_id, film_id)
values ((select actor_id from actor where actor.first_name ="DAN" and actor.last_name = "TORN"), 
( select film_id from Film where film.title = "WEST LION")),
((select actor_id from actor where actor.first_name ="MAE" and actor.last_name = "HOFFMAN"), 
( select film_id from Film where film.title = "WEST LION")),
((select actor_id from actor where actor.first_name ="SCARLETT" and actor.last_name = "DAMON"), 
(Select film_id from Film where film.title = "WEST LION"));

-- Q22]The entire category of the movie WEST LION was wrongly inserted. The correct categories
-- are Classics, Family, Children. How would you update the record ensuring no wrong data is left?

Select film.title, category.name from film_category
inner join category on category.category_id = film_category.category_id
inner join film on film.film_id = film_category.film_id
where film.title = "WEST LION"

delete from film_category
where film_id = (select film_id from film where film.title = 'west lion');

insert into film_category(film_id, category_id)
values ((select film_id from film where film.title = 'west lion'),
(select category_id from category where category.name = 'Classics')),
((select film_id from film where film.title = 'west lion'),
(select category_id from category where category.name = 'Family')),
((select film_id from film where film.title = 'west lion'),
(select category_id from category where category.name = 'Children'));

-- Q23] How many actors acted in films released in 2017?
select count(actor_id),  film.Release_year from film_actor
inner join film on film.film_id = film_actor.film_id
where film.release_year = '2017'

-- Q24]How many Sci-Fi films released between the year 2007 to 2017?

select film.title as Movie, category.name as Category, film.Release_year from film_category
inner join film on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
where film.release_year between '2007' and '2017' and category.name = 'sci-fi'
order by film.release_year

-- Q25] Fetch the actors of the movie WESTWARD SEABISCUIT with the city they live in.
select distinct (concat ( actor.first_name,' ',actor.last_name)) as Actor, city from film_actor
inner join film on film.film_id = film_actor.film_id
inner join actor on actor.actor_id = film_actor.actor_id
inner join address on address.address_id = actor.address_id
inner join city on city.city_id = address.city_id;
where film.title = "WESTWARD SEABISCUIT";

