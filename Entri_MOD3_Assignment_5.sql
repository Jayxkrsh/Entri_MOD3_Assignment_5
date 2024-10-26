use entri_d41;
-- creating table country
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(255),
    Population INT,
    Area INT
);

-- creating table persons
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(255)
);

-- inersting rows to both the tables country & persons

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 37742154, 9984670),
(3, 'Brazil', 212559417, 8515767),
(4, 'Germany', 83783942, 357022),
(5, 'France', 65273511, 551695),
(6, 'India', 1380004385, 3287263),
(7, 'Australia', 25499884, 7692024),
(8, 'Mexico', 128932753, 1964375),
(9, 'Russia', 145912025, 17098242),
(10, 'China', 1439323776, 9596961);

SELECT * FROM country;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 100000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 50000, 3.8, 2, 'Canada'),
(3, 'Alice', NULL, 30000, 4.2, 3, 'Brazil'),
(4, 'Bob', 'Brown', 20000, 3.5, 4, 'Germany'),
(5, 'Charlie', NULL, 15000, 4.0, 5, 'France'),
(6, 'David', 'Wilson', 40000, 2.8, 6, 'India'),
(7, 'Eve', 'Johnson', 25000, 3.6, 7, 'Australia'),
(8, 'Frank', 'Lee', 60000, 3.9, 8, 'Mexico'),
(9, 'Grace', 'Davis', 35000, 4.7, 9, 'Russia'),
(10, 'Hank', 'Garcia', 90000, 4.1, 10, 'China');

SELECT * FROM Persons;

-- Write an SQL query to print the first three characters of Country_name from the Country table.
SELECT SUBSTRING(Country_name,1,3) AS Country_prefix FROM Country;

-- Write an SQL query to concatenate first name and last name from Persons table.
SELECT CONCAT(Fname, ' ', COALESCE(Lname, '')) AS Full_Name FROM Persons;

-- Write an SQL query to count the number of unique country names from Persons table.
SELECT COUNT(DISTINCT country_name) AS Unique_Country_Count FROM persons;

-- Write a query to print the maximum population from the Country table.
SELECT MAX(Population) FROM Country;

-- Write a query to print the minimum population from Persons table.
SELECT MIN(Population) FROM persons;

--  Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Ivy', NULL, 5000, 3.3, 1, 'USA'),
(12, 'Jack', NULL, 7000, 2.9, 2, 'Canada');

SELECT COUNT(Lname) AS Count_Lname FROM Persons;

-- Write a query to find the number of rows in the Persons table.
SELECT COUNT(*) AS Total_Persons FROM Persons;

-- Write an SQL query to show the population of the Country table for the first 3 rows.
SELECT Population FROM Country LIMIT 3;

-- Write a query to print 3 random rows of countries.
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

-- List all persons ordered by their rating in descending order
SELECT * FROM Persons ORDER BY Rating DESC;

-- Find the total population for each country in the Persons table.
SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name;

-- Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name HAVING Total_Population > 50000;

-- List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating 
FROM Persons 
GROUP BY Country_name 
HAVING COUNT(*) > 2
ORDER BY Average_Rating ASC;







