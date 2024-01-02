select * from tab;

desc employees;
select * from employees;
select * from employees where employee_id =206;

select * from employees 
    where first_name = 'William' ;
   -- and last_name = 'Gietz';

select * from employees
    where 
        salary >=10000;
     
select * from employees
     where
        -- salary between 10000 and 15000;
        10000 <= salary
        and
        salary <=14000;
        
        
select * from employees
        where
            hire_date between '02/01/01' and '04/12/31'
            order by
                hire_date;
                
select * from employees
        where
            last_name like '%er%'; -- 여러 객체가 오니까 자바에서는 List로 불러와야 함
        
select 
    first_name,
    salary,
    hire_date,
    sysdate,         -- 시스템 현재 시간(DB서버 기준)
    sysdate-hire_date
    from employees;
        
        
select employees_seq.nextval from dual;
select employees_seq.currval from dual;

select first_name, hire_date from employees;
commit;