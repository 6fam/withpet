---시퀀스 삭제
drop sequence category_seq;
drop sequence board_seq;
drop sequence gatheringdate_seq;
drop sequence img_seq;
drop sequence dog_seq;
drop sequence reply_seq;
drop sequence message_seq;
drop sequence boardimg_seq;

---시퀀스 생성
create SEQUENCE category_seq;
create sequence board_seq;
create sequence gatheringdate_seq;
create sequence img_seq;
create sequence boardimg_seq;
create sequence dog_seq;
create sequence reply_seq;
create sequence message_seq;

-- 카테고리 분류 테이블 시작
insert into category(category_no,table_code,category_name) values(category_seq.nextval,1,'나의 좌우명은?');--1
insert into category(category_no,table_code,category_name) values(category_seq.nextval,1,'내가 존경하는 인물은?');--2
insert into category(category_no,table_code,category_name) values(category_seq.nextval,1,'출신 초등학교는?');--3
insert into category(category_no,table_code,category_name) values(category_seq.nextval,1,'나의 고향은?');--4
insert into category(category_no,table_code,category_name) values(category_seq.nextval,1,'나의 어머니 이름은?');--5
insert into category(category_no,table_code,category_name) values(category_seq.nextval,1,'나의 아버지 이름은?');--6
insert into category(category_no,table_code,category_name) values(category_seq.nextval,1,'가장 감명 깊게 읽은 책은?');--7
insert into category(category_no,table_code,category_name) values(category_seq.nextval,1,'가장 감명 깊게 본 영화는?');--8

insert into category(category_no,table_code,category_name) values(category_seq.nextval,2,'ROLE_EXCEPT');--9 탈퇴회원
insert into category(category_no,table_code,category_name) values(category_seq.nextval,2,'ROLE_MEMBER');--10 일반회원
insert into category(category_no,table_code,category_name) values(category_seq.nextval,2,'ROLE_STANDBY');--11 견주대기자
insert into category(category_no,table_code,category_name) values(category_seq.nextval,2,'ROLE_DOGMOM');--12 견주
insert into category(category_no,table_code,category_name) values(category_seq.nextval,2,'ROLE_MANAGER');--13 관리자
insert into category(category_no,table_code,category_name) values(category_seq.nextval,2,'ROLE_SYSTEMADMIN');--14 최고 관리자

insert into category(category_no,table_code,category_name) values(category_seq.nextval,3,'수컷');--15
insert into category(category_no,table_code,category_name) values(category_seq.nextval,3,'암컷');--16

insert into category(category_no,table_code,category_name) values(category_seq.nextval,4,'모임');--17
insert into category(category_no,table_code,category_name) values(category_seq.nextval,4,'같이가치');--18
insert into category(category_no,table_code,category_name) values(category_seq.nextval,4,'커뮤니티');--19

insert into category(category_no,table_code,category_name) values(category_seq.nextval,5,'친목');--20
insert into category(category_no,table_code,category_name) values(category_seq.nextval,5,'산책');--21
insert into category(category_no,table_code,category_name) values(category_seq.nextval,5,'훈련');--22
insert into category(category_no,table_code,category_name) values(category_seq.nextval,5,'세미나');--23

insert into category(category_no,table_code,category_name) values(category_seq.nextval,6,'모집대기');--24
insert into category(category_no,table_code,category_name) values(category_seq.nextval,6,'모집중');--25
insert into category(category_no,table_code,category_name) values(category_seq.nextval,6,'모집마감');--26
insert into category(category_no,table_code,category_name) values(category_seq.nextval,6,'모임종료');--27

insert into category(category_no,table_code,category_name) values(category_seq.nextval,7,'모금대기');--28
insert into category(category_no,table_code,category_name) values(category_seq.nextval,7,'모금중');--29
insert into category(category_no,table_code,category_name) values(category_seq.nextval,7,'모금마감');--30

insert into category(category_no,table_code,category_name) values(category_seq.nextval,8,'나눔마켓');--31
insert into category(category_no,table_code,category_name) values(category_seq.nextval,8,'모임후기');--32
insert into category(category_no,table_code,category_name) values(category_seq.nextval,8,'반려정보');--33
insert into category(category_no,table_code,category_name) values(category_seq.nextval,8,'돌보미');--34
