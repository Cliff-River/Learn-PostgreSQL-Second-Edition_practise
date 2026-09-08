SELECT category, count(*) OVER (PARTITION BY category)
FROM posts;

SELECT category, COUNT(*) OVER w1, COUNT(*)
OVER w2
FROM posts
WINDOW w1 AS (PARTITION BY category), w2 AS ()
ORDER BY category;

SELECT category, ROW_NUMBER() OVER w1
FROM posts
WINDOW w1 AS (PARTITION BY category)
ORDER BY category;

SELECT category, ROW_NUMBER() OVER w1, title
FROM posts
WINDOW w1 AS (PARTITION BY category ORDER BY title)
ORDER BY category;

SELECT category, ROW_NUMBER() OVER w1, title, FIRST_VALUE(title) OVER w1
FROM posts
WINDOW w1 AS (PARTITION BY category ORDER BY category)
ORDER BY category;