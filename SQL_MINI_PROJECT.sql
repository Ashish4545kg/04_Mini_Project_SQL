show databases  ;
use mini_project ;
#1.Write a SQL query to retrieve the first 5 rows from the "customers" table .
select * from customers limit 5 ;

#2. Write a SQL query to retrieve the unique city names from "customers" table sorted in descending order.
select distinct city from customers order by city  desc;

#3. Write a SQL query to get the number of unique city names "offices" table.
select count(distinct city) from offices ;

# 4 Write a SQL query to get the maximum, minimum and average value from the "CreditLimit" column in the "customers" table.
select max(creditLimit) , min(creditLimit) , avg(creditLimit) from customers ;

#5. Write a SQL query to get the city names which are present in “offices” table but not in “customer” table.
select city from offices where  city NOT IN (select Distinct city from customers) ;

#6. Write a SQL query to get the city names which are present in “offices” table as well as in “customer” table.
select city from offices where  city  IN (select distinct city from customers) ;

#7. Write a SQL query to get records where city or state is not given in “customer” table and creditlimit is in the range – 80000 to 130000.
select * from customers where (city is null or state is null) and  creditLimit BETWEEN  80000 and 130000 ;

#8. Write a SQL query to get the maximum number of orders placed on a particular date and what is that date in orders table.
SELECT OrderDate, COUNT(*) AS NumberOfOrders FROM orders 
GROUP BY OrderDate
HAVING COUNT(*) = (SELECT MAX(NumberOfOrders) FROM (SELECT COUNT(*) AS NumberOfOrders FROM orders GROUP BY OrderDate) AS OrderCounts);

#9. For the records which we get in previous question(Q8), write a SQL query to get the customer names and their phone numbers.

SELECT customername, phone
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.orderdate = (
  SELECT orderdate
  FROM orders
  GROUP BY orderdate
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

#10. SQL query to get the customer phone number and customer name from customers table where order is either cancelled or disputed in orders table.
select c.phone , c.customername 
from customers c
inner join orders  o on  c.customerNumber = o.customerNumber
where o.status in ('cancelled', 'disputed');

#11. Write a SQL query to get the top 4 highest selling products from orderdetails table.

select ordernumber , sum(quantityOrdered) as t_quantity 
from orderdetails 
group by ordernumber
order by t_quantity desc limit 4 ;

#12. Write a SQL query to get the count of orders placed by each customer in 2003 and 2004.
select customers.customernumber,  count(orders.ordernumber) as num_order
from customers 
inner join orders on customers.customernumber = orders.customernumber
where orders.orderdate between '2003-01-01' AND '2004-12-31'
group by customernumber 
order by num_order desc  ;

#13. Write a SQL query to get the city names from customer table where more than 4 customers reside.
SELECT city
FROM customers
GROUP BY city
HAVING COUNT(*) > 4;



