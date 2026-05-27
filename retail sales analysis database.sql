create table customers(customer_id serial primary key , 
name varchar(100), city varchar(50));

select * from customers;

create table products(product_id serial primary key,
product_name varchar(100), price int );

select * from products;

create table orders( order_id serial primary key ,customer_id int ,
product_id int , quantity int , order_date date  );

select * from orders;

insert into customers ( name , city )
values ( 'Amit' , 'Bhubneswar' ),
       (' Rahul' , 'Cuttuck' ),
	   ('Sneha' , 'Jajpur' );

insert into products( product_name, price)
values ( 'Laptop', 50000),
       ('Mouse', 500),
	   ('Keyboard', 1000);

insert into orders( customer_id,product_id , quantity,order_date)
values(1,1,1,'2026-05-01'),
      (2,2,2,'2026-05-02'),
	  (3,3,2,'2026-05-03');

(1.) Total sales calculate .

select 
sum(p.price * o.quantity) as total_sales
from orders o
join products p on 
o.product_id = p.product_id;


(2.) Customer Wise Spending. 

select c.name ,
sum(p.price * o.quantity)as total_spent
from orders o
join customers c on 
o.customer_id = C.customer_id 
join products p on 
o.product_id = p.product_id 
group by c.name ;

(3.) Most Sold Product 

select p.product_name,
sum(o.quantity)as total_quantity 
from orders o
join products p on 
o.product_id = p.product_id 
group by p.product_name 
order by total_quantity desc;