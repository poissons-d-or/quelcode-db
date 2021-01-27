BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
DELETE FROM users_in_chatrooms
WHERE user_id IN (
    SELECT id
    FROM users
    WHERE is_deleted = 1
  );
COMMIT;
