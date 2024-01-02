drop table department purge;
drop table employees purge;

-- 부서
create table department(
name        varchar2(100)       primary key,
location    varchar2(100)       not null
);

-- 직원
create table employees(
idx                     number              GENERATED AS IDENTITY primary key,
name                    varchar2(100)       not null,
start_date              date                not null,
department_name         varchar2(100)       not null,

CONSTRAINT employees_department_fk  --제약 조건을 생성, 제약 조건 이름 지정
foreign key(department_name)        -- 제약 조건의 종류, 조건을 걸 컬럼 이름
REFERENCES department(name)         -- 외래키가 참조하는 대상 테이블(컬럼)

);

insert into department values ('게임기획', '서울');
insert into department values ('게임프로그래밍', '구로');
insert into department values ('게임아트', '제주');
insert into department values ('3D 게임아트', '부산');

select * from department;


insert into employees (name, start_date, department_name) values ('홍길동', '2022-12-01','게임기획');
insert into employees (name, start_date, department_name) values ('홍진호', '2022-02-22','게임아트');
insert into employees (name, start_date, department_name) VALUES ('김유빈', '2024-05-30','게임프로그래밍');
insert into employees (name, start_date, department_name) VALUES ('최현웅', '2024-05-25','게임기획');
insert into employees (name, start_date, department_name) VALUES ('신유진', '2024-06-01','3D 게임아트');


select * from employees;
select 
        employees.*,
        department.location
            from employees 
            join department
                on employees.department_name = department.name;
            
            
select department_name, count(*) from employees
    group by department_name;
commit;

select * from member;
              
              
              
              
              