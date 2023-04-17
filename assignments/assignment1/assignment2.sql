-- 1

SELECT * FROM users
WHERE city = 'Ηράκλειο' AND country = 'Ελλάς';

-- 2

SELECT COUNT(*) FROM comments
JOIN users ON comments.user_id = users.id
WHERE users.city = 'Ηράκλειο' AND users.country = 'Ελλάς';

-- 3

SELECT COUNT(*) FROM comments
JOIN users ON comments.user_id = users.id
WHERE users.country != 'Ελλάς';

-- 4

SELECT users.username, messages.content, messages.date
FROM users
JOIN messages ON users.id = messages.user_id
ORDER BY messages.date DESC
LIMIT 1;

-- 5

SELECT users.username, groups.name
FROM users
JOIN group_admins ON users.id = group_admins.user_id
JOIN groups ON group_admins.group_id = groups.id;

-- 6

SELECT users.firstname, users.lastname, users.username
FROM users
JOIN group_admins ON users.id = group_admins.user_id
GROUP BY users.id
ORDER BY COUNT(group_admins.group_id) DESC
LIMIT 1;

-- 7

SELECT messages.id, messages.author_id, messages.content, COUNT(likes.message_id) AS total_likes
FROM messages
JOIN likes ON messages.id = likes.message_id
GROUP BY messages.id
HAVING total_likes = (SELECT MAX(likes_count) FROM (SELECT COUNT(*) AS likes_count FROM likes GROUP BY message_id) AS likes_subquery);

-- 8

SELECT messages.id, messages.author_id, messages.content, COUNT(likes.message_id) AS total_likes
FROM messages
JOIN likes ON messages.id = likes.message_id
GROUP BY messages.id
HAVING total_likes = (SELECT MAX(likes_count) FROM (SELECT COUNT(*) AS likes_count FROM likes GROUP BY message_id) AS likes_subquery);

-- 9

SELECT comments.user_id, comments.date
FROM comments
JOIN messages ON comments.message_id = messages.id
WHERE messages.author_id = {USER_ID_OF_YOUR_CHOICE};

-- 10

SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT follower_id FROM followers);

-- 11

SELECT messages.author_id, messages.id, COUNT(comments.message_id) AS comment_count
FROM messages
JOIN comments ON messages.id = comments.message_id
GROUP BY messages.id
HAVING comment_count >= 1;

-- 12

SELECT users.username, users.firstname, users.lastname, COUNT(followers.follower_id) AS followers_count
FROM users
JOIN followers ON users.id = followers.followed_id
GROUP BY users.id
ORDER BY followers_count DESC
LIMIT 1;
