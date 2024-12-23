-- Corrected query to analyze daily top Google Search terms with rising trends
SELECT
   x.refresh_date AS week,
  x.refresh_date AS Day,
  x.term AS Top_Term,
  x.rank
FROM
  `bigquery-public-data.google_trends.top_terms` AS x
LEFT JOIN
  `bigquery-public-data.google_trends.top_rising_terms` AS y
ON
  x.term = y.term
WHERE
  x.rank <= 3  -- Include terms ranked in the top 3
  AND x.refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 4 WEEK)  -- Last 4 weeks
GROUP BY
  week ,Day, Top_Term, x.rank
ORDER BY
 Day DESC;