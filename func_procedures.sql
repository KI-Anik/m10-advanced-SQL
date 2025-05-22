SELECT * FROM employee1

CREATE Function emp_count ()
RETURNS INT
LANGUAGE SQL
AS
$$
  SELECT count(*) FROM employee1

$$

SELECT emp_count()

CREATE Function delete_emp()
RETURNS void
LANGUAGE SQL
AS
$$
  DELETE FROM employee1 
   WHERE e_id = 30
$$

SELECT delete_emp()

---- set params

CREATE Function delete_emp_by_id(p_emp_id INT)
RETURNS void
LANGUAGE SQL
AS
$$
  DELETE FROM employee1 
   WHERE e_id = p_emp_id
$$

SELECT delete_emp_by_id(29)

CREATE Procedure remove_emp()
LANGUAGE plpgsql
AS
$$
  BEGIN
    DELETE FROM employee1
     WHERE e_id = 26;
  END
$$

CALL remove_emp()

CREATE Procedure remove_emp_by_id (p_emp_id INT)
LANGUAGE plpgsql
AS
$$
   DECLARE
   test_var INT;
 BEGIN
    SELECT e_id INTO test_var FROM employee1 WHERE e_id = p_emp_id;
    DELETE FROM employee1 WHERE e_id = test_var;

    RAISE NOTICE 'deleted succuessfull';
 END

$$

CALL remove_emp_by_id(28)
