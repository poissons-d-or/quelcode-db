BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE users
SET is_deleted = 1
WHERE phone_number = NULL
  AND mobile_number = NULL;
COMMIT;