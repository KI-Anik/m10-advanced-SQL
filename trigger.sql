CREATE Table user2(
    u_name VARCHAR(25),
    email VARCHAR(25)
)

INSERT INTO user2 VALUES 
 ('anik', 'anik@gmail.com'),
 ('anik2', 'anik@gmail.com2')

 CREATE TABLE deleted_user_audit(
    deleted_u_name VARCHAR(25),
    deleted_At TIMESTAMP
 )

SELECT * FROM user2

SELECT * FROM deleted_user_audit

 CREATE OR REPLACE Function save_deleted_user()
 RETURNS TRIGGER
 LANGUAGE plpgsql
 AS
 $$
  BEGIN
   INSERT INTO deleted_user_audit VALUES(OLD.u_name, now());
   RAISE NOTICE 'deleted user data successfully reserved by trigger';
   RETURN OLD;
  END
 $$

 CREATE OR REPLACE Trigger save_deleted_user_trigger
 BEFORE DELETE
 ON user2
 FOR EACH ROW
 EXECUTE FUNCTION save_deleted_user();

 DELETE FROM user2 WHERE u_name = 'anik'
