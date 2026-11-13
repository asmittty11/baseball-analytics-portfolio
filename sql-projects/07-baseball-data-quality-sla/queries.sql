-- 1. Daily QC completion and SLA
SELECT g.game_date, COUNT(DISTINCT g.game_id) AS final_games,
COUNT(DISTINCT r.review_id) AS total_reviews,
COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END) AS completed_reviews,
COUNT(DISTINCT CASE WHEN r.completed=0 THEN r.review_id END) AS open_reviews,
COUNT(DISTINCT CASE WHEN r.completed=1 AND r.within_sla=0 THEN r.review_id END) AS late_reviews,
COALESCE(ROUND(100.0*COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END)/NULLIF(COUNT(DISTINCT r.review_id),0),1),0.0) AS completion_pct,
COALESCE(ROUND(100.0*COUNT(DISTINCT CASE WHEN r.completed=1 AND r.within_sla=1 THEN r.review_id END)/NULLIF(COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END),0),1),0.0) AS sla_pct
FROM games_w6d4 g LEFT JOIN reviews_w6d4 r ON g.game_id=r.game_id
WHERE g.game_status='Final' GROUP BY g.game_date
HAVING COUNT(DISTINCT g.game_id)>=2
ORDER BY open_reviews DESC,sla_pct ASC,g.game_date ASC;

-- 2. Operator SLA accountability
SELECT o.operator_name,o.team,COUNT(DISTINCT g.game_id) AS final_games,
COUNT(DISTINCT r.review_id) AS total_reviews,
COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END) AS completed_reviews,
COUNT(DISTINCT CASE WHEN r.completed=0 THEN r.review_id END) AS open_reviews,
COUNT(DISTINCT CASE WHEN r.priority='High' AND r.completed=0 THEN r.review_id END) AS open_high,
COALESCE(ROUND(100.0*COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END)/NULLIF(COUNT(DISTINCT r.review_id),0),1),0.0) AS completion_pct,
COALESCE(ROUND(100.0*COUNT(DISTINCT CASE WHEN r.completed=1 AND r.within_sla=1 THEN r.review_id END)/NULLIF(COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END),0),1),0.0) AS sla_pct
FROM games_w6d4 g JOIN operators_w6d4 o ON g.operator_id=o.operator_id
LEFT JOIN reviews_w6d4 r ON g.game_id=r.game_id
WHERE g.game_status='Final' GROUP BY o.operator_name,o.team
HAVING COUNT(DISTINCT g.game_id)>=2
ORDER BY open_high DESC,completion_pct ASC,o.operator_name ASC;

-- 3. League backlog and SLA risk
SELECT g.league,COUNT(DISTINCT g.game_id) AS final_games,
COUNT(DISTINCT r.review_id) AS total_reviews,
COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END) AS completed_reviews,
COUNT(DISTINCT CASE WHEN r.completed=0 THEN r.review_id END) AS open_reviews,
COUNT(DISTINCT CASE WHEN r.priority='High' AND r.completed=0 THEN r.review_id END) AS open_high,
COUNT(DISTINCT CASE WHEN r.completed=0 THEN g.game_id END) AS games_with_open,
COALESCE(ROUND(100.0*COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END)/NULLIF(COUNT(DISTINCT r.review_id),0),1),0.0) AS completion_pct,
COALESCE(ROUND(100.0*COUNT(DISTINCT CASE WHEN r.completed=1 AND r.within_sla=0 THEN r.review_id END)/NULLIF(COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END),0),1),0.0) AS late_share_pct
FROM games_w6d4 g LEFT JOIN reviews_w6d4 r ON g.game_id=r.game_id
WHERE g.game_status='Final' GROUP BY g.league
HAVING COUNT(DISTINCT CASE WHEN r.completed=0 THEN r.review_id END)>=2
ORDER BY open_high DESC,open_reviews DESC,g.league ASC;

-- 4. Review-type performance
SELECT r.review_type,COUNT(DISTINCT r.review_id) AS total_reviews,
COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END) AS completed_reviews,
COUNT(DISTINCT CASE WHEN r.completed=0 THEN r.review_id END) AS open_reviews,
COUNT(DISTINCT CASE WHEN r.priority='High' AND r.completed=0 THEN r.review_id END) AS open_high,
COUNT(DISTINCT CASE WHEN r.completed=1 AND r.within_sla=0 THEN r.review_id END) AS late_reviews,
COALESCE(ROUND(100.0*COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END)/NULLIF(COUNT(DISTINCT r.review_id),0),1),0.0) AS completion_pct,
COALESCE(ROUND(100.0*COUNT(DISTINCT CASE WHEN r.completed=1 AND r.within_sla=0 THEN r.review_id END)/NULLIF(COUNT(DISTINCT CASE WHEN r.completed=1 THEN r.review_id END),0),1),0.0) AS late_share_pct
FROM reviews_w6d4 r JOIN games_w6d4 g ON r.game_id=g.game_id
WHERE g.game_status='Final' GROUP BY r.review_type
HAVING COUNT(DISTINCT CASE WHEN r.completed=0 THEN r.review_id END)>=2
ORDER BY open_high DESC,late_share_pct DESC,r.review_type ASC;
