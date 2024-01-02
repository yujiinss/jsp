show user;

drop table phonebook;

create table phonebook (
    name        varchar2(100), --가변길이문자열 최대 100바이트
    pnum        varchar2(20),  --오라클에서 한글은 1글자에 3바이트(varchar2)
    age         number,        --정수 및 실수
    favorite    char(1)        --고정길이문자열, (Y, N)
);

-- phonebook 테이블에 10줄의 더미 데이터 삽입 (한국 이름, favorite 컬럼 값 설정)
INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('김지연', '123-456-7890', 25, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('이성호', '987-654-3210', 30, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('박서연', '555-123-4567', 22, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('정민수', '111-222-3333', 28, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('송지영', '444-555-6666', 35, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('임성민', '777-888-9999', 40, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('이혜진', '123-789-4560', 27, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('강민준', '987-654-3211', 32, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('장수민', '555-444-3333', 29, 'Y');

drop sequence phonebook_seq;
drop table phonebook purge;

create sequence phonebook_seq
    start with 1        -- int i = 1;
    maxvalue 999999999  -- i < 999999999;
    increment by 1      -- i += 1
    nocycle
    nocache;

select phonebook_seq.nextval from dual; -- 현재값을 1증가시키고 값을 불러온다
select phonebook_seq.currval from dual; -- 증가없이 현재값(마지막값)을 불러온다

create table phonebook (
    idx         number          default phonebook_seq.nextval primary key,
    name        varchar2(100)   unique not null,
    pnum        varchar2(20)    not null,
    age         number          check (age >= 0),
    favorite    char(1)         check (favorite in ('Y', 'N'))
);

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('김지연', '123-456-7890', 25, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('이성호', '987-654-3210', 30, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('박서연', '555-123-4567', 22, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('정민수', '111-222-3333', 28, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('송지영', '444-555-6666', 35, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('임성민', '777-888-9999', 40, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('이혜진', '123-789-4560', 27, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('강민준', '987-654-3211', 32, 'N');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('장수민', '555-444-3333', 29, 'Y');

INSERT INTO phonebook (name, pnum, age, favorite)
VALUES ('한지원', '111-222-7777', 26, 'N');

select * from phonebook
    order by
        favorite desc,  -- favorite 내림차순 (descendant)
        name asc;       -- name 오름차순 (ascendant)
        
-- where 조건절에 기본키를 사용하므로, 예상되는 레코드의 수는 1 혹은 0이다
-- public PhonebookDTO selectOne(int idx) {
--     PhonebookDTO dto = null;
--     dto = template.queryForObject(sql, idx);
--     return dto;  dto는 객체가 하나 있거나 혹은 null
-- }
select * from phonebook where idx = 3;
        
-- 모든 컬럼의 값을 지정하는것이 아니므로, 컬럼이름을 직접 명시해야 한다        
insert into phonebook (name, pnum, age, favorite)
    values ('홍길동', '010-1234-1234', 20, 'Y');
    
update phonebook
    set
        age = 25
    where
        idx = 3;    -- 수정 및 삭제에서 기본키가 있다면
                    -- where 조건절에는 기본키를 포함하는 조건을 작성한다

delete from phonebook
    where
        idx = 3;

commit;

select * from phonebook order by name;

desc phonebook;
