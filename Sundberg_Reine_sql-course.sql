/*Select all brands.
Modify header:
Brand*/

SELECT brand_name AS "Brand" FROM production.brands;

/*Customers from Bronx and Brooklyn
Modify headers:
Cust ID, Last name, First name, Email, Street Address, City, State
Order by City and Last name*/

SELECT customer_id AS 'Cust ID', last_name AS 'Last name', first_name AS 'First name', email AS 'Email', street AS 'Street Address', city AS 'City', state AS 'State'
FROM sales.customers
WHERE city in ('Bronx', 'Brooklyn')
ORDER BY City, last_name;

/*All Products, brand should be readable not id. 
Modify headers:
Product name, Brand, Model, Price
Order by Product name, descending order*/

SELECT product_name AS 'Product name', brand_name AS 'Brand', model_year AS 'Model', list_price AS 'Price'
FROM production.brands, production.products
WHERE production.brands.brand_id = production.products.brand_id
ORDER BY product_name DESC; 

/*Use SQL COUNT() function to get number of customers who are from state NY.
Modify header:
NY Customers*/

SELECT COUNT( *) AS "NY Customers"
FROM sales.customers
WHERE state like 'NY';

--Show result of the different tables

select * from production.brands
select * from production.categories
select * from production.products
select * from production.stocks
select * from sales.customers
select * from sales.order_items
select * from sales.orders
select * from sales.staffs
select * from sales.stores

/*All products that Pamala Henry from Bronx NY has ordered.
Brand should be readable not id
Modify headers:
Product name, Brand, Price*/

select p.product_name AS 'Product name', b.brand_name AS 'Brand', soi.list_price AS 'Price' 
from production.products AS p
inner join production.brands as b
on p.brand_id = b.brand_id
inner join sales.order_items AS soi
on p.product_id = soi.product_id
inner join sales.orders AS so
on soi.order_id = so.order_id
inner join sales.customers AS sc
on so.customer_id = sc.customer_id
where sc.customer_id
--where first_name like 'Pamala'
--AND last_name like 'Henry'
--AND city like 'Bronx'
--AND state like 'NY'
ORDER BY brand_name;
