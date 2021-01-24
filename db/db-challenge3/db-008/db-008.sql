SELECT u.name AS ユーザー名,
  c.chatroom_name AS チャットルーム名,
  DATE(uc.joined_at) AS 参加日時
FROM users_in_chatrooms AS uc
  JOIN users AS u ON uc.user_id = u.id
  JOIN chatrooms AS c ON uc.chatroom_id = c.id
WHERE u.is_deleted = 0
  AND c.is_deleted = 0
ORDER BY uc.joined_at ASC;
