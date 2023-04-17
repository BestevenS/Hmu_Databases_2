-- 1

SELECT * FROM users
WHERE POLH = 'Ηράκλειο' AND XORA = 'Ελλάς';

-- 2

SELECT COUNT(*) FROM coments
JOIN users ON coments.SYG_MHNYMATOS = users.ONOMAXEIRISTH
WHERE users.POLH = 'Ηράκλειο' AND users.XORA = 'Ελλάς';

-- 3

SELECT COUNT(*) FROM coments
JOIN users ON coments.SYG_MHNYMATOS = users.ONOMAXEIRISTH
WHERE users.XORA != 'Ελλάς';

-- 4

SELECT users.ONOMAXEIRISTH, messages.periexomeno, messages.HMEROMHNIA
FROM users
JOIN messages ON users.ONOMAXEIRISTH = messages.SYG_MHNYMATOS
ORDER BY messages.HMEROMHNIA DESC
LIMIT 1;

-- 5

SELECT users.ONOMAXEIRISTH, grups.onoma_omadas
FROM users
JOIN manages ON users.ONOMAXEIRISTH = manages.ONOMAXEIRISTH
JOIN grups ON manages.onoma_omadas = grups.onoma_omadas;

-- 6

SELECT users.onoma, users.EPONYMO, users.ONOMAXEIRISTH
FROM users
JOIN manages ON users.ONOMAXEIRISTH = manages.ONOMAXEIRISTH
GROUP BY users.ONOMAXEIRISTH
ORDER BY COUNT(manages.onoma_omadas) DESC
LIMIT 1;

-- 7

SELECT messages.KOD_MHNYMATOS, messages.SYG_MHNYMATOS, messages.periexomeno, COUNT(likes.KOD_MHNYMATOS) AS total_likes
FROM messages
JOIN likes ON messages.KOD_MHNYMATOS = likes.KOD_MHNYMATOS
GROUP BY messages.KOD_MHNYMATOS
HAVING total_likes = (SELECT MAX(likes_count) FROM (SELECT COUNT(*) AS likes_count FROM likes GROUP BY KOD_MHNYMATOS) AS likes_subquery);

-- 8

SELECT messages.KOD_MHNYMATOS, messages.SYG_MHNYMATOS, messages.periexomeno, COUNT(likes.message_id) AS total_likes
FROM messages
JOIN likes ON messages.KOD_MHNYMATOS = likes.KOD_MHNYMATOS
GROUP BY messages.KOD_MHNYMATOS
HAVING total_likes = (SELECT MAX(likes_count) FROM (SELECT COUNT(*) AS likes_count FROM likes GROUP BY KOD_MHNYMATOS) AS likes_subquery);

-- 9

SELECT coments.SYG_MHNYMATOS, coments.HMEROMHNIA
FROM coments
JOIN messages ON coments.KOD_MHNYMATOS = messages.KOD_MHNYMATOS
WHERE messages.SYG_MHNYMATOS = 1;

-- 10

SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT ONOMAXEIRISTH FROM FOLOWS);

-- 11

SELECT messages.SYG_MHNYMATOS, messages.KOD_MHNYMATOS, COUNT(coments.KOD_MHNYMATOS) AS comment_count
FROM messages
JOIN coments ON messages.KOD_MHNYMATOS = coments.KOD_MHNYMATOS
GROUP BY messages.KOD_MHNYMATOS
HAVING comment_count >= 1;

-- 12

SELECT users.ONOMAXEIRISTH, users.ONOMA, users.EPONYMO, COUNT(FOLOWS.ONOMAXEIRISTH) AS followers_count
FROM users
JOIN FOLOWS ON users.ONOMAXEIRISTH = FOLOWS.ONOMAXEIRISTH
GROUP BY users.ONOMAXEIRISTH
ORDER BY followers_count DESC
LIMIT 1;
