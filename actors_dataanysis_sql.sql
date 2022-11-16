select * from actor; 
/* 
 My partner and I want to come by each of the stores in person and meet the managers
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please)
*/
select first_name,last_name,address,district,city,country 
from staff
 inner join store
 on staff.store_id = store.store_id
 inner join address
 on store.address_id = address.address_id
 inner join city
 on address.city_id = city.city_id
 inner join country
 on city.country_id = country.country_id;
 
 
 
 /* 
 I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost.

 */
 
 
 select store_id,film.film_id,film.title,inventory_id,rating,rental_rate,replacement_cost
 from film
 inner join inventory
 on film.film_id = inventory.film_id;
 /*
 From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store.

 */
 select count(inventory_id),rating,store_id
 from inventory
 join film
 on inventory.film_id = film.film_id
 group by store_id,rating;
/*
Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category
*/

select count(title),replacement_cost,store_id,category_id
from inventory
inner join film
on inventory.film_id = film.film_id
inner join film_category
on film.film_id = film_category.film_id
group by category_id,store_id;

/*
We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country.
*/

select first_name,last_name,address,active,store_id,city,country
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on city.city_id = city.city_id
inner join country
on city.country_id = country.country_id;

select * from payment;
select * from customer;
/*
We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list.
*/
select first_name,last_name,payment.rental_id,sum(amount)
from customer
inner join payment
on customer.customer_id = payment.customer_id
group by first_name,last_name
order by sum(amount) desc;

SELECT email
FROM customer
JOIN payment
on customer.customer_id = payment.customer_id;
 
 
 