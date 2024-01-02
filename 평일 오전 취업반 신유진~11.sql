drop sequence youtube_seq;
drop table youtube purge;

create sequence youtube_seq
    start with 1
    maxvalue 99999
    increment by 1
    nocycle
    nocache;
    
create table youtube (
  IDX   NUMBER      default youtube_seq.nextval primary key, 
  CATEGORY VARCHAR2(26)  , 
  TITLE VARCHAR2(500) ,
  CHANNEL VARCHAR2(256) ,
  IMGNAME VARCHAR2(500) ,
  VIDEO VARCHAR2(2000) 
);

select * from youtube;