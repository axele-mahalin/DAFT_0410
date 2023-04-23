create database lab_mysql;

CREATE TABLE cars (
	VIN VARCHAR(10),
	manufacturer VARCHAR(30),
	model VARCHAR(30),
	year INT,
    color VARCHAR(30),
    PRIMARY KEY (VIN));
    
    CREATE TABLE customers (
	customer_id VARCHAR(10),
	name VARCHAR(30),
	phone_number VARCHAR(20),
	email VARCHAR(100),
    address VARCHAR(200),
    city VARCHAR(30),
    state VARCHAR(20),
    country VARCHAR(3),
    postal_code VARCHAR(5),
    PRIMARY KEY (customer_id));
  
    CREATE TABLE salespersons (
	staff_ID VARCHAR(10),
	name VARCHAR(30),
	store VARCHAR(20),
    PRIMARY KEY (staff_ID));
    
	CREATE TABLE invoices (
	invoice_number VARCHAR(10),
	date DATE,
	VIN VARCHAR(10),
	customer_name VARCHAR(30),
	staff_ID VARCHAR(10),
    PRIMARY KEY (invoice_number));
    