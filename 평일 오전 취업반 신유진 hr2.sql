select * from employees;
select count(*) from employees;
select * from departments;
select count(*) from departments;

/*
    부서이름(departments)별 직원수(employees)를 파악하고 싶다
    department_name from department
    count(*) from employees
    
    부서테이블에는 부서이름이 있고
    직원 테이블에서 직원의 이름과 부서의 id(숫자)만(공통의 keyword가 외래키) 있다
    
    부서이름과 부서별 인원수를 파악하려면 어떻게 써야할까
*/

select 
    D.department_name,
    count(*)
        from employees E
        join departments D
            on E.department_id = D.department_id
            group by D.department_name
            order by count(*) desc;

-- 카티션 프로덕트 (곱연산)을 방지하기 위해서 부서id가 일치하는 조건을 지정            
select * from employees,departments; /* 카티션 프로덕트 (수량 곱셈) */
select count(*) from employees;
select count(*) from departments;
select 108*27 from dual;

-- 두개 이상의 테이블 조인 + 조인에 필요한 조건을 별도 문법을 분리
select * from employees, departments
    where
        employees.department_id = departments.department_id;
        
select 
        employees.first_name,
        departments.department_name
        from employees
        join departments
            on employees.department_id = departments.department_id;
            -- foreign key, child key           parent key
            --                                  primary key or unique