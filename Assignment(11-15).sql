-- Q11] Get the details of the film with maximum length released in 2014
use lco_films
select f.title, f.description, f.release_year, f.length, l.name from film f
inner join language l on f.language_id = l.language_id
where release_year = 2014
order by f.length desc limit 1;

-- Q12] Get all Sci-Fi movies with NC-17 ratings and language they are screened in
select * from film
Select category.name as category_name,film.title as Movie, film.rating as Rating, language.name as Language
from film_category
inner join film on film.film_id = film_category.film_id
inner join category on category.Category_id = film_category.Category_id 
inner join language on language.language_id = film.language_id
where film.rating = 'NC-17' and category.name = 'Sci-Fi'

-- Q13)The actor FRED COSTNER (id:16) shifted to a new address:
-- 055, Piazzale Michelangelo, Postal Code-50125 , District-Rifredi at Florence, Italy.
-- Insert the new city and update the address of the actor.

Select concat(actor.first_name, ' ', actor.last_name) as Actor_name,  actor.actor_id, city.city, address.postal_code,country.country, address.address from film_actor
inner join actor on actor.actor_id = film_actor.actor_id
inner join address on actor.address_id = address.address_id
inner join city on address.city_id = city.city_id
inner join country on city.country_id = Country.country_id
where actor.actor_id = 16

INSERT INTO `city`(`city`, `country_id`) VALUES (
"Florence",(SELECT country_id FROM country WHERE country.country = "Italy"))
update `address` inner join  actor ON actor.address_id = address.address_id
SET address.address = "055, Piazzale Michelangelo", address.district = "Rifredi ", 
address.city_id =(SELECT city_id FROM city WHERE city.city = "Florence") , address.postal_code = "50125"
WHERE actor.actor_id = 16;

-- Q14] A new film “No Time to Die” is releasing in 2020 whose details are :
-- Title :No Time to Die
-- Description: Recruited to rescue a kidnapped scientist, globe trotting spy James Bond finds
-- himself hot on the trail of a mysterious villain, who's armed with a dangerous new technology.
-- Language: English
-- Org. Language : English
-- Length : 100
-- Rental duration : 6
-- Rental rate : 3.99
-- Rating : PG-13
-- Replacement cost : 20.99
-- Special Features = Trailers,Deleted Scenes
-- Insert the above data.


