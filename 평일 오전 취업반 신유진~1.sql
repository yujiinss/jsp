create table schedule(
title  varchar2(100)  not null,
start_date  date       not null,
end_date    date        not null
);

insert into schedule values ('�����ͺ��̽� ���� ��','23/11/21','23/11/21');
insert into schedule values ('�����ͺ��̽� ���� ����','23/11/27','23/11/27');

insert into schedule values ('�� ǥ�� UI ���� ��', '23/12/19','23/12/19');
insert into schedule values ('�� ǥ�� UI ���� ����', '23/12/26','23/12/26');

insert into schedule values ('ũ�������� ���� ', '23/12/23','23/12/25');
insert into schedule values ('���� ���� ', '23/12/30','24/01/01');

delete schedule where title = '��';

select * from schedule order by start_date;

commit;
rollback;

select sysdate from dual;
getDate("sysdate");