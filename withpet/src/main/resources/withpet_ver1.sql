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


------------------------------------------------------------------------------------------------------------------------------------------
-- 회원 테이블 시작
insert into member(id, nick, password, tel,pw_answer, regdate, permitdate, category_no) values('sc@gmail.com', 'sc', '1234', '010', '개발자는 나의 기',sysdate , null,16);
insert into tier (id, category_no) values('sc@gmail.com', 27);
insert into member(id, nick, password, tel,pw_answer, regdate, permitdate, category_no) values('sh@gmail.com', 'sc', '1234', '010', '개발자는 나의 기',sysdate , null,16);
insert into tier (id, category_no) values('sh@gmail.com', 27);
insert into member(id, nick, password, tel,pw_answer, regdate, permitdate, category_no) values('ms@gmail.com', 'sc', '1234', '010', '개발자는 나의 기',sysdate , null,16);
insert into tier (id, category_no) values('ms@gmail.com', 27);
insert into member(id, nick, password, tel,pw_answer, regdate, permitdate, category_no) values('jy@gmail.com', 'sc', '1234', '010', '개발자는 나의 기',sysdate , null,16);
insert into tier (id, category_no) values('jy@gmail.com', 27);
insert into member(id, nick, password, tel,pw_answer, regdate, permitdate, category_no) values('hs@gmail.com', 'sc', '1234', '010', '개발자는 나의 기',sysdate , null,16);
insert into tier (id, category_no) values('hs@gmail.com', 27);


-- 게시판 테이블 시작
insert into board(board_no, title, content, hits, wdate, category_no, id) values(board_seq.nextval, '푸들모이자~!', '푸들모임입니다', 200, '2017-5-5',1,'sh@gmail.com');
insert into board(board_no, title, content, hits, wdate, category_no, id) values(board_seq.nextval, '리트리버무료훈련~!', '리트리버무료훈련입니다', 500, '2017-5-20',1,'ms@gmail.com');
insert into board(board_no, title, content, hits, wdate, category_no, id) values(board_seq.nextval, '강아지옷나눔합니다', '저희강아지가 애기때 입던...', 100, '2017-6-20',3,'sh@gmail.com');
insert into board(board_no, title, content, hits, wdate, category_no, id) values(board_seq.nextval, '강아지사료나눔', '강아지사료', 150, '2017-6-22',3,'ms@gmail.com');
insert into board(board_no, title, content, hits, wdate, category_no, id) values(board_seq.nextval, '장군이돌보미모집', '장군이돌보미부탁드려영', 180, '2017-6-2',2,'ms@gmail.com');
insert into board(board_no, title, content, hits, wdate, category_no, id) values(board_seq.nextval, '난리견배찬이돌보미모집', '주의사항:난리침', 150, '2017-6-22',2,'ms@gmail.com');


-- 날짜 테이블 시작
insert into gatheringdate(date_no, gathering_start, gathering_end, meeting_start, meeting_end) 
values(gatheringdate_seq.nextval, '2017-12-1', '2017-12-25', sysdate, sysdate);
insert into gatheringdate(date_no, gathering_start, gathering_end, meeting_start, meeting_end) 
values(gatheringdate_seq.nextval, '2017-5-1', '2017-12-1', sysdate, sysdate);
insert into gatheringdate(date_no, gathering_start, gathering_end, meeting_start, meeting_end) 
values(gatheringdate_seq.nextval, '2017-5-1', '2017-12-1', sysdate, sysdate);



-- 이미지 테이블 시작
insert into img(img_no, img_path) values(img_seq.nextval, '이미지1.jpg');
insert into img(img_no, img_path) values(img_seq.nextval, '이미지2.jpg');
insert into img(img_no, img_path) values(img_seq.nextval, '이미지3.jpg');
select * from img;


select * from meeting
-----------------------------------모임 테이블 시작----------------------------------------
--1)board table
insert into board(board_no, title, content, hits, wdate, category_no, id) 
values(board_seq.nextval, '뚝섬 반려견 산책모임', '이번주말 12시에 반포대교 산책하실분?', 200, '2017-5-5',1,'sh@gmail.com');
--2)gatheringdate table
insert into gatheringdate(date_no, gathering_start, gathering_end, meeting_start, meeting_end) 
values(gatheringdate_seq.nextval, '2017-12-1', '2017-12-25', sysdate, sysdate);
--3)img table
insert into img(img_no, img_path) 
values(img_seq.nextval, '이미지1.jpg');
--4)meeting table
-----모집중으로 모임 생성
insert into MEETING(board_no, intro, people_count,place,date_no,img_no,category_no)
values (board_seq.currval,'시바견',10,'경기도 성남시 분당구 삼평동 유스페이스 한국소프트웨어진흥협회 802호',gatheringdate_seq.currval,img_seq.currval,9);
--5)meeting type 훈련
insert into MEETINGTYPE(board_no,category_no) 
values (board_seq.currval,4);




--6)attender
insert into attender(id,board_no)
values('sh@gmail.com',board_seq.currval);
--7)sympathy
insert into sympathy(id,board_no)
values('sh@gmail.com',board_seq.currval);
-----------------------------------돌보미 테이블 시작----------------------------------------
--1)board table
insert into board(board_no, title, content, hits, wdate, category_no, id) 
values(board_seq.nextval, '돌보미 구합니다', '이번주 주말에 장군이 보살펴 주실분', 100, '2017-5-5',2,'ms@gmail.com');

--2)gatheringdate table
insert into gatheringdate(date_no, gathering_start, gathering_end, meeting_start, meeting_end) 
values(gatheringdate_seq.nextval, '2017-12-11', '2017-12-30', sysdate, sysdate);

--2)carer table
insert into CARER(board_no,date_no,place)
values (board_seq.currval,gatheringdate_seq.currval,'삼평동');

select * from CARER;
-----------------------------------나눔마켓 테이블 시작----------------------------------------
--1)board table
insert into board(board_no, title, content, hits, wdate, category_no, id) 
values(board_seq.nextval, '개껌 팝니다', '식감 기가맥혀~', 1000, '2017-11-16',3,'ms@gmail.com');
--2)sharemarket 15 나눔합니다,16 구매합니다,17 판매합니다
insert into sharemarket(board_no,category_no)
values (board_seq.currval,17);

select * from SHAREMARKET;
-----------------------------------댕댕이 테이블 시작----------------------------------------
--1)dog table category 12 남 13여 14중성
insert into dog (dog_no,name,bdate,intro, neutralization, id,img_no,category_no)
values (dog_seq.nextval,'대왕이','2011-11-16','겁나 사나움', 1,'sc@gmail.com',1,12);

select * from dog;
-----------------------------------덧글 테이블 시작----------------------------------------

--1)reply table 
insert into reply(reply_no,content,board_no,id)
values(reply_seq.nextval,'개껌 살게요',9,'sc@gmail.com');


insert into gatheringdate(date_no, gathering_start, gathering_end, meeting_start, meeting_end) 
values(gatheringdate_seq.nextval, '2017-12-1', '2017-12-25', sysdate, sysdate);
insert into gatheringdate(date_no, gathering_start, gathering_end, meeting_start, meeting_end) 
values(gatheringdate_seq.nextval, '2017-5-1', '2017-12-1', sysdate, sysdate);
insert into gatheringdate(date_no, gathering_start, gathering_end, meeting_start, meeting_end) 
values(gatheringdate_seq.nextval, '2017-5-1', '2017-12-1', sysdate, sysdate);


------------------------------------모금함 작성-----------------------------------------
--모금대기
insert into board(board_no, title, content, wdate, category_no, id)
values(board_seq.nextval, '유기견들을 도와주세요.', '블라블라~', sysdate, 34, 'sc@gmail.com');
insert into donation(board_no, donation_org, bank_name, account_no, account_host, final_money, category_no)
values(board_seq.currval, '코스타', '국민은행', '010-9966-1391', '황세창', 1000000, 31);

--모금중
insert into board(board_no, title, content, wdate, category_no, id)
values(board_seq.nextval, '모금하고있습니다 !!', '블라블라~ㅎㅎㅎㅎ', sysdate, 34, 'sc@gmail.com');
insert into donation(board_no, donation_org, bank_name, account_no, account_host, final_money, category_no)
values(board_seq.currval, '코스타', '국민은행', '010-9966-1391', '황세창', 1000000, 32);

--모금완료
insert into board(board_no, title, content, wdate, category_no, id)
values(board_seq.nextval, '모금이 만료됐습니다.', '블라블라~!!!', sysdate, 34, 'sc@gmail.com');
insert into donation(board_no, donation_org, bank_name, account_no, account_host, current_money, final_money, category_no)
values(board_seq.currval, '코스타', '국민은행', '010-9966-1391', '황세창', 1000000, 1000000, 33);

		
--ver1
select rnum, m.board_no, mt.category_no, m.people_count, m.place, m.date_no, m.img_no, m.category_no
from (select row_number() over(order by board_no desc) as rnum, board_no, people_count, place, date_no, img_no, category_no
from meeting) m, meetingtype mt
where m.board_no = mt.board_no and mt.category_no = 5 and rnum between 1 and 3

--ver2
select row_number() over(order by board_no desc) as rnum, board_no, categoryType, people_count, place, date_no, img_no, category_no
from (select m.board_no, mt.category_no as categoryType, m.people_count, m.place, m.date_no, m.img_no, m.category_no
from meeting m, meetingtype mt
where m.board_no = mt.board_no and mt.category_no = 5)

--ver3 success
select rnum, board_no, categoryType, people_count, place, date_no, img_no, category_no
from (select row_number() over(order by m.board_no desc) as rnum, m.board_no, mt.category_no as categoryType, m.people_count, m.place, m.date_no, m.img_no, m.category_no
from meeting m, meetingtype mt
where m.board_no = mt.board_no and mt.category_no = 7)
where rnum between 1 and 5




--모금함 상세
SELECT b.board_no, b.title, b.content, b.id, d.thumnail_no, d.donation_org, d.bank_name, 
			d.account_no, d.account_host, d.current_money, d.final_money, d.donation_flag, 
			d.category_no, d.img_no1, d.img_no2, d.img_no3
		FROM donation d, board b
		WHERE d.board_no = b.board_no and d.board_no=#{value}
		
		
--모금함 목록
SELECT *
FROM(
			SELECT row_number() over(order by b.board_no desc) as rnum, b.board_no as boardNo,
			b.title, b.content, b.id, d.thumnail_no as thumnailNo, d.donation_org as donationOrg, d.bank_name as bankName, 
			d.account_no as accountNo, d.account_host as accountHost, d.current_money as currentMoney,
			d.final_money as dreamMoney, d.donation_flag as donationFlag, 
			d.category_no, d.img_no1, d.img_no2, d.img_no3
			FROM board b,donation d
			WHERE b.board_no = d.board_no)
WHERE rnum between #{startRNum} and #{endRNum} order by boardNo desc
