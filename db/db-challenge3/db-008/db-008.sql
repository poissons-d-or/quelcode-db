SELECT u.name,
  c.chatroom_name,
  DATE(uc.joined_at)
FROM users u,
  chatrooms c,
  users_in_chatrooms uc
WHERE uc.chatroom_id = c.id
  AND uc.user_id = u.id
  AND u.is_deleted = 0
  AND c.is_deleted = 0
ORDER BY uc.joined_at ASC
