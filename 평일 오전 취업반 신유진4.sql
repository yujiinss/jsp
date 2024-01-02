select * from member;
select idx, title, writer, writeDate from board order by idx desc;

create table reply(
    idx             number              generated as identity primary key,
    board_idx       number              not null,--원본 게시글 번호
    writer          varchar2(100)       not null,
    content         varchar2(2000)      not null,
    writeDate       date                default sysdate,
    
    constraint reply_board_fk
    foreign key(board_idx)
    REFERENCES board(idx),
    
    constraint reply_member_fk
    foreign key(writer)
    REFERENCES member(userid)
);

insert into reply (board_idx, writer, content) 
            values ( 14, 'test', '안녕하세요');

insert into reply (board_idx, writer, content) 
            values ( 14, 'test', '안녕');
            
insert into reply (board_idx, writer, content) 
            values ( 12, 'test', '안녕하세유');
            
select * from board order by idx desc;

select * from reply
    where board_idx = 14
    order by idx;
    
-- 특정 게시글에 작성된 댓글의 개수
-- 서로 다른 테이블에서 컬럼을 불러올때는 테이블. 컬럽 형식으로 명확하게 테이블을 지정한다
select
    (select count(*) from reply where board_idx = board.idx) as ReplyCount,
    board.* -- 모든 테이블을 불러옴
    from board
    order by idx desc;
delete
    
            
commit;