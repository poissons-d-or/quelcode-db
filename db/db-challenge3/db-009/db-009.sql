SELECT COUNT(p.id) AS 投稿数,
  c.chatroom_name AS チャットルーム名
FROM chatrooms AS c
  JOIN posts AS p ON c.id = p.chatroom_id
  JOIN users AS u ON p.posted_user_id = u.id
WHERE p.is_deleted = 0
  AND u.is_deleted = 0
GROUP BY c.id
ORDER BY 投稿数 DESC;
