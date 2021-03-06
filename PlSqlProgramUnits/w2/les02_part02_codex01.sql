DECLARE
    v_emp_record   employees%rowtype;
    v_last_name    employees.last_name%type;
BEGIN
  
  /* Let's consider a case where v_last_name = 'Zeba'. It is prefixed and suffixed with the SQL wild character % */
    v_last_name := '%'||'Zeba'||'%';
    SELECT *
    INTO v_emp_record
    FROM employees
    WHERE lower(last_name) like lower(v_last_name);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.first_name);
END;
/

-- no line selected!
SELECT count(*)
FROM employees
WHERE lower(last_name) like lower('%'||'Zeba'||'%');