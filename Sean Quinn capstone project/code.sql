-- Quiz Funnel Discovery
SELECT *
FROM survey
LIMIT 10;

-- Quiz Funnel Grouped By Question
SELECT question, COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;

-- Home Try-On Funnel
SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

-- Home Try-On Funnel Left Join
SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on', h.number_of_pairs, p.user_id IS NOT NULL as 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h' ON q.user_id = h.user_id
LEFT JOIN purchase as 'p' ON q.user_id = p.user_id
LIMIT 10; 

-- Quizzes Leading To Home-Try On (750)
WITH comparison AS (SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on', h.number_of_pairs, p.user_id IS NOT NULL as 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h' ON q.user_id = h.user_id
LEFT JOIN purchase as 'p' ON q.user_id = p.user_id)

SELECT SUM(is_home_try_on)
FROM comparison;

-- Quizzes Leading To Purchase (495)
WITH comparison AS (SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on', h.number_of_pairs, p.user_id IS NOT NULL as 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h' ON q.user_id = h.user_id
LEFT JOIN purchase as 'p' ON q.user_id = p.user_id)

SELECT SUM(is_purchase)
FROM comparison;

-- Total Count of Unique Users in Quiz Table (1000)
SELECT COUNT(DISTINCT user_id)
FROM quiz;

-- Total Count of Unique Users in Home Try-On Table (750)
SELECT COUNT(DISTINCT user_id)
FROM home_try_on;

-- Number of Pairs Comparison (3 Pairs - 201 purchases)
WITH comparison AS (SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on', h.number_of_pairs, p.user_id IS NOT NULL as 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h' ON q.user_id = h.user_id
LEFT JOIN purchase as 'p' ON q.user_id = p.user_id)

SELECT SUM(is_purchase)
FROM comparison
WHERE number_of_pairs IS '3 pairs';

-- Number of Pairs Comparison (5 Pairs - 294 purchases)

WITH comparison AS (SELECT DISTINCT q.user_id, h.user_id IS NOT NULL AS 'is_home_try_on', h.number_of_pairs, p.user_id IS NOT NULL as 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h' ON q.user_id = h.user_id
LEFT JOIN purchase as 'p' ON q.user_id = p.user_id)

SELECT SUM(is_purchase)
FROM comparison
WHERE number_of_pairs IS '5 pairs';

--Number of Pairs Comparison 
SELECT number_of_pairs, COUNT(number_of_pairs)
FROM home_try_on
GROUP BY number_of_pairs;

-- Did More Men or Women Purchase Glasses?

SELECT COUNT(user_id) AS 'count', style
FROM purchase
GROUP BY style
ORDER BY count DESC;

-- Most Popular Style for Men and Women

SELECT COUNT(user_id) AS 'count', style, model_name
FROM purchase
GROUP BY model_name
ORDER BY count DESC;

-- Most Popular Colors for Men and Women

SELECT COUNT(user_id) AS 'count', style, color
FROM purchase
GROUP BY color
ORDER BY count DESC;

-- Most Popular Survey Responses For Q1
SELECT response, COUNT(response)
FROM survey
WHERE question = '1. What are you looking for?'
GROUP BY response;

-- Most Popular Survey Responses For Q2
SELECT response, COUNT(response)
FROM survey
WHERE question = '2. What''s your fit?'
GROUP BY response;

-- Most Popular Survey Responses For Q3
SELECT response, COUNT(response)
FROM survey
WHERE question = '3. Which shapes do you like?'
GROUP BY response;

-- Most Popular Survey Responses For Q4
SELECT response, COUNT(response)
FROM survey
WHERE question = '4. Which colors do you like?'
GROUP BY response;

-- Most Popular Survey Responses For Q5
SELECT response, COUNT(response)
FROM survey
WHERE question = '5. When was your last eye exam?'
GROUP BY response;



