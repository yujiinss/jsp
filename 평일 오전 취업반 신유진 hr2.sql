select * from employees;
select count(*) from employees;
select * from departments;
select count(*) from departments;

/*
    �μ��̸�(departments)�� ������(employees)�� �ľ��ϰ� �ʹ�
    department_name from department
    count(*) from employees
    
    �μ����̺��� �μ��̸��� �ְ�
    ���� ���̺��� ������ �̸��� �μ��� id(����)��(������ keyword�� �ܷ�Ű) �ִ�
    
    �μ��̸��� �μ��� �ο����� �ľ��Ϸ��� ��� ����ұ�
*/

select 
    D.department_name,
    count(*)
        from employees E
        join departments D
            on E.department_id = D.department_id
            group by D.department_name
            order by count(*) desc;

-- īƼ�� ���δ�Ʈ (������)�� �����ϱ� ���ؼ� �μ�id�� ��ġ�ϴ� ������ ����            
select * from employees,departments; /* īƼ�� ���δ�Ʈ (���� ����) */
select count(*) from employees;
select count(*) from departments;
select 108*27 from dual;

-- �ΰ� �̻��� ���̺� ���� + ���ο� �ʿ��� ������ ���� ������ �и�
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