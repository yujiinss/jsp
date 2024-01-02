drop table department purge;
drop table employees purge;

-- �μ�
create table department(
name        varchar2(100)       primary key,
location    varchar2(100)       not null
);

-- ����
create table employees(
idx                     number              GENERATED AS IDENTITY primary key,
name                    varchar2(100)       not null,
start_date              date                not null,
department_name         varchar2(100)       not null,

CONSTRAINT employees_department_fk  --���� ������ ����, ���� ���� �̸� ����
foreign key(department_name)        -- ���� ������ ����, ������ �� �÷� �̸�
REFERENCES department(name)         -- �ܷ�Ű�� �����ϴ� ��� ���̺�(�÷�)

);

insert into department values ('���ӱ�ȹ', '����');
insert into department values ('�������α׷���', '����');
insert into department values ('���Ӿ�Ʈ', '����');
insert into department values ('3D ���Ӿ�Ʈ', '�λ�');

select * from department;


insert into employees (name, start_date, department_name) values ('ȫ�浿', '2022-12-01','���ӱ�ȹ');
insert into employees (name, start_date, department_name) values ('ȫ��ȣ', '2022-02-22','���Ӿ�Ʈ');
insert into employees (name, start_date, department_name) VALUES ('������', '2024-05-30','�������α׷���');
insert into employees (name, start_date, department_name) VALUES ('������', '2024-05-25','���ӱ�ȹ');
insert into employees (name, start_date, department_name) VALUES ('������', '2024-06-01','3D ���Ӿ�Ʈ');


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
              
              
              
              
              