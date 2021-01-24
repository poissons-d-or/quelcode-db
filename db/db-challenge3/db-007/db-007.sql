SELECT id,
  chatroom_name,
  about,
  CASE
    is_file_transfer_enabled
    WHEN 0 THEN '禁止'
    ELSE '許可'
  END AS is_file_tranfer_enabled,
  is_direct_chat,
  is_deleted,
  created_at,
  created_user_id,
  updated_at,
  updated_user_id
FROM chatrooms
WHERE is_deleted = 0
  AND about LIKE '%ダイレクトチャット'
ORDER BY id ASC;
