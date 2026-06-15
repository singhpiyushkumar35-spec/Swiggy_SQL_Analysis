-- 1. SELECT all records from the restaurant table 

USE swiggy ;

SELECT * FROM restaurants ;

-- 2. Rank every restaurant from most expensive to least expensive? 

SELECT * , RANK()
OVER(ORDER BY cost DESC) AS r
FROM restaurants ;

-- 3. Rank every restaurant from most visited to least visited.

SELECT * , RANK()
OVER(ORDER BY rating_count DESC) AS popularity_index
FROM restaurants;

-- 4. Rank every restaurant from most expensive to least expensive as per their city.

SELECT * , RANK()
OVER(PARTITION BY city ORDER BY cost DESC) AS rank_city 
FROM restaurants;


-- 5. Dense-rank every restaurant from most expensive to least expensive as per their city.

SELECT * , DENSE_RANK()
OVER( PARTITION BY city ORDER BY cost DESC) AS highest_rated
FROM restaurants; 

-- 6. Row-number every restaurant from most expensive to least expensive as per their city.

SELECT * , ROW_NUMBER()
OVER(PARTITION BY city ORDER BY cost DESC) AS r
FROM restaurants ;

-- 7. Rank the restaurant based on their prices (most to least expensive) as per cuisine using rank, dense_rank, and row_number.
SELECT * , RANK()
OVER(ORDER BY cost DESC	
