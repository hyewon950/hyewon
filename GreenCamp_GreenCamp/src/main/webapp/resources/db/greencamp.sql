--SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

--회원테이블
DROP TABLE "MEMBER" CASCADE CONSTRAINTS;

CREATE TABLE member (
   M_ID   VARCHAR2(200)   NOT NULL,
   M_PWD   VARCHAR2(200)   NOT NULL,
   M_NAME    VARCHAR2(200)   NOT NULL,
   M_BIRTHDAY   VARCHAR2(50)   NOT NULL,
   M_EMAIL   VARCHAR2(200)   NOT NULL,
   M_PHONE   VARCHAR2(200)   NULL,
   M_ENROLLDATE   DATE   NOT NULL,
   M_NO   NUMBER   NOT NULL,
   M_STATUS   VARCHAR2(5)   DEFAULT 'N'   NOT NULL,
                M_KEY   VARCHAR2(50)
);

COMMENT ON COLUMN member.M_ID IS '아이디';

COMMENT ON COLUMN member.M_PWD IS '비밀번호';

COMMENT ON COLUMN member.M_NAME IS '이름';

COMMENT ON COLUMN member.M_BIRTHDAY IS '생년월일';

COMMENT ON COLUMN member.M_EMAIL IS '이메일';

COMMENT ON COLUMN member.M_PHONE IS '폰번호';

COMMENT ON COLUMN member.M_ENROLLDATE IS '가입날짜';

COMMENT ON COLUMN member.M_NO IS '회원번호';

COMMENT ON COLUMN member.M_STATUS IS '회원탈퇴여부(Y-탈퇴, N-가입)';

COMMENT ON COLUMN member.M_KEY IS '이메일 인증 키 : 인증완료시Y';

ALTER TABLE member ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
   "M_ID"
);


--멤버 시퀀스
DROP SEQUENCE SEQ_MEMBER_NO;
CREATE SEQUENCE SEQ_MEMBER_NO START WITH 1 INCREMENT BY 1;



--채팅 테이블추가

DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE CHATROOM CASCADE CONSTRAINTS;

CREATE TABLE CHATROOM (
   "CHATROOM_NO"   NUMBER      NOT NULL,
   "M_ID"   VARCHAR2(200)      NOT NULL,
   "USED_ID"   VARCHAR(200)      NULL,
   "USED_NO"   NUMBER      NOT NULL,
   "TITLE"   VARCHAR2(500)      NULL
);

COMMENT ON COLUMN CHATROOM.CHATROOM_NO IS '채팅방고유번호';

COMMENT ON COLUMN CHATROOM.M_ID IS '아이디';

COMMENT ON COLUMN CHATROOM.USED_ID IS '중고거래 물품 등록한 아이디';

CREATE TABLE MESSAGE (
   "MESSAGE_NO"   NUMBER      NOT NULL,
   "SENDER"   VARCHAR2(200)      NULL,
   "RECEIVER"   VARCHAR2(200)    NULL,
   "CONTENT"   VARCHAR2(4000)   NULL,
   "SENDTIME"   VARCHAR2(200)   NULL,
   "READTIME"   VARCHAR2(200)   NULL,
   "CHATROOM_NO"   NUMBER      NULL,
   "M_ID"   VARCHAR2(200)       NULL,
   "USED_ID"   VARCHAR2(200)      NULL,
   "USED_NO"   NUMBER      NOT NULL,
   "TITLE"   VARCHAR2(500)      NULL
);

COMMENT ON COLUMN MESSAGE.SENDER IS '보낸사람';

COMMENT ON COLUMN MESSAGE.RECEIVER IS '받은사람';

COMMENT ON COLUMN MESSAGE.CONTENT IS '채팅내용';

COMMENT ON COLUMN MESSAGE.SENDTIME IS '채팅보낸시간';

COMMENT ON COLUMN MESSAGE.READTIME IS '읽은 시간';

COMMENT ON COLUMN MESSAGE.CHATROOM_NO IS '채팅방고유번호';

COMMENT ON COLUMN MESSAGE.M_ID IS '아이디';

COMMENT ON COLUMN MESSAGE.USED_ID IS '중고거래 물품 등록한 아이디';

ALTER TABLE CHATROOM ADD CONSTRAINT "PK_CHATROOM" PRIMARY KEY (
   "CHATROOM_NO"
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY (
   "MESSAGE_NO"
);
--채팅시퀀스
DROP SEQUENCE SEQ_CHATROOM_NO;
DROP SEQUENCE SEQ_MESSAGE_NO;

CREATE SEQUENCE SEQ_CHATROOM_NO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_MESSAGE_NO START WITH 1 INCREMENT BY 1;


--중고게시판 번호, 중고게시판 댓글번호 시퀀스 생성
DROP SEQUENCE SEQ_USED_NO;
DROP SEQUENCE SEQ_COMMENT_NO;

CREATE SEQUENCE SEQ_USED_NO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_COMMENT_NO START WITH 1 INCREMENT BY 1;

--중고 게시판 테이블 생성
DROP TABLE "USEDBOARD" CASCADE CONSTRAINTS;

CREATE TABLE USEDBOARD (
   USED_NO NUMBER NOT NULL,
   M_ID   VARCHAR2(200) NOT NULL,
   USED_TITLE  VARCHAR2(500) NOT NULL,
   USED_WRITER  VARCHAR2(500) NULL,
   USED_CONTENT  VARCHAR2(2000) NULL,
   USED_ORIGINAL_FILENAME VARCHAR2(500),
   USED_RENAME_FILENAME VARCHAR2(500),
   USED_COUNT  NUMBER NULL,
   USED_CREATE_DATE DATE NULL,
   USED_STATUS VARCHAR2(50) NULL,
   USED_YN VARCHAR2(20) NOT NULL,
   USED_PRICE NUMBER NOT NULL,
   USED_AREA VARCHAR2(50) NULL
);
--중고게시판 테이블 이름 설정
COMMENT ON COLUMN usedboard.USED_NO IS '글번호';
COMMENT ON COLUMN usedboard.M_ID IS '아이디';
COMMENT ON COLUMN usedboard.USED_TITLE IS '제목';
COMMENT ON COLUMN usedboard.USED_WRITER IS '작성자';
COMMENT ON COLUMN usedboard.USED_CONTENT IS '상세설명';
COMMENT ON COLUMN usedboard.USED_ORIGINAL_FILENAME IS '파일이름';
COMMENT ON COLUMN usedboard.USED_RENAME_FILENAME IS '수정파일이름';
COMMENT ON COLUMN usedboard.USED_COUNT IS '조회수';
COMMENT ON COLUMN usedboard.USED_CREATE_DATE IS '작성날짜시간';
COMMENT ON COLUMN usedboard.USED_STATUS IS '회원탈퇴여부';
COMMENT ON COLUMN usedboard.USED_YN IS '판매완료여부(Y-판매완료,N-판매중)';
COMMENT ON COLUMN usedboard.USED_PRICE IS '가격';
COMMENT ON COLUMN usedboard.USED_AREA IS '지역';


--중고 게시판 댓글 테이블 생성
DROP TABLE "USEDREPLY" CASCADE CONSTRAINTS;

CREATE TABLE USEDREPLY (

   "COMMENT_NO"   NUMBER   NOT NULL,
   "USED_NO"   NUMBER   NOT NULL,
   "USED_R_ID"   VARCHAR2(200)   NULL,
   "USED_R_CONTENT"   VARCHAR2(2000)   NULL,
   "USED_REF_ID"   NUMBER   NULL,
   "USED_R_WRITER"   VARCHAR2(200)   NULL,
   "USED_R_CREATEDATE"   DATE   NULL

);

--중고게시판 설명 입력
COMMENT ON COLUMN USEDREPLY.COMMENT_NO IS '댓글 번호';
COMMENT ON COLUMN USEDREPLY.USED_NO IS '글 번호';
COMMENT ON COLUMN USEDREPLY.USED_R_ID IS '댓글 아이디';
COMMENT ON COLUMN USEDREPLY.USED_R_CONTENT IS '댓글 내용';
COMMENT ON COLUMN USEDREPLY.USED_REF_ID IS '게시글 번호 사용안함';
COMMENT ON COLUMN USEDREPLY.USED_R_WRITER IS '작성자 사용안함';
COMMENT ON COLUMN USEDREPLY.USED_R_CREATEDATE IS '작성일';


--=================나만의 캠핑=================
--나만의 캠핑
DROP TABLE "MYCAMP" CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_MYC_NO;

CREATE TABLE MYCAMP(
    MYC_NO NUMBER PRIMARY KEY,
    M_ID VARCHAR2(200) REFERENCES MEMBER(M_ID) ON DELETE CASCADE,
    MYC_TITLE VARCHAR2(500) NOT NULL,
    MYC_PLACE VARCHAR2(400) NOT NULL,
    MYC_DETAIL VARCHAR2(4000) NOT NULL,
    MYC_TAG VARCHAR2(100) ,
    MYC_WRITEDATE DATE,
    MYC_MODIFYDATE DATE,
    MYC_VIEWCNT NUMBER DEFAULT 0, 
    MYC_LIKECNT NUMBER DEFAULT 0,
    MYC_STATUS VARCHAR2(5) DEFAULT 'Y'
    );

-- 나만의 캠핑 시퀀스
CREATE SEQUENCE SEQ_MYC_NO
INCREMENT BY 1
START WITH 1
MAXVALUE 1000000
NOCYCLE
NOCACHE;

COMMENT ON COLUMN MYCAMP.MYC_NO IS '나만의캠핑게시글번호';
COMMENT ON COLUMN MYCAMP.M_ID IS '회원아이디';
COMMENT ON COLUMN MYCAMP.MYC_TITLE IS '나만의캠핑제목';
COMMENT ON COLUMN MYCAMP.MYC_PLACE IS '나만의캠핑위치';
COMMENT ON COLUMN MYCAMP.MYC_DETAIL IS '나만의캠핑세부내용';
COMMENT ON COLUMN MYCAMP.MYC_TAG IS '나만의캠핑태그';
COMMENT ON COLUMN MYCAMP.MYC_WRITEDATE IS '나만의캠핑작성일';
COMMENT ON COLUMN MYCAMP.MYC_MODIFYDATE IS '나만의캠핑수정일';
COMMENT ON COLUMN MYCAMP.MYC_VIEWCNT IS '나만의캠핑조회수';
COMMENT ON COLUMN MYCAMP.MYC_LIKECNT IS '나만의캠핑좋아요';
COMMENT ON COLUMN MYCAMP.MYC_STATUS IS '나만의캠핑상태';


--나만의 캠핑 댓글
DROP TABLE MYCAMPCOMMENT;
DROP SEQUENCE SEQ_MYCCOM_NO;

CREATE TABLE MYCAMPCOMMENT(
    MYC_COMMENT_NO NUMBER PRIMARY KEY,
    MYC_NO NUMBER REFERENCES MYCAMP(MYC_NO) ON DELETE CASCADE,
    M_ID VARCHAR2(200) REFERENCES MEMBER(M_ID) ON DELETE CASCADE,
    MYC_COMMENT VARCHAR2(4000),
    MYC_COMMENT_DATE DATE,
    MYC_COMMENT_STAR NUMBER,
    MYC_COMMENT_STATUS VARCHAR2(5) DEFAULT 'Y'
    );

COMMENT ON COLUMN MYCAMPCOMMENT.MYC_COMMENT_NO IS '나만의캠핑댓글번호';
COMMENT ON COLUMN MYCAMPCOMMENT.MYC_NO IS '나만의캠핑게시글번호';
COMMENT ON COLUMN MYCAMPCOMMENT.M_ID IS '작성자아이디';
COMMENT ON COLUMN MYCAMPCOMMENT.MYC_COMMENT IS '나만의캠핑댓글내용';
COMMENT ON COLUMN MYCAMPCOMMENT.MYC_COMMENT_DATE IS '나만의캠핑댓글작성일';
COMMENT ON COLUMN MYCAMPCOMMENT.MYC_COMMENT_STAR IS '나만의캠핑댓글별점';
COMMENT ON COLUMN MYCAMPCOMMENT.MYC_COMMENT_STATUS IS '나만의캠핑댓글상태';

--나만의 캠핑 시퀀스
CREATE SEQUENCE SEQ_MYCCOM_NO
INCREMENT BY 1
START WITH 1
MAXVALUE 1000000
NOCYCLE
NOCACHE;

-- 나만의 캠핑 파일
DROP TABLE MYCAMPFILE;
DROP SEQUENCE SEQ_MYCFILE_NO;

CREATE TABLE MYCAMPFILE (
   MYC_FILE_NO NUMBER PRIMARY KEY,
   MYC_NO   NUMBER REFERENCES MYCAMP(MYC_NO) ON DELETE CASCADE,
   MYC_FILE_NAME VARCHAR2(100) NOT NULL,
   MYC_FILE_DATE DATE,
   MYC_FILE_PATH VARCHAR2(4000) NOT NULL 
);

--나만의 캠핑 시퀀스
CREATE SEQUENCE SEQ_MYCFILE_NO
INCREMENT BY 1
START WITH 1
MAXVALUE 100000
NOCYCLE
NOCACHE;

COMMENT ON COLUMN MYCAMPFILE.MYC_FILE_NO IS '나만의캠핑파일번호';
COMMENT ON COLUMN MYCAMPFILE.MYC_NO IS '나만의캠핑글번호';
COMMENT ON COLUMN MYCAMPFILE.MYC_FILE_NAME IS '나만의캠핑파일이름';
COMMENT ON COLUMN MYCAMPFILE.MYC_FILE_DATE IS '나만의캠핑파일날짜';
COMMENT ON COLUMN MYCAMPFILE.MYC_FILE_PATH IS '나만의캠핑파일경로';


--나만의 캠핑 좋아요 
DROP TABLE MYCAMPLIKE;
DROP SEQUENCE SEQ_MYCLIKE_NO;

CREATE TABLE MYCAMPLIKE (
   MYC_LIKE_NO NUMBER PRIMARY KEY,
   MYC_NO   NUMBER REFERENCES MYCAMP(MYC_NO) ON DELETE CASCADE,
   M_ID   VARCHAR2(200) REFERENCES MEMBER(M_ID) ON DELETE CASCADE,
   MYC_LIKE_CLICK VARCHAR2(5) DEFAULT 'F'
);
--나만의 캠핑 좋아요 시퀀스
CREATE SEQUENCE SEQ_MYCLIKE_NO
INCREMENT BY 1
START WITH 1
MAXVALUE 1000000
NOCYCLE
NOCACHE;

--캠핑리뷰
DROP TABLE campreview;

CREATE TABLE campreview (
   "RV_NO"   NUMBER      NOT NULL,
   "RES_NO"   NUMBER      NOT NULL,
   "M_ID"   VARCHAR2(200)      NOT NULL,
   "RV_CONTENT"   VARCHAR2(4000)      NULL,
   "RV_DATE"   DATE      NOT NULL,
   "COMMENT_STAR"   NUMBER      NULL,
   "CAMPNO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN campreview.RV_NO IS '후기고유번호';

COMMENT ON COLUMN campreview.RES_NO IS '주문고유번호';

COMMENT ON COLUMN campreview.M_ID IS '아이디';

COMMENT ON COLUMN campreview.RV_CONTENT IS '후기내용';

COMMENT ON COLUMN campreview.RV_DATE IS '후기날짜';

COMMENT ON COLUMN campreview.CAMPNO IS '관리번호';

--예약
DROP TABLE reservation;

CREATE TABLE reservation (
   "RES_NO"   NUMBER      NOT NULL,
   "CAMP_NO"   NUMBER      NOT NULL,
   "M_ID"   VARCHAR2(200)      NOT NULL,
   "START_DATE"   VARCHAR2(200)      NULL,
   "END_DATE"   VARCHAR2(200)      NULL,
   "SUM_PEOPLE"   NUMBER      NULL
);

COMMENT ON COLUMN reservation.RES_NO IS '주문고유번호';

COMMENT ON COLUMN reservation.CAMP_NO IS '관리번호';

COMMENT ON COLUMN reservation.M_ID IS '아이디';

COMMENT ON COLUMN reservation.START_DATE IS '예약날짜';

--캠핑관련
DROP TABLE camping CASCADE CONSTRAINTS;

CREATE TABLE camping (
   "CAMP_NO"   NUMBER      NOT NULL,
   "C_IMG"   NUMBER     NULL,
   "C_NAME"   VARCHAR2(500)      NOT NULL,
   "C_TYPE"   VARCHAR2(100)      NULL,
   "C_ADDR"   VARCHAR2(1000)      NULL,
   "C_PHONE"   VARCHAR2(200)      NULL,
   "C_PARKSUM"   NUMBER      NULL,
   "C_CVNUTIL"   VARCHAR2(500)      NULL,
   "C_SAFEUTIL"   VARCHAR2(500)      NULL,
   "C_ETCTIL"   VARCHAR2(500)      NULL,
   "C_TIME"   VARCHAR2(500)      NULL,
   "C_CHARGE"   VARCHAR2(500)      NULL,
   "C_MANAGETEL"   VARCHAR2(500)      NULL,
   "C_LATITUDE"   NUMBER      NULL,
   "C_LONGITUDE"   NUMBER      NULL,
   "C_LOCAL"   VARCHAR2(500)      NULL,
    "C_ROOMSUM"   NUMBER      NULL,
    "C_COUNT" NUMBER DEFAULT '0',
    "C_RECOMMEND" NUMBER DEFAULT '0'
);

COMMENT ON COLUMN camping.CAMP_NO IS '관리번호';

--캠핑 시퀸스생성
DROP SEQUENCE SEQ_CAMP_NO;
DROP SEQUENCE SEQ_RESERVATION_NO;
DROP SEQUENCE SEQ_CAMPREVIEW_NO;

CREATE SEQUENCE SEQ_CAMP_NO START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SEQ_RESERVATION_NO START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SEQ_CAMPREVIEW_NO START WITH 1 INCREMENT BY 1;

-- 커뮤니티 테이블 생성
DROP TABLE "BOARD" CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_BOARD_NO;

CREATE TABLE board (
   B_NO    NUMBER PRIMARY KEY,
   M_ID VARCHAR2(200) REFERENCES MEMBER(M_ID) ON DELETE CASCADE,
   B_TITLE VARCHAR2(500) NOT NULL,
   B_DETAIL VARCHAR2(4000) NOT NULL,
   B_VIEWCNT NUMBER DEFAULT 0   NOT NULL,
   B_LIKECNT NUMBER DEFAULT 0 NOT NULL,
   B_DATE DATE NOT NULL,
   B_TYPE VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN board.B_NO IS '글번호';

COMMENT ON COLUMN board.M_ID IS '아이디';

COMMENT ON COLUMN board.B_TITLE IS '제목';

COMMENT ON COLUMN board.B_DETAIL IS '내용';

COMMENT ON COLUMN board.B_VIEWCNT IS '조회수';

COMMENT ON COLUMN board.B_LIKECNT IS '추천수';

COMMENT ON COLUMN board.B_DATE IS '작성시간';

COMMENT ON COLUMN board.B_TYPE IS '커뮤니티종류(자유, 가이드, 용품, 레시피)';

-- 커뮤니티 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD_NO START WITH 1 INCREMENT BY 1;

-- 커뮤니티 댓글 테이블
DROP TABLE BOARDCOMMENT;
DROP SEQUENCE SEQ_BOADCOM_NO;

-- 커뮤니티 댓글 테이블 생성
CREATE TABLE BOARDCOMMENT(
   COMMENT_NO NUMBER PRIMARY KEY,
   B_NO NUMBER   REFERENCES BOARD(B_NO) ON DELETE CASCADE,
   "COMMENT" VARCHAR2(4000) NOT NULL,
   COMMENT_DATE DATE NOT NULL,
   COMMENT_WRITER VARCHAR2(200) NOT NULL 
);

-- 커뮤니티 댓글 시퀀스 생성
CREATE SEQUENCE SEQ_BOADCOM_NO START WITH 1 INCREMENT BY 1;

-- 커뮤니티 파일 테이블
DROP TABLE files;
DROP SEQUENCE SEQ_FILES_NO;

-- 커뮤니티 파일 테이블 생성
CREATE TABLE files (
   FILE_NO NUMBER PRIMARY KEY,
   B_NO NUMBER   REFERENCES BOARD(B_NO) ON DELETE CASCADE,
   M_ID VARCHAR2(200) REFERENCES MEMBER(M_ID) ON DELETE CASCADE,
   FILE_NAME VARCHAR2(500) NOT NULL,
   FILE_PATH VARCHAR2(500)   NOT NULL
);

--  파일 시퀀스 생성
CREATE SEQUENCE SEQ_FILES_NO START WITH 1 INCREMENT BY 1;




---------------------------------------------------------내용추가insert문-----------------------------------------------------


--멤버 내용 추가
INSERT INTO MEMBER VALUES( 'admin', '1234', '관리자', '2020.07.09', 'admin@naver.com', '010-1111-1111', sysdate, SEQ_MEMBER_NO.nextval, DEFAULT, 'Y');
INSERT INTO MEMBER VALUES( 'user1', '1234', '홍길동', '1997.07.09', 'user1@naver.com', '010-1111-1111', sysdate, SEQ_MEMBER_NO.nextval, DEFAULT, 'Y');
INSERT INTO MEMBER VALUES( 'user2', '1234', '오현찐', '1993.06.16', 'user2@naver.com', '010-1111-1111', sysdate, SEQ_MEMBER_NO.nextval, DEFAULT, 'Y');
INSERT INTO MEMBER VALUES( 'user3', '1234', '진현오', '1994.01.19', 'user3@naver.com', '010-1111-1111', sysdate, SEQ_MEMBER_NO.nextval, DEFAULT, 'Y');
INSERT INTO MEMBER VALUES( 'user4', '1234', '현정구', '1997.05.05', 'user3@naver.com', '010-1111-1111', sysdate, SEQ_MEMBER_NO.nextval, DEFAULT, 'Y');

-- 중고게시판 내용 입력
INSERT INTO USEDBOARD VALUES( SEQ_USED_NO.NEXTVAL, 'user1', '중고 버너 팝니다', 'user1', '가나다라마바사', '0101','0101','10',SYSDATE,'Y','N','900000','부산');
INSERT INTO USEDBOARD VALUES( SEQ_USED_NO.NEXTVAL, 'user2', '사고 한번사용한 텐트 팝니다.', 'user2', '가나다라마바사', '0101','0101','10',SYSDATE,'Y','N','30000','경기도 안양');
INSERT INTO USEDBOARD VALUES( SEQ_USED_NO.NEXTVAL, 'user3', '캠핑 식기세트 팝니다.', 'user3', '가나다라마바사', '0101','0101','10',SYSDATE,'Y','N','3300000','서울 당산');
INSERT INTO USEDBOARD VALUES( SEQ_USED_NO.NEXTVAL, 'user1', '캠핑용 식탁 팝니다', 'user1', '가나다라마바사', '0101','0101','10',SYSDATE,'Y','N','6200000','서울 광진구');
INSERT INTO USEDBOARD VALUES( SEQ_USED_NO.NEXTVAL, 'user2', '캠핑카 바퀴 팝니다', 'user2', '가나다라마바사', '0101','0101','10',SYSDATE,'Y','N','3100000','서울');
INSERT INTO USEDBOARD VALUES( SEQ_USED_NO.NEXTVAL, 'user3', '가성비 해먹 정리합니다 ', 'user3', '가나다라마바사', '0101','0101','10',SYSDATE,'Y','N','4500000','강원도');
INSERT INTO USEDBOARD VALUES( SEQ_USED_NO.NEXTVAL, 'user1', '아무나 빨리오세요 3가지 처분합니다', 'user1', '가나다라마바사', '0101','0101','10',SYSDATE,'Y','N','6000000','평양직할시');
INSERT INTO USEDBOARD VALUES( SEQ_USED_NO.NEXTVAL, 'user2', '캠핑 가이드북 5권 판매합니다', 'user2', '가나다라마바사', '0101','0101','10',SYSDATE,'Y','N','7000000','평안남도');

--중고 게시판 댓글 내용 입력
INSERT INTO USEDREPLY VALUES( 
SEQ_COMMENT_NO.NEXTVAL,'01','user1','멋지네요 사고싶네요','','',SYSDATE
);
INSERT INTO USEDREPLY VALUES( 
SEQ_COMMENT_NO.NEXTVAL,'02','user2','가격 에누리 안될까요?','','',SYSDATE
);
INSERT INTO USEDREPLY VALUES( 
SEQ_COMMENT_NO.NEXTVAL,'03','user3','멋지네요 사고싶네요','','',SYSDATE
);
INSERT INTO USEDREPLY VALUES( 
SEQ_COMMENT_NO.NEXTVAL,'04','user4','멋지네요 사고싶네요','','',SYSDATE
);
INSERT INTO USEDREPLY VALUES( 
SEQ_COMMENT_NO.NEXTVAL,'05','user5','멋지네요 사고싶네요','','',SYSDATE
);


--채팅방 추가(채팅방번호,유저아이디,중고거래할아이디,중고거래물품고유번호,제목)
insert into chatroom values(SEQ_CHATROOM_NO.NEXTVAL,'user1','user2',2,(select used_title from usedboard where used_no=2));
insert into chatroom values(SEQ_CHATROOM_NO.NEXTVAL,'user2','user1',1,(select used_title from usedboard where  used_no=1));
insert into chatroom values(SEQ_CHATROOM_NO.NEXTVAL,'user1','user3',3,(select used_title from usedboard where used_no=3));

--메시지 추가(메시지고유번호, 보내는사람,받는사람,내용,보낸시간,읽은시간,채팅방고유번호,유저아이디(말건사람),중고거래물품파는사람,중고거래물품고유번호,제목)
insert into MESSAGE values(SEQ_MESSAGE_NO.nextval, 'user1', 'user2', '안녕하세요', TO_CHAR(sysdate,'YYYY"년" MONTHDD"일" AM HH:MI'), '',(select chatroom_no from CHATROOM WHERE m_id = 'user1' and USED_ID = 'user2' ) , 'user1', 'user2', (select used_no from usedboard where used_no=2),(select used_title from usedboard where used_no=2));
insert into MESSAGE values(SEQ_MESSAGE_NO.nextval, 'user2', 'user1', '안녕하세요~', TO_CHAR(sysdate,'YYYY"년" MONTHDD"일" AM HH:MI'), '',(select chatroom_no from CHATROOM WHERE m_id = 'user2' and USED_ID = 'user1') , 'user2', 'user1', (select used_no from usedboard where used_no=1),(select used_title from usedboard where used_no=1));
insert into MESSAGE values(SEQ_MESSAGE_NO.nextval, 'user2', 'user1', '너무 비싼거 아닌가요?', TO_CHAR(sysdate,'YYYY"년" MONTHDD"일" AM HH:MI'), '',(select chatroom_no from CHATROOM WHERE m_id = 'user2' and USED_ID = 'user1') , 'user2', 'user1', (select used_no from usedboard where used_no=1),(select used_title from usedboard where used_no=1));
insert into MESSAGE values(SEQ_MESSAGE_NO.nextval, 'user1', 'user3', '안녕하세요', TO_CHAR(sysdate,'YYYY"년" MONTHDD"일" AM HH:MI'), TO_CHAR(sysdate,'YYYY"년" MONTHDD"일" AM HH:MI'),(select chatroom_no from CHATROOM WHERE m_id = 'user1' and USED_ID = 'user3') , 'user1', 'user3', (select used_no from usedboard where used_no=3),(select used_title from usedboard where used_no=3));
insert into MESSAGE values(SEQ_MESSAGE_NO.nextval, 'user3', 'user1', '네 안녕하세요~', TO_CHAR(sysdate,'YYYY"년" MONTHDD"일" AM HH:MI'), TO_CHAR(sysdate,'YYYY"년" MONTHDD"일" AM HH:MI'),(select chatroom_no from CHATROOM WHERE m_id = 'user1' and USED_ID = 'user3') , 'user1', 'user3', (select used_no from usedboard where used_no=3),(select used_title from usedboard where used_no=3));

-- 나만의 캠핑 추가
INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user1','차박추천합니다','강원도 영월군 16-4','여기는 물도 좋고 공기도 좋고...','#물놀이 #공기좋은 #묽맑은',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user2', '여기 좋아용','강원도 홍천군 앞바다 쪽','바다에있어서 물놀이 할수 있어여','#바다 #물놀이 #차대기편한',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user3', '요기오때','충청남도 보령시 대천동','산속에있어서 너무 좋아요','#산 #조용한 #공기좋은',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user4', '추천합니다!','충청남도 부여 안녕동','많이 놀러갔다오세용~','#도심 #힐링 #분위기있는',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user4', '여기는 아무도 몰랐을걸??','경기도 가평군 가평읍 ','저의 원픽이에요!!','#여름 #익스트림 #물놀이',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user2', '적극 추천해용~','전라남도 여수시 경호동 ','정말 최고에여','#겨울 # 따뜻한 #힐링',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user3', '나만알고싶은 비밀인곳인데..','충청북도 청추시 상당구 94-5','미쳤어요 너무 좋아요','#힐링 #온수 #분위기있는',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user1', '이리오세여 여기 좋아여','제주도 서귀포시 앞바다쪽','한번 갔다오면 못끊는 곳 ㅠㅠㅠ','#바다 #물맑은 #연인',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user2', '이곳이 최고에여!','인천광역시 옹진군 영흥면 75-8','또가고 싶어요!!','#가을 #도심 #가족',SYSDATE,SYSDATE,
0,0,'Y');

INSERT INTO MYCAMP VALUES(SEQ_MYC_NO.NEXTVAL, 'user1', '여기 좋아용','부산광역시 해운대구 해운대 앞바다','마이러버ㅠㅠTOP3안에 들어여','#봄 #따뜻한 #차대기편한',SYSDATE,SYSDATE,
0,0,'Y');


-- 나만의 캠핑 댓글 추가
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, SEQ_MYC_NO.CURRVAL,'user1','갓다와봣어여~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~',sysdate,3,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 2,'user3','여기좋던데',sysdate,4,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 5,'user3','짱짱추천합니드아',sysdate,5,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 5,'user4','너무좋아요!!',sysdate,5,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 3,'user1','그냥그랬어요...',sysdate,2,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 3,'user3','별5개까진아닌듯해요..',sysdate,4,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 4,'user2','또가고 싶어요!!',sysdate,5,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 7,'user2','별로에요..',sysdate,1,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 10,'user4','꼭가세요!!두번가세요!',sysdate,5,'Y');
INSERT INTO MYCAMPCOMMENT VALUES(SEQ_MYCCOM_NO.NEXTVAL, 10,'user3','생각보단 별로였던...',sysdate,2,'Y');

--나만의 캠핑 파일 추가
INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 1,'0_mycamp1.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp1.jpg');

INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 2,'0_mycamp2.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp2.jpg');

INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 3,'0_mycamp3.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp3.jpg');

INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 4,'0_mycamp4.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp4.jpg');

INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 5,'0_mycamp5.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp5.jpg');
    
INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 6,'0_mycamp6.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp6.jpg');

INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 7,'0_mycamp7.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp7.jpg');

INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 8,'0_mycamp8.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp8.jpg');

INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 9,'0_mycamp9.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp9.jpg');

INSERT INTO MYCAMPFILE
      VALUES (SEQ_MYCFILE_NO.NEXTVAL, 10,'0_mycamp10.jpg', SYSDATE,'C:\Users\AAA\git\GreenCamp\GreenCamp\src\main\webapp\resources\myCampFiles\0_mycamp10.jpg');


--나만의 캠핑 좋아요 추가
INSERT INTO MYCAMPLIKE VALUES(SEQ_MYCLIKE_NO.NEXTVAL,5,'user1','F');

--캠핑 예약 추가
insert into RESERVATION VALUES(SEQ_RESERVATION_NO.NEXTVAL,1,'admin',TO_CHAR(sysdate-7,'YYYY.MM.DD'),TO_CHAR(sysdate-5,'YYYY.MM.DD'),3);
insert into RESERVATION VALUES(SEQ_RESERVATION_NO.NEXTVAL,1,'user1',TO_CHAR(sysdate-10,'YYYY.MM.DD'),TO_CHAR(sysdate-8,'YYYY.MM.DD'),4);
insert into RESERVATION VALUES(SEQ_RESERVATION_NO.NEXTVAL,2,'user1',TO_CHAR(sysdate-10,'YYYY.MM.DD'),TO_CHAR(sysdate-9,'YYYY.MM.DD'),5);



--캠핑리뷰 추가
insert into CAMPREVIEW VALUES(SEQ_CAMPREVIEW_NO.NEXTVAl,24,'admin','지난 주말 가족들과 다녀왔습니다.너무 좋아요~',sysdate,5,1);
insert into CAMPREVIEW VALUES(SEQ_CAMPREVIEW_NO.NEXTVAl,22,'user1','친구들과 다녀왔는데 재밌었어요',sysdate-4,4,2);
insert into CAMPREVIEW VALUES(SEQ_CAMPREVIEW_NO.NEXTVAl,87,'user1','지난주말 혼자다녀왔습니다 최고에요',sysdate-7,5,1);


-- 커뮤니티 내용 추가문
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','네이처 우드 3단 쉘프','고급 스프러스 원목을 사용한 3단 다용도 선반으로 원목 특유의 감성을 살렸으며 100% 핸드메이드 제작되었습니다.',DEFAULT,DEFAULT,SYSDATE,'용품추천');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','굿 좋은 제품입니다.','추천해드려요!',DEFAULT,DEFAULT,SYSDATE,'용품추천');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','베스트 제품!!','좋습니다~',DEFAULT,DEFAULT,SYSDATE,'용품추천');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user2','벌레 쫓아주는 조명!','여름에 잘 활용하면 유용합니다~~',DEFAULT,DEFAULT,SYSDATE,'용품추천');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user2','[듀랑고]캐빈와이드','어떤 구성에도 여유로운 전실 사용을 위해 전실 룸을 확장해 생활 편의성이 높아졌습니다. 넓은 어닝과 높은 천장 그리고 넓은 실내 공간을 가진 캐빈형 듀랑고',DEFAULT,DEFAULT,SYSDATE,'용품추천');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user3','[몬테라]안체어(블랙)','1. 인체 공학적 패턴
- 누워서 쉴 수 있는 패턴으로 최적의 편안함을 제공합니다.

2. 암레스트 시트
- 팔 거치대를 측면에 디자인하여 보다 편안함을 제공합니다.

3. 실내에서도 편안한 체어
- 간이침대보다 설치가 간편하며 공간 제약에서 자유롭습니다.',DEFAULT,DEFAULT,SYSDATE,'용품추천');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user4','[테톤]캠프필로우 베개(아담라이너패턴)','높은 평가를 받은 테톤사의 침낭과 같은 구조로 되어있으며 내피와 외피가 분리되어 빨래가 용이하다.',DEFAULT,DEFAULT,SYSDATE,'용품추천');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user2','조개구이 요리해 드세요~','조개구이 하는방법 간단합니다!',DEFAULT,DEFAULT,SYSDATE,'레시피');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','든든한 한 끼, 또는 메인 안주로도 일품 닭볶음탕','적당한 국물과 든든한 고기가 함께 있어 저녁 메인 요리나 안주로 제격인 ‘닭볶음탕’. 조리 과정도 어렵지 않아 누구나 쉽게 도전할 수 있죠. 매콤한 국물이 쏙쏙 밴 살코기와 감자를 한입 먹으면 사라진 입맛도 돌아올 맛입니다. 



재료

닭 1마리 600g, 감자 2개, 양파 1개, 당근 1/4개, 대파 1/2, 고추, 물 3컵(600mL) 

양념 재료 

고추장 3T, 고춧가루 3T, 간장 2T, 설탕 3T, 다진 마늘 1T, 후추 

만들기 

1. 흐르는 물에 닭을 깨끗하게 씻은 후 도톰한 부분엔 칼집을 내준다. 

2. 감자와 양파, 당근은 적당한 크기로 먹기 좋게 썰어주고 대파는 어슷썰기 한다. 

3. 닭이 잠길 정도로 물을 담고 센 불로 끓여준다.

4. 준비된 감자, 양파 등 채소와 양념 재료를 넣어준다. 

5. 끓기 시작하면 어느 정도 국물을 졸여준다. 

Tip 

닭 잡내를 잡기 위해 양념에 소주를 넣어 주거나 사전에 닭을 한번 데쳐서 사용하면 좋습니다. 매운 양념장과 고루 버무려 끓이는데, 물을 자작하게 넣고 중불에 오래 졸여주면 맛이 더욱 깊어지죠. 남은 닭볶음탕 양념에는 김 가루와 파를 넣어 볶음밥으로 즐기면 이 또한 별미입니다. ',DEFAULT,DEFAULT,SYSDATE,'레시피');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user3','고소한 참기름에 구운 치킨 텐더 꼬치','
<재료>

닭고기 안심 5 장, 양파 1/2 개, 마늘 10 쪽, 건강을 생각한 고소한 참기름, 구운 소금, 후추



<만드는 법>

1. 닭안심은 깨끗하게 씻어 힘줄을 제거한 뒤, 고소한 참기름, 소금, 후추를 모두 넣어 재워둔다. 양파는 사방 3cm로 자르고 마늘은 꼭지를 제거한다.

2. 꼬지에 닭안심, 양파, 마늘을 번갈아 끼운다.

3. 달군 팬에 백설 참기름을 두르고 준비해 둔 닭안심 꼬지를 올려 앞뒤로 노릇하게 구워내면 완성!',DEFAULT,DEFAULT,SYSDATE,'레시피');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user4','떡볶이도 만들어봐요~','맛있습니다.',DEFAULT,DEFAULT,SYSDATE,'레시피');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user2','야외 베스트 음식','삼겹살이 최고에요...!!',DEFAULT,DEFAULT,SYSDATE,'레시피');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user3','뱅쇼!','프랑스어로 따뜻한 포도주라는 뜻의 이 음료는 추운 북유럽 지역에서 원기 회복이나 감기 예방을 위해 약처럼 마시기 시작한 데서 유래됐다고 합니다. 즉, ‘유럽식 쌍화탕’인 셈이죠. 뱅쇼 한 잔이면 겨울 캠핑을 더욱 따뜻하고 기분 좋게 덥혀줄 수 있습니다. 



재료 

레드와인 1병, 오렌지 2개, 레몬 1개, 사과 1개, 통 계피 1개, 정향 3개, 설탕 2T 

만들기

1. 과일은 껍질을 깨끗이 씻어서 도톰하게 잘라 준비한다. 

2. 냄비에 와인과 오렌지, 사과, 계피, 정향, 설탕을 넣고 끓기 시작하면 약한 불로 줄여 25~30분간 더 끓인다. 

3. 기호에 따라 설탕으로 당도를 조절한다. 

Tip 

와인은 부드러운 타닌이 있는 것으로 선택하면 좋습니다. 뚜껑을 열고 끓이면 알코올이 날아가므로 알코올을 원한다면 꼭 뚜껑을 덮고 끓여주세요.',DEFAULT,DEFAULT,SYSDATE,'레시피');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user4','시원한 바지락 칼국수 만들어봐요~~','한 끼 식사를 가볍게 때우고 싶거나, 점심과 저녁 사이 출출함을 달래고 싶을 때 국수만 한 것이 없죠. 그중에서도 시원한 국물 맛이 일품인 바지락칼국수는 남녀노소 누구나 즐기기 좋은 메뉴인데요. 부모님과 함께하는 캠핑이라면 강력 추천하는 메뉴입니다. 



재료 

칼국수면 400g, 바지락 200g, 호박 1/4개, 당근 1/4개, 대파 1/4개, 마늘 1T, 육수 6컵(1200ml), 약간의 소금과 후추

육수 재료

멸치, 다시마, 양파 1/2개, 무 1/4개, 대파 1/4개

만들기 

1. 냄비에 물을 부은 후 멸치, 다시마, 무, 양파, 대파를 넣고 육수를 낸다.

2. 바지락은 옅은 소금물에 30분 정도 해감해둔다. 

3. 호박과 당근은 깨끗이 씻어 가늘게 채 썰고, 대파는 어슷썰기로 썬다. 

4. 면을 넣고 반쯤 익으면 다진 마늘과 해감 된 바지락을 넣는다. 

5. 면이 익어 투명해지면 소금으로 간을 맞추고 파를 넣는다. 

Tip 

시판용 칼국수 면을 사용할 때는, 국물이 텁텁해지는 걸 막기 위해 면 위에 뿌려진 전분을 최대한 털어내 사용하면 좋습니다. 또 청양고추나 김치를 넣어 칼칼한 맛을 더해주면 해장용으로도 좋죠.',DEFAULT,DEFAULT,SYSDATE,'레시피');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','텐트 설치하기 힘드신가요?','원터치 텐트를 사용하시면 편합니다!',DEFAULT,DEFAULT,SYSDATE,'가이드');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user2','삽 이용시 주의하세요!','조심해요~',DEFAULT,DEFAULT,SYSDATE,'가이드');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','의자 설치 꼭 확인하기!!','제대로 설치했는지 꼭 확인해주세요! 다쳐요!!',DEFAULT,DEFAULT,SYSDATE,'가이드');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user3','테이블 설치는 이렇게!','간단하게 하실 수 있습니다.',DEFAULT,DEFAULT,SYSDATE,'가이드');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user4','장소, 상황별 텐트 치는방법','장소•상황별 텐트 제대로 치는 법
텐트를 치기 전 작은 돌이나 솔방울, 나뭇가지를 정리해 바닥을 평평하게 다진다. 초보 캠퍼인 경우 텐트의 흔적을 찾아 그 자리에 텐트를 치는 것도 방법.
모래사장 T자나 V자 모양의 페그를 사용해야 하며, 길이는 최소 30cm 이상 되어야 한다. 페그를 박은 다음 그 위 에 모래주머니를 올려두면 튼튼해진다.
바람 심한 날 평소보다 당김줄을 팽팽하게 당겨 페그로 고정한다. 바람을 정면으로 맞는 방향의 당김줄은 페그1개로 힘을 받지 못하니 여러 개를 이용한다.
언 땅 콘크리트 못이나 12cm 길이의 단조 페그를 박으면 잘 들어간다. 언 땅에서는 페그가 5cm만 들어가도 힘을 발휘하니 깊게 박지 않아도 된다. 페그를 뽑을 때는 끓는 물을 부어가면서 뽑으면 쉽다.',DEFAULT,DEFAULT,SYSDATE,'가이드');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user2','처음 캠핑을 가려고 합니다. 제일 먼저 무엇을 해야 하나요?','캠핑을 처음 하는 경우 가장 먼저 장비를 구입하려 한다. 하지만 그보다 먼저 해야 할 일이 있다. 자신이 캠핑 체질인지 알아보는 일이다. 본격적인 캠핑에 앞서 한 번쯤 체험 캠핑을 가보는 것이다. 캠핑장에 세팅된 텐트를 이용하거나 이미 캠핑을 즐기고 있는 친구나 가족을 따라가 본다. 체험 캠핑이 즐거웠다면 그 다음에 장비를 갖춘다. 일명 ‘스타터 세트’라 불리는 텐트, 의자, 테이블, 매트리스, 랜턴, 버너, 코펠 등을 갖추고 나머지 장비는 하나씩 마련하도록 한다.',DEFAULT,DEFAULT,SYSDATE,'가이드');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','무조건 비싼 장비가 좋나요?','같은 테이블이라도 브랜드에 따라 가격은 천차만별이다. 그럼 비쌀수록 성능이 좋은 것일까. 반드시 그렇진 않다. 성능은 그것을 사용하고 관리하는 사람에 따라 크게 차이가 나기 때문이다. 따라서 자신의 예산을 고려해 거기에 맞는 제품을 구입하기를 권한다. 단, 텐트나 타프, 버너, 랜턴처럼 두고두고 사용할 제품들은 브랜드 제품을 구입하는 것이 좋다. 비싼 것을 사라는 것이 아니라 정식 매장에서 브랜드 제품을 구입하라는 의미다. 그래야 사용하는 동안 편하게 A/S를 받을 수 있다.',DEFAULT,DEFAULT,SYSDATE,'가이드');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','캠핑의 기본 준비물은 무엇인가요?','장소는 춘천쪽에서 하려고 합니다.',DEFAULT,DEFAULT,SYSDATE,'자유');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user2','장소 좋은 곳 있나요???','강원도로 캠핑 가려는데 추천해주세요!!',DEFAULT,DEFAULT,SYSDATE,'자유');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user3','캠핑하려는데 침낭 추천해주세요!!!','침낭 어떤게 좋을까요?',DEFAULT,DEFAULT,SYSDATE,'자유');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user4','캠핑 초보입니다! ','준비물이 어떤게 필요할까요?',DEFAULT,DEFAULT,SYSDATE,'자유');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user2','꼭 필요한 사항이 있을까요??','없습니다~~ 몸만 건강히',DEFAULT,DEFAULT,SYSDATE,'자유');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user3','다음주에 캠핑 같이 하실 분 구합니다~','장소는 춘천쪽에서 하려고 합니다.',DEFAULT,DEFAULT,SYSDATE,'자유');
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'user1','캠핑의 기본 준비물은 무엇인가요?',' 집을 떠나 생활하는 것인 만큼 캠핑에는 기본적인 장비가 필요하다. 준비물은 캠핑의 목적에 따라 조금씩 달라지는데, 기본적으로는 10가지로 압축할 수 있다.
1 텐트 비싼 것보다 구성원 수에 맞춰 구입한다.
2 의자 캠핑에서는 앉아 있는 시간이 많으므로 편하게 휴식을 취하기 위해서는 필수다.
3 매트 없으면 잘 때 허리가 아프다.
4 취사도구 집에 있는 냄비를 들고 가기엔 부피가 너무 크니 캠핑용을 따로 장만한다.
5 아이스박스 식재료를 신선하게 보관하고 음료를 시원하게 유지해준다.
6 침낭 이불과 담요는 부피도 크고 추위도 제대로 막을 수 없다.
7 랜턴 랜턴이 없으면 밤에는 어두워서 아무것도 할 수 없다.
8 버너 휴대용 가스 버너라면 어느 것이든 OK.
9 타프 그늘막이 되어주기도 하고 비도 막아줘 있으면 확실히 편하다.
10 화로대 불을 피워 음식을 해 먹을 수도 있고 캠프파이어도 할 수 있다.',DEFAULT,DEFAULT,SYSDATE,'자유');


--커뮤니티 댓글 내용 추가문
INSERT INTO BOARDCOMMENT VALUES(SEQ_BOADCOM_NO.NEXTVAL,2,'방법을 알려주세요!',SYSDATE,'user2');


-- 파일 추가문
INSERT INTO files VALUES(SEQ_FILES_NO.NEXTVAL,6,'user3','inchair.png','C:\Users\user1\git\GreenCamp\GreenCamp\src\main\webapp\resources\user3\uploadFiles\inchair.png');
INSERT INTO files VALUES(SEQ_FILES_NO.NEXTVAL,5,'user2','duranggo.png','C:\Users\user1\git\GreenCamp\GreenCamp\src\main\webapp\resources\user2\uploadFiles\duranggo.png');
INSERT INTO files VALUES(SEQ_FILES_NO.NEXTVAL,5,'user2','duranggo2.png','C:\Users\user1\git\GreenCamp\GreenCamp\src\main\webapp\resources\user2\uploadFiles\duranggo2.png');
INSERT INTO files VALUES(SEQ_FILES_NO.NEXTVAL,14,'user4','kal.png','C:\Users\user1\git\GreenCamp\GreenCamp\src\main\webapp\resources\user4\uploadFiles\kal.png');



--캠핑장api 데이터넣고 실행하기
--UPDATE CAMPING SET C_CVNUTIL=REPLACE(C_CVNUTIL, ',' ,'+');
--UPDATE CAMPING SET C_ETCTIL=REPLACE(C_ETCTIL, ',' ,'+');
--COMMIT;

--코밋~~!
COMMIT;



