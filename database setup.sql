-- =============================================================
#Create Database and Tables
-- =============================================================

create database BikeStoreDB;
use BikeStoreDB;

CREATE TABLE customers(
	customer_key int,
	customer_id int,
	customer_number varchar(50),
	first_name varchar(50),
	last_name varchar(50),
	country varchar(50),
	marital_status varchar(50),
	gender varchar(50),
	birthdate date null,
	create_date date
);

CREATE TABLE products(
	product_key int ,
	product_id int ,
	product_number varchar(50) ,
	product_name varchar(50) ,
	category_id varchar(50) ,
	category varchar(50) null,
	subcategory varchar(50) null,
	maintenance varchar(50) null ,
	cost int,
	product_line varchar(50),
	start_date date 
);

CREATE TABLE sales(
	order_number varchar(50),
	product_key int,
	customer_key int,
	order_date date null,
	shipping_date date null,
	due_date date null,
	sales_amount int,
	quantity tinyint,
	price int
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bs_customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_key, customer_id, customer_number, first_name, last_name, country, marital_status, 
gender, @birthdate, create_date)
SET 
 birthdate   = NULLIF(@birthdate,'');
 
 

