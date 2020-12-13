use sakila;
#1 Get all pairs of actors that worked together.
select fa1.film_id, concat(a1.first_name, ' ', a1.last_name) actor_1, concat(a2.first_name, ' ', a2.last_name) actor_2
from sakila.actor a1
join film_actor fa1
on a1.actor_id = fa1.actor_id
join film_actor fa2
on (fa1.film_id = fa2.film_id) and (fa1.actor_id != fa2.actor_id)
join actor a2
on a2.actor_id = fa2.actor_id;

#2 Get all pairs of customers that have rented the same film more than 3 times.
select customer_id, count(rental_id) from sakila.rental
group by customer_id
having count(rental_id) > 3;

SET sql_mode=(SELECT REPLACE(@@SQL_mode, 'ONLY_FULL_GROUP_BY', ''));

SELECT r1.customer_id, r1.inventory_id, count(r1.rental_id), r2.customer_id, r2.inventory_id, count(r2.rental_id) from sakila.rental as r1
join sakila.rental as r2
on r1.customer_id = r2.customer_id
and r1.inventory_id = r2.inventory_id
group by r1.customer_id, r2.customer_id
having (count(r1.rental_id)>3) and (count(r2.rental_id)>3);

#3  Get all possible pairs of actors and films.
select
    concat(a.first_name,' ', a.last_name) as actor_name
    f.title
from sakila.actor a
cross join sakila.film as f;









