USE sql_blog;
CREATE FULLTEXT INDEX idx_title_body ON posts(title,body);

SELECT *, MATCH(title, body) AGAINST('react redux')*100 AS relevance_score
FROM posts
WHERE MATCH(title, body) AGAINST('react -redux +form' IN BOOLEAN MODE);