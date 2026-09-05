SELECT category, count(*) OVER (PARTITION BY category)
FROM posts;