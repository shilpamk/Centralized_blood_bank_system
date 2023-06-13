/*
On its own, AS is a convenient way to clean up the data returned by your query. It's even more powerful when combined with WITH in what's called a "common table expression".

A common table expression (or CTE) is a temporary table that you return within your query. CTEs are helpful for splitting your queries into readable chunks, and you can write queries against them.
*/

/* QUERY TO GET TOTAL BLOOD QUANTITY FOR EACH BLOOD GROUP HAVING QUANTITY LESS THAN 2000 UNITS */

USE centralized_blood_bank_system;
WITH results AS 
(
	SELECT bb.Blood_id, sum(bb.Quantity) AS Total_quantity FROM blood_banks AS bb
	GROUP BY bb.Blood_id
	HAVING Total_quantity < 2000
)
SELECT 
	res.Blood_id,
	b.Blood_group,
	Total_quantity FROM results AS res
JOIN bloods AS b
ON
b.Blood_id = res.Blood_id
;


