CREATE DATABASE liberary;
USE liberary;
CREATE TABLE Books_Details(
Book_Id TINYINT,
Book_Name VARCHAR(20),
Author_Name VARCHAR(30),
Book_Price FLOAT,
Publish_Year YEAR,
Book_Volume CHAR(10)
);
SHOW TABLES;
SELECT *FROM books_details;
describe books_details;

-- ways to insert
INSERT into books_details VALUE(1,'DBMS','Balguru Swammy',345.45,'1999',"V6");
INSERT into books_details VALUE(2,'Data Structure','Padma Reddy',500.00,'1995',"V3"),(3,'Algorithm','Jeff',400.00,'2010',"V4"),(4,'The Jungle Book','Rudyard Aipling',600.50,'2000',"V1");
INSERT into books_details VALUE(1,'DBMS','Balguru Swammy',245.45,'1999',"V1");

-- second way to insert

insert into books_details(Book_Id,Book_Name,Author_Name,Book_Price,Publish_Year)value(4,'c','Chethan Bhagat',456.90,'1999');
insert into books_details(Book_Id,Book_Name,Book_Price,Publish_Year)value(5,'Hierarchy',656.90,'1908');

select Book_Id,Book_Name,Author_Name from books_details;

select *from books_details where Publish_Year='1999';
select *from books_details where Publish_Year='1908';
select *from books_details where Publish_Year>='2005';
select *from books_details where Publish_Year>='1999' and Book_Price<=400;

-- alter tables
alter table books_details add column no_of_pages int;
select * from books_details;
-- SELECT * FROM liberary.books_details;
alter table books_details add column num_Of_pages int after Book_Name;
alter table books_details drop column no_of_pages;
alter table books_details drop column num_Of_pages;
alter table books_details rename column Book_Price to Book_Amount;
alter table books_details rename to books;

select * from books;
truncate books;
drop table books_details;
drop database liberary;

-- order by
select * from books_details order by Book_Price;
select *from books_details;
select * from books_details order by Book_Volume;
select * from books_details order by Book_Price desc;
select * from books_details order by Book_Name;
select * from books_details order by Book_Name desc;

select * from books_details limit 4;
select * from books_details order by Book_Id asc limit 4;
select * from books_details order by Book_Id desc limit 3;

select * from books_details where Book_Name='The Jungle Book' or Book_Name='Hierarchy';
select * from books_details where Book_Name in('The jungle book','c','DBMS');
select * from books_details where Book_Id in(1,3,5) order by Book_Id asc limit 5;
select * from books_details where Book_Price between 500 and 1000;
select * from books_details where Book_Price between 100 and 500 order by Publish_Year;

-- as
select book_price as book_with_amount_greater_than_500 from books_details where book_price>500;
select B.book_price as book_amount from books_details B;
select book_price from books_details;

select * from books_details where Book_Name='The jungle book';
select * from books_details where Book_Name like '%structure';
select * from books_details where Book_Name like '%s';
select * from books_details where Book_Name like 'the%';
select * from books_details where Book_Name like 'd%';
select * from books_details where Book_Name like '%a%';
select * from books_details where Book_Name like '____a%';
select * from books_details where Book_Name like '_a_a%';
select * from books_details where Book_Name like '_h_%';

-- date and time

select curdate();
select curdate()as Present_date;
select curtime()as Present_time;
select now()as Present_DateTime;

select date('2021-11-13 09;39:56')as extracted_date;
select date(now())as extracted_date;
select time('2021-11-13 09:39:56')as extracted_time;
select time(now())as extracted_time;
select dayofmonth(('2021-11-13 09:53:56'))as extracted_day;
select monthname(('2021-11-13 09:53:56'))as extracted_month;
select year(('2021-11-13 09:53:56'))as extracted_year;
select week(('2021-11-13 09:53:56'))as extracted_week;
select dayname(('2021-11-13 09:53:56'))as extracted_day;

-- highest and lowest cost of book
select max(book_price)from books_details; 
select min(book_price)from books_details; 
select min(book_price)as lowest_price from books_details;
select avg(Book_price)as average_cost_price from books_details;

INSERT into books_details VALUE(6,'Sarvakar','Vikram Sampath',900.00,'2012',"V4"),(7,'Dream of the endless','Neil Gaiman',1800.00,'2010',"V5"),(8,'Marvel secret','Jim Shooter',1500.50,'2020',"V7");
 select *from books_details;
 select sum(Book_price)as total_cost_price from books_details;
 select sum(Book_id)as no_of_book from Books_details;
 select sum(Book_name)as no_of_book_id from Books_details;
 
 -- get the number of book written by author by using group by clause
 
 select Author_name, count(Book_name) from books_details group by Author_name;
 select Author_name, count(Book_name) as no_of_book_by_author from books_details group by Author_name;
 select Book_Price, count(Book_Price) as no_in_Price from books_details group by Book_Price;
 select Publish_year, count(Book_name) as No_of_books_in_year from books_details group by Publish_year;
select Publish_year, count(Book_name) as No_of_books_in_year from books_details where Publish_year>2004 group by Publish_year;

select *from books_details order by book_id;

select book_name,count(book_name)as no_of_copies from books_details group by book_name;

select publish_year,max(book_price) as highest_cost_of_book from books_details group by publish_year;

select publish_year,min(book_price) as lowest_cost_of_book from books_details group by publish_year;

select author_name,publish_year,count(book_name) as no_of_bokks_in_year_by_author from books_details group by author_name,publish_year;

select publish_year,max(book_price) as highest_cost_of_book,min(book_price) as lowest_cost_of_book from books_details group by publish_year;

select publish_year,sum(book_price) as total_sum_of_book_in_a_year from books_details group by publish_year;

select publish_year,sum(book_price) as total_sum_of_book_in_a_year from books_details group by publish_year order by publish_year;

select publish_year,sum(book_price) as total_sum_of_book_in_a_year from books_details group by publish_year having total_sum_of_book_in_a_year>1000;

select book_volume,count(book_name)as no_of_books_in_volume from books_details group by book_volume having no_of_books_in_volume>1;

 select author_name,min(book_price)as lowest_book_price_by_author from books_details group by author_name having lowest_book_price_by_author<1000;
 
 
 
 
 
 
 












