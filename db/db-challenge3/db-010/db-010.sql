SELECT u.name AS ユーザー名,
  p.posted_at AS 投稿日時,
  c.chatroom_name AS チャットルーム名
FROM posts AS p
  JOIN chatrooms AS c ON c.id = p.chatroom_id
  JOIN users AS u ON u.id = p.posted_user_id
WHERE p.is_deleted = 0
  AND u.is_deleted = 0
  AND p.posted_at IN (
    SELECT MAX(p.posted_at)
    FROM posts AS p
    WHERE p.is_deleted = 0
    GROUP BY p.chatroom_id
  )
ORDER BY c.id ASC;
