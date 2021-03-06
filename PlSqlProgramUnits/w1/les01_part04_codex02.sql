CREATE OR REPLACE PROCEDURE add_emp(
    p_first_name employees.first_name%TYPE,
    p_last_name employees.last_name%TYPE,                         
    p_job_id employees.job_id%TYPE,
    p_salary employees.salary%TYPE,
    p_email employees.email%TYPE) 
IS
    e_invalid_job EXCEPTION;    
BEGIN
    IF validate_job(p_job_id) THEN
        INSERT INTO employees
            ( employee_id, first_name, last_name, hire_date, job_id, salary, email ) 
        VALUES
            ( employees_seq.NEXTVAL, p_first_name, p_last_name, current_date, p_job_id, p_salary, p_email );
    ELSE
        RAISE e_invalid_job;    
    END IF; 

    EXCEPTION WHEN e_invalid_job THEN
        dbms_output.put_line('Input JOB ID "' || p_job_id || '" is invalid.');
END add_emp;