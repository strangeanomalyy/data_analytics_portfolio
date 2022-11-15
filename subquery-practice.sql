-- Problem: What is the split of cases in terms of gender? How many cases were male? How many were female? Show the totals per month. Consider only those aged 18-60 Order results by month ascending, and then by gender (Female first).
-- Run this SQL code using Google Big Query. 

-- the columns selected here and operated on are from the first subquery
SELECT
  E.month,
  E.Sex,
  E.cases_by_gender,
  G.cases_by_month,

-- a subquery to get the number of cases per month and gender
FROM (SELECT
    DATE_TRUNC(DATE(D.DateRepConf),MONTH) AS month,
    D.Sex,
    COUNT(D.Sex) AS cases_by_gender
  FROM `dabootcamp-367409.doh_drop.case_info` D
  WHERE 
    D.Age BETWEEN 18 AND 60
  GROUP BY 1,2) E 
-- a second subquery to join to the first subquery to get the number of cases per month
LEFT JOIN (SELECT
    DATE_TRUNC(DATE(F.DateRepConf),MONTH) AS month,
    COUNT(F.Sex) AS cases_by_month
  FROM `dabootcamp-367409.doh_drop.case_info` F
  WHERE 
    F.Age BETWEEN 18 AND 60
  GROUP BY 1
  ) G 
  ON E.month = G.month

ORDER BY
  E.month ASC,
  E.Sex ASC
;
