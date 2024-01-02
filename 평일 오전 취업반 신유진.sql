show user;

drop table phonebook;

create table phonebook (
    name        varchar2(100), --�������̹��ڿ� �ִ� 100����Ʈ
    pnum        varchar2(20),  --����Ŭ���� �ѱ��� 1���ڿ� 3����Ʈ(varchar2)
    age         number,        --���� �� �Ǽ�
    favorite    char(1)        --�������̹��ڿ�, (Y, N)
);

-- phonebook ���̺� 10���� ���� ������ ���� (�ѱ� �̸�, favorite �÷� �� ����)
INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '123-456-7890', 25, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('�̼�ȣ', '987-654-3210', 30, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('�ڼ���', '555-123-4567', 22, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('���μ�', '111-222-3333', 28, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '444-555-6666', 35, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('�Ӽ���', '777-888-9999', 40, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '123-789-4560', 27, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '987-654-3211', 32, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('�����', '555-444-3333', 29, 'Y');

drop sequence phonebook_seq;
drop table phonebook purge;

create sequence phonebook_seq
    start with 1        -- int i = 1;
    maxvalue 999999999  -- i < 999999999;
    increment by 1      -- i += 1
    nocycle
    nocache;

select phonebook_seq.nextval from dual; -- ���簪�� 1������Ű�� ���� �ҷ��´�
select phonebook_seq.currval from dual; -- �������� ���簪(��������)�� �ҷ��´�

create table phonebook (
    idx         number          default phonebook_seq.nextval primary key,
    name        varchar2(100)   unique not null,
    pnum        varchar2(20)    not null,
    age         number          check (age >= 0),
    favorite    char(1)         check (favorite in ('Y', 'N'))
);

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '123-456-7890', 25, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('�̼�ȣ', '987-654-3210', 30, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('�ڼ���', '555-123-4567', 22, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('���μ�', '111-222-3333', 28, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '444-555-6666', 35, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('�Ӽ���', '777-888-9999', 40, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '123-789-4560', 27, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '987-654-3211', 32, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('�����', '555-444-3333', 29, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('������', '111-222-7777', 26, 'N');

select * from phonebook
    order by
        favorite desc,  -- favorite �������� (descendant)
        name asc;       -- name �������� (ascendant)
        
-- where �������� �⺻Ű�� ����ϹǷ�, ����Ǵ� ���ڵ��� ���� 1 Ȥ�� 0�̴�
-- public PhonebookDTO selectOne(int idx) {
--     PhonebookDTO dto = null;
--     dto = template.queryForObject(sql, idx);
--     return dto;  dto�� ��ü�� �ϳ� �ְų� Ȥ�� null
-- }
select * from phonebook where idx = 3;
        
-- ��� �÷��� ���� �����ϴ°��� �ƴϹǷ�, �÷��̸��� ���� ����ؾ� �Ѵ�        
insert into phonebook (name, pnum, age, favorite)
    values ('ȫ�浿', '010-1234-1234', 20, 'Y');
    
update phonebook
    set
        age = 25
    where
        idx = 3;    -- ���� �� �������� �⺻Ű�� �ִٸ�
                    -- where ���������� �⺻Ű�� �����ϴ� ������ �ۼ��Ѵ�

delete from phonebook
    where
        idx = 3;

commit;

select * from phonebook order by name;

desc phonebook;
