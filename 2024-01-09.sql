desc board2;

-- ������
create sequence count_seq
    start with 1
    maxvalue 99999
    increment by 1
    nocycle
    nocache;

select count(*) as count_seq.nextval from board2;

-- �̹� ������� ���̺� �÷� �߰��ϱ�
alter table board2 add
    deleted     number      default 0 check(deleted in (0,1));

-- ������� ���������� �����ϱ�    
alter table board2 drop constraint
    board2_member_fk;

-- ������� ���̺� �������� �߰��ϱ�
alter table board2 add
    constraint board2_member_fk
    foreign key(writer)
    references member(userid)
    on delete set null;
       
   update board
    set 
        deleted = 1- deleted
        where
            idx =20;
    
    select idx, title, deleted from board2 where idx = 20;
    
-- �̹� ��ϵ� �����͸� �״�� �ٽ� �ֱ� (����)
-- �ٸ� ���̺��� ���� ���̺�� �����Ѵ�

insert into board2 (title, writer, content, image, ipaddr)
    select title, writer, content, image, ipaddr from board2;
commit;

-- ����¡ ������
select * from board2;
where
    deleted = 0
order by idx desc
offset 5 rows -- ��ü ���� ��, �տ��� 0���� �ǳʶٰ� 
fetch next 10 rows only; -- �� ���� 10�� ���� �ҷ��´�
    
delete board2 where idx > 9050;
select count(*) from board2
    where deleted = 0;

commit;

