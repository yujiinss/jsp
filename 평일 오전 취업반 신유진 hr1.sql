select banner from v$version;

select * from employees;

desc employees;

select
 '<th>',
column_name,
 '</th>'
from user_tab_columns
where table_name = 'EMPLOYEES';