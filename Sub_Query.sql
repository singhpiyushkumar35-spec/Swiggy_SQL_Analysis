USE swiggy ;

-- 1. Which restaurant of delhi is visited by least no of people?

SELECT * FROM restaurants 
WHERE city = "Delhi"
AND rating_count = (SELECT MIN(rating_count)
                   FROM restaurants
				   WHERE city = "Delhi")
;                    
  -- 2. Which restaurants has generated maximum revenue all over india?
  
  SELECT name, cost*rating_count As revenue
  FROM restaurants
  WHERE cost*rating_count = (SELECT MAX(cost*rating_count)
                            FROM restaurants);
                            
                            
-- 3. How many restaurants are having more than the average rating?

SELECT COUNT(*) FROM restaurants 
WHERE rating > (SELECT AVG(rating)
               FROM restaurants);
               
               
-- 4. WHich restaurants of delhi has generated most revenue ?
 SELECT name , cost*rating_count As revenue FROM restaurants 
 WHERE city = "Delhi"
 AND cost*rating_count = (SELECT MAX(cost*rating_count)
						 FROM restaurants
                         WHERE city = "Delhi");
                         
-- 5. Which restaurant chain has maximum no of restaurants?

WITH t1 As (
 SELECT name, COUNT(*)  AS chains 
 FROM restaurants 
GROUP BY name )

SELECT name , chains FROM t1 
WHERE chains = (SELECT MAX(chains) FROM t1);


-- 6. Which restaurants chain has generated maximum revenue?

WITH t2 AS (
SELECT name ,  SUM(cost*rating_count) AS total_revenue 
FROM restaurants  
GROUP By name)

SELECT name , total_revenue FROM t2
WHERE total_revenue = (SELECT MAX(total_revenue) FROM t2);


-- 7. Which city has maximum no of restaurants?

SELECT city , COUNT(*) AS num_res_city
 FROM restaurants
 GROUP BY city 
 ORDER BY COUNT(*) DESC 
LIMIT 5;


-- 8. Which city has generated maximum revenue all over the india?


  SELECT city, cost*rating_count As revenue
  FROM restaurants
  WHERE cost*rating_count = (SELECT MAX(cost*rating_count)
                            FROM restaurants);
                            
                            
-- 9. List 10 least expensive cuisines?
SELECT cuisine, AVG(cost) as min_cost FROM restaurants
GROUP BY cuisine
ORDER BY AVG(cost)
LIMIT 10;


