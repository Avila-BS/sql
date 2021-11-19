create database customer;
use customer;
create table customer_details(
customer_id int,
customer_name varchar(30)not null,
customer_email varchar(20) unique,
customer_phone bigint unique,
customer_address varchar(50),
primary key (customer_id)
);
show tables;
select*from customer_details;
use customer;
select*from customer_details;
insert into customer_details values (1,'vijay','vijay@gmail.com','6789809008','kolkata');
insert into customer_details values (2,'varun','varu@gmail.com','6789809009','kolegal');
insert into customer_details values (3,'lavanya','lavanya@gmail.com','6789809089','mysore');
insert into customer_details values (4,'vikas','vr@gmail.com','6789809026','banglore');
insert into customer_details values (5,'charu','ch@gmail.com','67898090988','chennai');
insert into customer_details values (6,'dia','dia@gmail.com','6789809508','bhopal');
insert into customer_details values (7,'jay','jay@gmail.com','6789809208','assam');
insert into customer_details values (8,'avi','avi@gmail.com','6789809058','hydrabad');
insert into customer_details values (9,'koushi','kh@gmail.com','6789809028','delhi');
insert into customer_details values (10,'vibha','vibha@gmail.com','6789809038','shimogga');

create table orders(
order_id int,
product_name varchar(30) not null,
order_amount decimal check(order_amount>100),
order_dateTime datetime,
customer_ref int,
primary key(order_id),
foreign key(customer_ref)references customer_details(customer_id)
);
select*from orders;
select*from customer_details;

insert into orders value(101,'iphone',65000.00,'2021-11-1 10:30:00',1);

insert into orders value(102,'iphone 10',75000.00,'2021-11-2 11:00:00',2);

insert into orders value(103,'camera',45000.00,'2021-11-5 12:05:32',5),(104,'laptop',52000.00,'2021-11-7 12:30:05',6),(105,'cooker',1500.00,'2021-11-6 17:05:32',3),(106,'iron box',1000.00,'2021-11-9 19:06:32',7),(107,'Television',25000.00,'2021-11-5 7:05:32',6),(108,'bag',2000.00,'2021-11-12 19:15:32',5),(109,'washing machine',20000.00,'2021-11-13 21:34:32',9);

insert into orders(order_id,product_name,order_amount,order_dateTime) value(110,'jean',2500.00,'2021-11-8 16:02:00');

select O.order_id,O.product_name,O.order_amount,O.customer_ref,C.customer_id,C.customer_name,C.customer_email from customer_details C inner join orders O on O.customer_ref=C.customer_id;

select * from customer_details C left join orders O on O.customer_ref=C.customer_id;

select * from customer_details C right join orders O on O.customer_ref=C.customer_id;

select * from customer_details C left join orders O on O.customer_ref=C.customer_id
UNION ALL
select * from customer_details C right join orders O on O.customer_ref=C.customer_id;

create table offers(
offer_id int,
offer_name VARCHAR(35) NOT NULL,
offer_percentage decimal check(offer_percentage<40),
offer_ratings int,
order_ref int,
primary key(offer_id),
foreign key(order_ref) references orders(order_id)
);

insert into  offers(offer_id,offer_name,offer_percentage,offer_ratings)value(1,'end of year sale',30,5);

select*from offers;

select *from orders cross join offers;

-- view

create view iphone_orders as select*from orders where product_name like 'iphone%';
select*from iphone_orders;

select*from iphone_orders where order_amount>65000;

alter view iphone_orders as select*from orders where product_name like 'i%';
select*from iphone_orders;

create view offers_given as select*from orders cross join offers;
select*from offers_given;

select*from offers_given where order_amount>40000;

drop view offers_given;