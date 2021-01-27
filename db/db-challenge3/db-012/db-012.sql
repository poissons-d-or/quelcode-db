BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE chatrooms
SET is_file_transfer_enabled = 0,
  updated_user_id = 1
WHERE is_deleted = 0
  AND id NOT IN (
    SELECT chatroom_id
    FROM users_in_chatrooms
    WHERE user_id = 1
  );
COMMIT;
