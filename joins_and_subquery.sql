



-- 1. List all customers who live in Texas (use
-- JOINs)
select *
from customer 
full join address
on customer.address_id = address.address_id 
where district = 'Texas'



-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
select customer.first_name, customer.last_name, payment  -- The entire payment + the customer's first name and last name
from payment 
full join customer
on customer.customer_id = payment.customer_id
where payment.amount > 6.99




-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
select sum(payment.amount) as payments, customer
from customer
full join payment
on customer.customer_id = payment.customer_id
where customer.customer_id in (
	select customer_id
	from payment
	group by customer_id 
	having sum(amount) > 175
)
group by customer
order by payments desc


-- 4. List all customers that live in Nepal (use the city
-- table)
select customer, city.city
from customer
full join address
on customer.customer_id = address.address_id
full join city
on address.address_id = city.city_id 
where city.city = 'Nepal'



-- 5. Which staff member had the most
-- transactions?
select count(payment.staff_id) as total_transactions, staff
from payment
full join staff 
on payment.staff_id = staff.staff_id
group by staff
order by total_transactions desc
-- Output shows the staff member with staff_id 2 who has 7,304 transactions



-- 6. How many movies of each rating are
-- there?

-- Total films of each rating
select rating, count(rating) as amount
from film
group by rating
order by amount desc

-- Films of each rating in store inventory
select rating, count(inventory) as amount
from inventory
full join film
on inventory.film_id = film.film_id
group by rating
order by amount desc


-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
select *
from customer 
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
	group by customer_id 
)
order by customer_id


-- 8. How many free rentals did our stores give away?
select count(rental.rental_id) as free_rentals
from rental
full join payment
on rental.rental_id = payment.rental_id
where payment.amount = 0





