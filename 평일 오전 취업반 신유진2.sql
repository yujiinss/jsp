create table member (
  USERID   VARCHAR2(500)   primary key, 
  USERPW    VARCHAR2(500)  NOT NULL, 
  USERNAME VARCHAR2(500) NOT NULL ,
  GENDER VARCHAR2(100) check  (gender in ('남성', '여성')),
  EMAIL VARCHAR2(100) 
);

select * from member;

INSERT INTO member(USERID, USERPW, USERNAME, GENDER, EMAIL) VALUES ('신유진','1234','유진스','여성','dbwls' );
INSERT INTO member(USERID, USERPW, USERNAME, GENDER, EMAIL) VALUES ('황민정','1359','황소','여성','cow');

commit;

update