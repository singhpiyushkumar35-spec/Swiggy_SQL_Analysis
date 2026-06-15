USE swiggy ;
-- 1. Select all columns from the restaurant table.
 SELECT * FROM restaurants ;

-- 2. Display the names and cities of all restaurants.

 SELECT name , city 
 FROM restaurants ;

 -- 3. Find all restaurants located in Bangalore.

SELECT name  FROM restaurants
WHERE city = "Bangalore" ;

-- 4. List the names and ratings of restaurants with a rating greater than 4.0.

SELECT name, rating FROM restaurants 
WHERE rating > 4 ;

-- 5. Find restaurants where the cost is less than or equal to 300.

SELECT  name , cost FROM restaurants 
WHERE cost <= 300 ;

-- 6. Display all distinct cuisine types available in the dataset.

SELECT DISTINCT cuisine  FROM restaurants ;


-- 7 . Find all restaurants serving Biryani cuisine.

SELECT name , cuisine FROM restaurants 
WHERE cuisine = "Biryani" ;

-- 8. Show the top 5 restaurants with the highest ratings.
SELECT name , rating FROM restaurants
ORDER By rating DESC
LIMIT 5 ;


-- 9. List restaurants with a rating count greater than 1000.

SELECT name , rating_count FROM restaurants
WHERE rating_count > 1000 ;

-- 10. Count the total number of restaurants in the dataset.

SELECT COUNT(*) AS total_res
FROM restaurants ;

-- 11. Find the average cost of all restaurants.

SELECT 
AVG(cost) As avg_cost
FROM restaurants;

-- 12. Display restaurant names and costs ordered by cost in ascending order.

SELECT name , cost FROM restaurants
ORDER BY cost ASC ;

-- 13. Find the average rating of restaurants for each city.

 
SELECT DISTINCT city,  AVG(rating) AS avg_city_rat FROM restaurants
GROUP BY city;


-- 14. Count the number of restaurants available in each city.

 SELECT COUNT(DISTINCT city) AS unique_cities 
 FROM restaurants ;


-- 15. Find the maximum and minimum cost of restaurants for each cuisine.

SELECT cuisine, MIN(cost) As min_cost ,  MAX(cost) As max_cost
FROm restaurants  GROUP BY cuisine ;

-- 16. List cuisines that have more than 10 restaurants.
 
  SELECT cuisine , COUNT(*) FROM restaurants 
 GROUP BY cuisine
  HAVING COUNT(*)>10 ;
 
 
-- 17. Find the top 3 cities with the highest number of restaurants.
 
 SELECT city , COUNT(*) FROM restaurants
 GROUP BY city 
 ORDER BY COUNT(*) DESC
 LIMIT 3;
 

-- 18.How many cities are there in my dataset.

SELECT COUNT(DISTINCT city) FROM restaurants;

 
 -- 19 Rating > 4 , rating_count > 3000
 
 SELECT * FROM restaurants 
 WHere rating > 4 AND rating_count > 3000;
 
 -- 21 Either city is mumbai or rating is 5
 SELECT * FROM restaurants 
 WHERE city = "MUMBAi" OR rating = 5 ;
 
 
 -- 22 Rating count to be between 3000 and 10000
 
 SELECT * FROM restaurants 
 WHERE rating_count BETWEEN 3000 AND 10000;
 
 
 -- 23 Either in Mumbai  , Bangalore , Delhi , Goa
 
 SELECT * FROM restaurants 
 WHERE city IN ( " Mumbai", "Bangalore" , "Delhi", "Goa");
 


-- 24. Find cities where the average restaurant rating is greater than 4.0.

SELECT city , AVG(rating) AS avg_rating FROM restaurants 
GROUP BY city
HAVING avg_rating > 4.0
ORDER BY avg_rating DESC; 


-- 25. List cities that have more than one cuisine type available.
SELECT city , COUNT(DISTINCT cuisine) AS total_cuisine
FROM restaurants
GROUP BY city
HAVING COUNT(DISTINCT cuisine)>1
ORDER BY total_cuisine DESC;

-- 26. Find the restaurant(s) with the maximum rating_count in the dataset.

SELECT name , MAX(rating_count) AS max_rating_count
FROM restaurants
GROUP BY name;


 
 