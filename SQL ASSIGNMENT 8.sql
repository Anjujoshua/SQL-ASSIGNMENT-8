#data base name is country_people
create database country_people;
use country_people;
-- create a table country

create table country(Id int, Country_name varchar(30) ,Population int not null,
 Area varchar(30)not null);
 
 -- insert  10 rows
 insert into country(Id, country_name,population,Area)
 values( 1, 'china', 1500000, 'shanghai'),
 (2, 'us', 600000, 'phoenix'),
 (3,'uk', 1000000,'king'),
 (4,'india',900000,'gujarat'),
 (5,'null',650000,'tehran'),
 (6,'japan',120000,'hiroshima'),
 (7,'belgium',800000,'charleroi'),
 (8,'chile',700000,'arica'),
 (9,'canada',300000,'toronto'),
 (10,'egypt',500000,'israel');
 
-- create a table persons

create table persons( Id int, Fname varchar(15)not null, Lname varchar(15) ,
 Population int not null, Rating int ,Country_Id int not null, 
 Country_name varchar(15) );
 
 insert into persons (Id, fname,Lname,population,Rating,Country_Id,Country_name)
 values(11,'jo','joseph',1500000,4.3,101,'china'),
 (12,'alan','jeo', 600000, 4.6,102,'us'),
 (13,'joshua','alby',1000000,3.7,103,'uk'),
 (14,'sam','jon',900000,3.9,104,'india'),
 (15,'john','peter',650000,3,105,'null'),
 (16,'lilly','mathew',120000,3.4,106,'japan'),
 (17,'jose', 'jerry',800000,4,107,'belgium'),
 (18,'patty','jim',700000,2.9,108,'chile'),
 (19,'jom','jithi',300000,4.9,109,'canada'),
 (20,'anju','jerome',500000,3.1,110,'egypt');
 
  -- Find the number of persons in each country.
  SELECT country_name, COUNT(*) AS number_of_persons FROM persons
GROUP BY country_name;
  
 -- Find the number of persons in each country sorted from high to low. 
 SELECT Country_name, COUNT(*) AS number_of_persons FROM persons GROUP BY Country_name
ORDER BY number_of_persons DESC;
 
 -- Find out an average rating for Persons in respective countries if the average is greater than 3.0
 SELECT Country_name, AVG(Rating) AS average_rating FROM persons GROUP BY Country_name
HAVING AVG(Rating) > 3.0;


 -- Find the countries with the same rating as the USA. (Use Subqueries)
 SELECT DISTINCT Country_name FROM persons
WHERE Rating = (SELECT AVG(Rating)FROM persons
WHERE Country_name = 'us');

-- Select all countries whose population is greater than the average population of all nations. 
SELECT Country_name FROM country
WHERE Population > (SELECT AVG(Population) FROM country);


--
CREATE DATABASE Product;
use  product;

CREATE TABLE Customer (Customer_Id INT PRIMARY KEY,First_name VARCHAR(30),Last_name VARCHAR(30),
    Email VARCHAR(50),Phone_no VARCHAR(15),Address VARCHAR(100),City VARCHAR(30),State VARCHAR(30),
    Zip_code VARCHAR(10),Country VARCHAR(30));
    
    INSERT INTO Customer(Customer_Id,First_name,Last_name,Email,phone_no,Address,city,State,Zip_code, Country)
    values(1,'luke','jo','luke@gmail.com',789890,'skl uk', 'JUDE',' monch',7890,'UK'),
    (2,'priya','jim','priya@gmail.com',9888999,'west canada','us', 'ameri',9800,'US'),
    (3,'jith','jacob','jith@gmail.com',92233444,'west bangal','kolkatha','bangal',6777,'INDIA');
    
     -- Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
     
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name,Email
FROM Customer;

SELECT * FROM customer_info;

-- Create a view named US_Customers that displays customers located in the US

CREATE VIEW US_Customers AS
SELECT * FROM Customer WHERE Country = 'US';
SELECT * FROM US_Customers;

-- Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
CREATE VIEW Customer_details AS SELECT 
CONCAT(First_name, ' ', Last_name) AS Full_Name, Email,Phone_no,State
FROM Customer;

SELECT * FROM Customer_details;

-- Update phone numbers of customers who live in California for Customer_details view. 
UPDATE Customer SET Phone_no = 'new_phone_number' 
WHERE State = 'California';

SELECT * FROM Customer_details
WHERE State = 'California';

--  Count the number of customers in each state and show only states with more than 5 customers
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer GROUP BY State HAVING COUNT(*) > 5;

-- Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
SELECT State, COUNT(*) AS Number_of_Customers FROM Customer_details GROUP BY State;

-- Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT *FROM Customer_details ORDER BY State ASC;




 