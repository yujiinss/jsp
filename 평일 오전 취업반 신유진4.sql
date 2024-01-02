select * from member;
select idx, title, writer, writeDate from board order by idx desc;

create table reply(
    idx             number              generated as identity primary key,
    board_idx       number              not null,--���� �Խñ� ��ȣ
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
            values ( 14, 'test', '�ȳ��ϼ���');

insert into reply (board_idx, writer, content) 
            values ( 14, 'test', '�ȳ�');
            
insert into reply (board_idx, writer, content) 
            values ( 12, 'test', '�ȳ��ϼ���');
            
select * from board order by idx desc;

select * from reply
    where board_idx = 14
    order by idx;
    
-- Ư�� �Խñۿ� �ۼ��� ����� ����
-- ���� �ٸ� ���̺��� �÷��� �ҷ��ö��� ���̺�. �÷� �������� ��Ȯ�ϰ� ���̺��� �����Ѵ�
select
    (select count(*) from reply where board_idx = board.idx) as ReplyCount,
    board.* -- ��� ���̺��� �ҷ���
    from board
    order by idx desc;
delete
    
            
commit;