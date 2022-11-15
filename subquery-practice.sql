SELECT
  E.month,
  E.Sex,
  E.cases_by_gender,
  G.cases_by_month,
  E.cases_by_gender/G.cases_by_month * 100 AS contribution_by_gender

FROM (SELECT
    DATE_TRUNC(DATE(D.DateRepConf),MONTH) AS month,
    D.Sex,
    COUNT(D.Sex) AS cases_by_gender
  FROM `dabootcamp-367409.mock_exam.case_info` D
  GROUP BY 1,2) E 
LEFT JOIN (SELECT
    DATE_TRUNC(DATE(F.DateRepConf),MONTH) AS month,
    COUNT(F.Sex) AS cases_by_month
  FROM `dabootcamp-367409.mock_exam.case_info` F
  GROUP BY 1) G 
  ON E.month = G.month

ORDER BY
  E.month ASC,
  E.Sex ASC
;
