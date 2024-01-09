desc board2;

-- 시퀀스
create sequence count_seq
    start with 1
    maxvalue 99999
    increment by 1
    nocycle
    nocache;

select count(*) as count_seq.nextval from board2;

-- 이미 만들어진 테이블에 컬럼 추가하기
alter table board2 add
    deleted     number      default 0 check(deleted in (0,1));

-- 만들어진 제약조건을 제거하기    
alter table board2 drop constraint
    board2_member_fk;

-- 만들어진 테이블에 제약조건 추가하기
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
    
-- 이미 등록된 데이터를 그대로 다시 넣기 (복제)
-- 다른 테이블에서 현재 테이블로 삽입한다

insert into board2 (title, writer, content, image, ipaddr)
    select title, writer, content, image, ipaddr from board2;
commit;

-- 페이징 쿼리문
select * from board2;
where
    deleted = 0
order by idx desc
offset 5 rows -- 전체 내용 중, 앞에서 0개를 건너뛰고 
fetch next 10 rows only; -- 그 다음 10개 행을 불러온다
    
delete board2 where idx > 9050;
select count(*) from board2
    where deleted = 0;

commit;

