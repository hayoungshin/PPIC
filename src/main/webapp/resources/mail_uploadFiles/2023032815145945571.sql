-----------------삭제------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
---------------------------------------


--------------------------------------------------------
--  파일이 생성됨 - 수요일-3월-22-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_APNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_APNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ATNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ATNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 38 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_AUNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_AUNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 36 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CARNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CARNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CHATNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CHATNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 86 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CHATROOMNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CHATROOMNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 65 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CHNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CHNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CONO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CONO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 37 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_DEPTNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_DEPTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_DOCNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_DOCNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 15 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FONO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FONO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 75 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_HANO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_HANO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 33 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_HNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_HNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 58 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MAILATCNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MAILATCNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MAILNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MAILNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MEMNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MEMNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 45 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_NNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 76 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NOTNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_NOTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 114 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PJNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PJNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 76 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_POSNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_POSNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REPORTNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_REPORTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RMNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RMNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RSCNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RSCNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RSRMNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RSRMNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SCHNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_SCHNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 25 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_TKNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_TKNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 107 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_WNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_WNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 293 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ADDRESS_LIKE
--------------------------------------------------------

  CREATE TABLE "ADDRESS_LIKE" 
   (	"USER_NO" NUMBER, 
	"LIKE_USER" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table APPROVAL
--------------------------------------------------------

  CREATE TABLE "APPROVAL" 
   (	"APPROVAL_NO" NUMBER, 
	"COMPLETE_NO" VARCHAR2(20 BYTE), 
	"USER_NO" NUMBER, 
	"FORM" VARCHAR2(30 BYTE), 
	"TITLE" VARCHAR2(100 BYTE), 
	"CREATE_DATE" VARCHAR2(20 BYTE) DEFAULT SYSDATE, 
	"COMPLETE_DATE" VARCHAR2(20 BYTE), 
	"CURRENT_ORDER" NUMBER DEFAULT 0, 
	"FINAL_ORDER" NUMBER, 
	"APPROVAL_STATUS" VARCHAR2(20 BYTE) DEFAULT '대기', 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "APPROVAL"."APPROVAL_NO" IS '전자결재번호';
   COMMENT ON COLUMN "APPROVAL"."COMPLETE_NO" IS '문서번호';
   COMMENT ON COLUMN "APPROVAL"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "APPROVAL"."FORM" IS '문서양식';
   COMMENT ON COLUMN "APPROVAL"."TITLE" IS '제목';
   COMMENT ON COLUMN "APPROVAL"."CREATE_DATE" IS '작성일';
   COMMENT ON COLUMN "APPROVAL"."COMPLETE_DATE" IS '완료일';
   COMMENT ON COLUMN "APPROVAL"."CURRENT_ORDER" IS '진행순서';
   COMMENT ON COLUMN "APPROVAL"."FINAL_ORDER" IS '최종순서';
   COMMENT ON COLUMN "APPROVAL"."APPROVAL_STATUS" IS '결재상태';
   COMMENT ON COLUMN "APPROVAL"."STATUS" IS '상태';
--------------------------------------------------------
--  DDL for Table APP_CHANGE
--------------------------------------------------------

  CREATE TABLE "APP_CHANGE" 
   (	"CHANGE_NO" NUMBER, 
	"APPROVAL_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"CONTENT" VARCHAR2(500 BYTE), 
	"CREATE_DATE" VARCHAR2(20 BYTE) DEFAULT SYSDATE, 
	"ROLE" VARCHAR2(10 BYTE), 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "APP_CHANGE"."CHANGE_NO" IS '변경사항번호';
   COMMENT ON COLUMN "APP_CHANGE"."APPROVAL_NO" IS '전자결재번호';
   COMMENT ON COLUMN "APP_CHANGE"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "APP_CHANGE"."CONTENT" IS '내용';
   COMMENT ON COLUMN "APP_CHANGE"."CREATE_DATE" IS '등록일';
   COMMENT ON COLUMN "APP_CHANGE"."ROLE" IS '역할';
   COMMENT ON COLUMN "APP_CHANGE"."STATUS" IS '상태';
--------------------------------------------------------
--  DDL for Table APP_PROCESS
--------------------------------------------------------

  CREATE TABLE "APP_PROCESS" 
   (	"APPROVAL_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"PROCESS_ORDER" NUMBER, 
	"APPROVAL_ROLE" VARCHAR2(10 BYTE), 
	"STATUS" VARCHAR2(10 BYTE), 
	"APPROVAL_DATE" VARCHAR2(20 BYTE), 
	"BOOKMARK" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "APP_PROCESS"."APPROVAL_NO" IS '전자결재번호';
   COMMENT ON COLUMN "APP_PROCESS"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "APP_PROCESS"."PROCESS_ORDER" IS '순서';
   COMMENT ON COLUMN "APP_PROCESS"."APPROVAL_ROLE" IS '결재역할';
   COMMENT ON COLUMN "APP_PROCESS"."STATUS" IS '상태';
   COMMENT ON COLUMN "APP_PROCESS"."APPROVAL_DATE" IS '결재일';
   COMMENT ON COLUMN "APP_PROCESS"."BOOKMARK" IS '중요';
--------------------------------------------------------
--  DDL for Table ATTACHMENT
--------------------------------------------------------

  CREATE TABLE "ATTACHMENT" 
   (	"ATTACHMENT_NO" NUMBER, 
	"ORIGIN_NAME" VARCHAR2(1000 BYTE), 
	"CHANGE_NAME" VARCHAR2(2000 BYTE), 
	"CATEGORY_NO" NUMBER, 
	"REF_NO" NUMBER
   ) ;

   COMMENT ON COLUMN "ATTACHMENT"."ATTACHMENT_NO" IS '첨부파일번호';
   COMMENT ON COLUMN "ATTACHMENT"."ORIGIN_NAME" IS '원본명';
   COMMENT ON COLUMN "ATTACHMENT"."CHANGE_NAME" IS '수정명';
   COMMENT ON COLUMN "ATTACHMENT"."CATEGORY_NO" IS '첨부파일유형';
   COMMENT ON COLUMN "ATTACHMENT"."REF_NO" IS '참조게시글번호';
--------------------------------------------------------
--  DDL for Table AUTHORITY
--------------------------------------------------------

  CREATE TABLE "AUTHORITY" 
   (	"AUTHORITY_NO" NUMBER, 
	"AUTHORITY_NAME" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BOARD_NO" NUMBER, 
	"BOARD_WRITER" NUMBER, 
	"BOARD_TITLE" VARCHAR2(200 BYTE), 
	"BOARD_CONTENT" VARCHAR2(4000 BYTE), 
	"COUNT" NUMBER DEFAULT 0, 
	"CREATE_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"BLIND_STA" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호';
   COMMENT ON COLUMN "BOARD"."BOARD_WRITER" IS '작성자회원번호';
   COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '익명게시판제목';
   COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '익명게시판내용';
   COMMENT ON COLUMN "BOARD"."COUNT" IS '조회수';
   COMMENT ON COLUMN "BOARD"."CREATE_DATE" IS '익명게시판작성일';
   COMMENT ON COLUMN "BOARD"."MODIFY_DATE" IS '익명게시판수정일';
   COMMENT ON COLUMN "BOARD"."STATUS" IS '익명게시판등록상태';
   COMMENT ON COLUMN "BOARD"."BLIND_STA" IS '블라인드여부';
--------------------------------------------------------
--  DDL for Table CAR
--------------------------------------------------------

  CREATE TABLE "CAR" 
   (	"CAR_CODE" NUMBER, 
	"CAR_NAME" VARCHAR2(300 BYTE), 
	"CAR_NUMBER" VARCHAR2(100 BYTE), 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"MODIFY_DATE" DATE DEFAULT sysdate, 
	"CREATE_USER" NUMBER, 
	"DELETE_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "CAR"."CAR_CODE" IS '차량코드';
   COMMENT ON COLUMN "CAR"."CAR_NAME" IS '법인차량명';
   COMMENT ON COLUMN "CAR"."CAR_NUMBER" IS '법인차량번호';
   COMMENT ON COLUMN "CAR"."CREATE_DATE" IS '등록일';
   COMMENT ON COLUMN "CAR"."MODIFY_DATE" IS '수정일';
   COMMENT ON COLUMN "CAR"."CREATE_USER" IS '등록유저';
   COMMENT ON COLUMN "CAR"."DELETE_STATUS" IS '삭제여부(Y: 삭제, N: 삭제X)';
--------------------------------------------------------
--  DDL for Table CHAT
--------------------------------------------------------

  CREATE TABLE "CHAT" 
   (	"CHAT_NO" NUMBER, 
	"ROOM_NO" NUMBER, 
	"SEND_NO" NUMBER, 
	"CHAT_CONTENT" VARCHAR2(3000 BYTE), 
	"SEND_DATE" DATE DEFAULT SYSDATE, 
	"NOT_READ" NUMBER
   ) ;

   COMMENT ON COLUMN "CHAT"."CHAT_NO" IS '채팅번호';
   COMMENT ON COLUMN "CHAT"."ROOM_NO" IS '채팅방번호';
   COMMENT ON COLUMN "CHAT"."SEND_NO" IS '발신자회원번호';
   COMMENT ON COLUMN "CHAT"."CHAT_CONTENT" IS '채팅내용';
   COMMENT ON COLUMN "CHAT"."SEND_DATE" IS '채팅전송시간';
   COMMENT ON COLUMN "CHAT"."NOT_READ" IS '읽지않은회원수';
--------------------------------------------------------
--  DDL for Table CHATROOM
--------------------------------------------------------

  CREATE TABLE "CHATROOM" 
   (	"ROOM_NO" NUMBER, 
	"ROOM_NAME" VARCHAR2(1000 BYTE), 
	"LAST_CHAT" VARCHAR2(3000 BYTE), 
	"CREATE_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT sysdate, 
	"GROUP_COUNT" NUMBER
   ) ;

   COMMENT ON COLUMN "CHATROOM"."ROOM_NO" IS '채팅방번호';
   COMMENT ON COLUMN "CHATROOM"."ROOM_NAME" IS '채팅방이름';
   COMMENT ON COLUMN "CHATROOM"."LAST_CHAT" IS '마지막채팅';
   COMMENT ON COLUMN "CHATROOM"."CREATE_DATE" IS '채팅방생성일';
   COMMENT ON COLUMN "CHATROOM"."MODIFY_DATE" IS '채팅방수정일';
   COMMENT ON COLUMN "CHATROOM"."GROUP_COUNT" IS '참여자수';
--------------------------------------------------------
--  DDL for Table CHAT_LIKE
--------------------------------------------------------

  CREATE TABLE "CHAT_LIKE" 
   (	"MYUSER_NO" NUMBER, 
	"LIKEUSER_NO" NUMBER, 
	"LIKE_DATE" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "CHAT_LIKE"."MYUSER_NO" IS '기준회원번호';
   COMMENT ON COLUMN "CHAT_LIKE"."LIKEUSER_NO" IS '즐겨찾는회원번호';
   COMMENT ON COLUMN "CHAT_LIKE"."LIKE_DATE" IS '즐겨찾기추가일';
--------------------------------------------------------
--  DDL for Table COMPANY_SCH
--------------------------------------------------------

  CREATE TABLE "COMPANY_SCH" 
   (	"SCH_NO" NUMBER, 
	"SCH_KIND" VARCHAR2(1 BYTE), 
	"RESTDAY_KIND" VARCHAR2(1 BYTE), 
	"SCH_NAME" VARCHAR2(500 BYTE), 
	"SCH_CONTENT" VARCHAR2(2000 BYTE), 
	"SCH_LOCATION" VARCHAR2(1000 BYTE), 
	"LUNAR_SOLAR" VARCHAR2(1 BYTE), 
	"START_DATE" VARCHAR2(100 BYTE), 
	"END_DATE" VARCHAR2(100 BYTE), 
	"ANNUAL" VARCHAR2(1 BYTE), 
	"START_TIME" VARCHAR2(100 BYTE), 
	"END_TIME" VARCHAR2(100 BYTE), 
	"ALLDAY" VARCHAR2(1 BYTE), 
	"LEGALHOLIDAY" VARCHAR2(1 BYTE)
   ) ;

   COMMENT ON COLUMN "COMPANY_SCH"."SCH_NO" IS '일정번호';
   COMMENT ON COLUMN "COMPANY_SCH"."SCH_KIND" IS '일정종류(0:쉬는날,1:회사일정)';
   COMMENT ON COLUMN "COMPANY_SCH"."RESTDAY_KIND" IS '쉬는날종류(0:휴일,1:기념일)';
   COMMENT ON COLUMN "COMPANY_SCH"."SCH_NAME" IS '이름';
   COMMENT ON COLUMN "COMPANY_SCH"."SCH_CONTENT" IS '내용';
   COMMENT ON COLUMN "COMPANY_SCH"."SCH_LOCATION" IS '장소';
   COMMENT ON COLUMN "COMPANY_SCH"."LUNAR_SOLAR" IS '양음력(0:양력,1:음력)';
   COMMENT ON COLUMN "COMPANY_SCH"."START_DATE" IS '시작날짜';
   COMMENT ON COLUMN "COMPANY_SCH"."END_DATE" IS '종료날짜';
   COMMENT ON COLUMN "COMPANY_SCH"."ANNUAL" IS '매년반복여부';
   COMMENT ON COLUMN "COMPANY_SCH"."START_TIME" IS '시작시간';
   COMMENT ON COLUMN "COMPANY_SCH"."END_TIME" IS '종료시간';
   COMMENT ON COLUMN "COMPANY_SCH"."ALLDAY" IS '종일여부';
   COMMENT ON COLUMN "COMPANY_SCH"."LEGALHOLIDAY" IS '법정공휴일여부';
--------------------------------------------------------
--  DDL for Table DEPT
--------------------------------------------------------

  CREATE TABLE "DEPT" 
   (	"DEPARTMENT_NO" NUMBER, 
	"DEPARTMENT_NAME" VARCHAR2(10 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table DOCUMENT
--------------------------------------------------------

  CREATE TABLE "DOCUMENT" 
   (	"DOC_NO" NUMBER, 
	"DOC_TYPE" NUMBER, 
	"DOC_NAME" VARCHAR2(500 BYTE), 
	"SAVE_PATH" VARCHAR2(1000 BYTE), 
	"ORIGIN_NAME" VARCHAR2(500 BYTE), 
	"CREATE_USER" NUMBER, 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"MODIFY_DATE" DATE DEFAULT sysdate, 
	"DELETE_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "DOCUMENT"."DOC_NO" IS '문서번호';
   COMMENT ON COLUMN "DOCUMENT"."DOC_TYPE" IS '문서타입(1:회사문서/2:개인문서)';
   COMMENT ON COLUMN "DOCUMENT"."DOC_NAME" IS '문서명';
   COMMENT ON COLUMN "DOCUMENT"."SAVE_PATH" IS '첨부파일경로';
   COMMENT ON COLUMN "DOCUMENT"."ORIGIN_NAME" IS '첨부파일원본명';
   COMMENT ON COLUMN "DOCUMENT"."CREATE_USER" IS '등록유저번호';
   COMMENT ON COLUMN "DOCUMENT"."CREATE_DATE" IS '등록일';
   COMMENT ON COLUMN "DOCUMENT"."MODIFY_DATE" IS '수정일';
   COMMENT ON COLUMN "DOCUMENT"."DELETE_STATUS" IS '삭제여부(Y: 삭제, N: 삭제X)';
--------------------------------------------------------
--  DDL for Table FORM_CASH
--------------------------------------------------------

  CREATE TABLE "FORM_CASH" 
   (	"FORM_NO" NUMBER, 
	"APPROVAL_NO" NUMBER, 
	"ACCOUNT" VARCHAR2(20 BYTE), 
	"USER_HISTORY" VARCHAR2(200 BYTE), 
	"PRICE" NUMBER, 
	"VAT" NUMBER DEFAULT 0
   ) ;

   COMMENT ON COLUMN "FORM_CASH"."FORM_NO" IS '양식번호';
   COMMENT ON COLUMN "FORM_CASH"."APPROVAL_NO" IS '전자결재번호';
   COMMENT ON COLUMN "FORM_CASH"."ACCOUNT" IS '거래처';
   COMMENT ON COLUMN "FORM_CASH"."USER_HISTORY" IS '사용내역';
   COMMENT ON COLUMN "FORM_CASH"."PRICE" IS '금액';
   COMMENT ON COLUMN "FORM_CASH"."VAT" IS '부가가치세';
--------------------------------------------------------
--  DDL for Table FORM_CONSUME
--------------------------------------------------------

  CREATE TABLE "FORM_CONSUME" 
   (	"FORM_NO" NUMBER, 
	"APPROVAL_NO" NUMBER, 
	"NAME" VARCHAR2(50 BYTE), 
	"REASON" VARCHAR2(200 BYTE), 
	"UNIT" VARCHAR2(50 BYTE), 
	"COUNT" NUMBER, 
	"PRICE" NUMBER
   ) ;

   COMMENT ON COLUMN "FORM_CONSUME"."FORM_NO" IS '양식번호';
   COMMENT ON COLUMN "FORM_CONSUME"."APPROVAL_NO" IS '전자결재번호';
   COMMENT ON COLUMN "FORM_CONSUME"."NAME" IS '품명';
   COMMENT ON COLUMN "FORM_CONSUME"."REASON" IS '사유';
   COMMENT ON COLUMN "FORM_CONSUME"."UNIT" IS '단위';
   COMMENT ON COLUMN "FORM_CONSUME"."COUNT" IS '수량';
   COMMENT ON COLUMN "FORM_CONSUME"."PRICE" IS '단가';
--------------------------------------------------------
--  DDL for Table FORM_DRAFT
--------------------------------------------------------

  CREATE TABLE "FORM_DRAFT" 
   (	"FORM_NO" NUMBER, 
	"APPROVAL_NO" NUMBER, 
	"EFFECTIVE_DATE" VARCHAR2(20 BYTE), 
	"DEPARTMENT_NO" NUMBER, 
	"CONTENT" CLOB
   ) ;

   COMMENT ON COLUMN "FORM_DRAFT"."APPROVAL_NO" IS '전자결재번호';
   COMMENT ON COLUMN "FORM_DRAFT"."EFFECTIVE_DATE" IS '시행일자';
   COMMENT ON COLUMN "FORM_DRAFT"."DEPARTMENT_NO" IS '협조부서';
   COMMENT ON COLUMN "FORM_DRAFT"."CONTENT" IS '내용';
--------------------------------------------------------
--  DDL for Table FORM_TRANSFER
--------------------------------------------------------

  CREATE TABLE "FORM_TRANSFER" 
   (	"FORM_NO" NUMBER, 
	"APPROVAL_NO" NUMBER, 
	"EFFECTIVE_DATE" VARCHAR2(20 BYTE), 
	"USER_NAME" VARCHAR2(20 BYTE), 
	"DEPARTMENT_NAME" VARCHAR2(20 BYTE), 
	"CURRENT_POSITION" VARCHAR2(20 BYTE), 
	"PROMOTE_POSITION" VARCHAR2(20 BYTE), 
	"REMARK" VARCHAR2(200 BYTE)
   ) ;

   COMMENT ON COLUMN "FORM_TRANSFER"."FORM_NO" IS '양식번호';
   COMMENT ON COLUMN "FORM_TRANSFER"."APPROVAL_NO" IS '전자결재번호';
   COMMENT ON COLUMN "FORM_TRANSFER"."EFFECTIVE_DATE" IS '시행일자';
   COMMENT ON COLUMN "FORM_TRANSFER"."USER_NAME" IS '이름';
   COMMENT ON COLUMN "FORM_TRANSFER"."DEPARTMENT_NAME" IS '부서명';
   COMMENT ON COLUMN "FORM_TRANSFER"."CURRENT_POSITION" IS '현직급';
   COMMENT ON COLUMN "FORM_TRANSFER"."PROMOTE_POSITION" IS '승진직급';
   COMMENT ON COLUMN "FORM_TRANSFER"."REMARK" IS '비고';
--------------------------------------------------------
--  DDL for Table HOLIDAY
--------------------------------------------------------

  CREATE TABLE "HOLIDAY" 
   (	"HOLI_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"H_GIVE" NUMBER, 
	"H_DATE" VARCHAR2(30 BYTE) DEFAULT sysdate, 
	"H_CAUSE" VARCHAR2(300 BYTE), 
	"H_REMAIN" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table HOLIDAY_APPLY
--------------------------------------------------------

  CREATE TABLE "HOLIDAY_APPLY" 
   (	"HOLIDAY_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"H_TYPE" VARCHAR2(6 BYTE), 
	"H_SORT" VARCHAR2(6 BYTE), 
	"H_START" VARCHAR2(30 BYTE), 
	"H_FINISH" VARCHAR2(30 BYTE), 
	"H_DATE" VARCHAR2(30 BYTE), 
	"H_REASON" VARCHAR2(2000 BYTE), 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT '승인대기'
   ) ;

   COMMENT ON COLUMN "HOLIDAY_APPLY"."H_TYPE" IS '연차 | 반차';
   COMMENT ON COLUMN "HOLIDAY_APPLY"."H_SORT" IS '오전 | 오후';
   COMMENT ON COLUMN "HOLIDAY_APPLY"."STATUS" IS '승인|거절|승인대기';
--------------------------------------------------------
--  DDL for Table LIKEHATE
--------------------------------------------------------

  CREATE TABLE "LIKEHATE" 
   (	"BOARD_NO" NUMBER, 
	"MEM_NO" NUMBER, 
	"STATUS" VARCHAR2(1 BYTE)
   ) ;

   COMMENT ON COLUMN "LIKEHATE"."BOARD_NO" IS '게시글번호';
   COMMENT ON COLUMN "LIKEHATE"."MEM_NO" IS '회원번호';
   COMMENT ON COLUMN "LIKEHATE"."STATUS" IS '좋아요(0)/싫어요(1)';
--------------------------------------------------------
--  DDL for Table MAIL
--------------------------------------------------------

  CREATE TABLE "MAIL" 
   (	"MAIL_NO" NUMBER, 
	"SENDER" NUMBER, 
	"SENDER_MAIL" VARCHAR2(40 BYTE), 
	"RECIPIENT_MAIL" VARCHAR2(40 BYTE) DEFAULT '(받는이없음)', 
	"REF_MAIL" VARCHAR2(40 BYTE), 
	"HID_REF_MAIL" VARCHAR2(40 BYTE), 
	"MAIL_TITLE" VARCHAR2(100 BYTE) DEFAULT '(제목없음)', 
	"MAIL_CONTENT" CLOB, 
	"SENT_DATE" DATE DEFAULT SYSDATE, 
	"TEMP_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "MAIL"."RECIPIENT_MAIL" IS '이메일,이메일,이메일..';
   COMMENT ON COLUMN "MAIL"."REF_MAIL" IS '이메일,이메일,이메일..';
   COMMENT ON COLUMN "MAIL"."HID_REF_MAIL" IS '이메일,이메일,이메일..';
--------------------------------------------------------
--  DDL for Table MAIL_ATTACHMENT
--------------------------------------------------------

  CREATE TABLE "MAIL_ATTACHMENT" 
   (	"FILE_NO" NUMBER, 
	"MAIL_NO" NUMBER, 
	"ORIGIN_NAME" VARCHAR2(100 BYTE), 
	"CHANE_NAME" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MAIL_STATUS
--------------------------------------------------------

  CREATE TABLE "MAIL_STATUS" 
   (	"MAIL_NO" NUMBER, 
	"SENDER_MAIL" VARCHAR2(40 BYTE), 
	"RECIPIENT_MAIL" VARCHAR2(40 BYTE), 
	"MAIL_TYPE" NUMBER, 
	"READ_DATE" DATE, 
	"BIN_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"IMPORTANT_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"DELETE_DATE" DATE
   ) ;

   COMMENT ON COLUMN "MAIL_STATUS"."RECIPIENT_MAIL" IS '보낸메일일 경우 NULL';
   COMMENT ON COLUMN "MAIL_STATUS"."MAIL_TYPE" IS '1받은메일/2보낸메일/3참조메일/4숨은참조메일';
   COMMENT ON COLUMN "MAIL_STATUS"."READ_DATE" IS '이걸로 읽음여부는 판단가능';
   COMMENT ON COLUMN "MAIL_STATUS"."DELETE_DATE" IS '삭제예정일|스케줄링을 위해서 필요';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"USER_NO" NUMBER, 
	"USER_ID" VARCHAR2(30 BYTE), 
	"USER_PWD" VARCHAR2(100 BYTE), 
	"USER_NAME" VARCHAR2(15 BYTE), 
	"MAIL" VARCHAR2(40 BYTE), 
	"PHONE" VARCHAR2(11 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"BIRTHDAY" VARCHAR2(30 BYTE) DEFAULT (null), 
	"POSITION" NUMBER, 
	"DEPARTMENT" NUMBER, 
	"EMPLOYEE_NO" VARCHAR2(10 BYTE), 
	"PROFILE_IMG" VARCHAR2(200 BYTE), 
	"HIRE_DATE" DATE, 
	"RESIGN_DATE" DATE, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"AUTHORITY_NO" VARCHAR2(50 BYTE), 
	"MEMBER_SIGN" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"CONN_STA" VARCHAR2(1 BYTE)
   ) ;

   COMMENT ON COLUMN "MEMBER"."CONN_STA" IS '접속상태(0온라인/1오프라인/2부재중)';
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "NOTICE" 
   (	"NOTICE_NO" NUMBER, 
	"NOTICE_WRITER" NUMBER, 
	"NOTICE_TITLE" VARCHAR2(200 BYTE), 
	"NOTICE_CONTENT" CLOB, 
	"COUNT" NUMBER DEFAULT 0, 
	"CREATE_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"IMPORTANT" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '공지사항번호';
   COMMENT ON COLUMN "NOTICE"."NOTICE_WRITER" IS '작성자회원번호';
   COMMENT ON COLUMN "NOTICE"."NOTICE_TITLE" IS '공지사항제목';
   COMMENT ON COLUMN "NOTICE"."NOTICE_CONTENT" IS '공지사항내용';
   COMMENT ON COLUMN "NOTICE"."COUNT" IS '조회수';
   COMMENT ON COLUMN "NOTICE"."CREATE_DATE" IS '공지사항작성일';
   COMMENT ON COLUMN "NOTICE"."MODIFY_DATE" IS '공지사항수정일';
   COMMENT ON COLUMN "NOTICE"."STATUS" IS '공지사항등록상태';
   COMMENT ON COLUMN "NOTICE"."IMPORTANT" IS '중요공지사항여부';
--------------------------------------------------------
--  DDL for Table NOTIFICATION
--------------------------------------------------------

  CREATE TABLE "NOTIFICATION" 
   (	"NF_NO" NUMBER, 
	"SEND_NO" NUMBER, 
	"RECEIVE_NO" NUMBER, 
	"CAT_NO" NUMBER, 
	"DCAT_NO" NUMBER, 
	"NF_CONTENT" VARCHAR2(2000 BYTE), 
	"NF_DATE" DATE DEFAULT SYSDATE, 
	"CHECK_STA" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"DELETE_STA" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "NOTIFICATION"."NF_NO" IS '알림번호';
   COMMENT ON COLUMN "NOTIFICATION"."SEND_NO" IS '발신자회원번호';
   COMMENT ON COLUMN "NOTIFICATION"."RECEIVE_NO" IS '수신자회원번호(1,2,3...)';
   COMMENT ON COLUMN "NOTIFICATION"."CAT_NO" IS '카테고리번호';
   COMMENT ON COLUMN "NOTIFICATION"."DCAT_NO" IS '세부카테고리번호';
   COMMENT ON COLUMN "NOTIFICATION"."NF_CONTENT" IS '알림내용';
   COMMENT ON COLUMN "NOTIFICATION"."NF_DATE" IS '알림시간';
   COMMENT ON COLUMN "NOTIFICATION"."CHECK_STA" IS '조회여부';
   COMMENT ON COLUMN "NOTIFICATION"."DELETE_STA" IS '삭제여부';
--------------------------------------------------------
--  DDL for Table PARTICIPANT
--------------------------------------------------------

  CREATE TABLE "PARTICIPANT" 
   (	"ROOM_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"NOTREAD_CHAT" NUMBER DEFAULT 0, 
	"LASTREAD_CHAT" NUMBER DEFAULT 0, 
	"CREATE_DATE" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "PARTICIPANT"."ROOM_NO" IS '채팅방번호';
   COMMENT ON COLUMN "PARTICIPANT"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "PARTICIPANT"."NOTREAD_CHAT" IS '읽지않은채팅수';
   COMMENT ON COLUMN "PARTICIPANT"."LASTREAD_CHAT" IS '마지막으로읽은채팅번호';
   COMMENT ON COLUMN "PARTICIPANT"."CREATE_DATE" IS '생성일자';
--------------------------------------------------------
--  DDL for Table POSITION
--------------------------------------------------------

  CREATE TABLE "POSITION" 
   (	"POSITION_NO" NUMBER, 
	"POSITION_NAME" VARCHAR2(10 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PROJECT
--------------------------------------------------------

  CREATE TABLE "PROJECT" 
   (	"PROJECT_NO" NUMBER, 
	"PROJECT_MANAGER" NUMBER, 
	"PROJECT_NAME" VARCHAR2(500 BYTE), 
	"START_DATE" VARCHAR2(100 BYTE), 
	"END_DATE" VARCHAR2(100 BYTE), 
	"DETAIL" VARCHAR2(4000 BYTE), 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"MODIFY_DATE" DATE DEFAULT sysdate, 
	"DELETE_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "PROJECT"."PROJECT_NO" IS '프로젝트번호';
   COMMENT ON COLUMN "PROJECT"."PROJECT_MANAGER" IS 'PM유저번호(프로젝트생성자)';
   COMMENT ON COLUMN "PROJECT"."PROJECT_NAME" IS '프로젝트명';
   COMMENT ON COLUMN "PROJECT"."START_DATE" IS '시작일';
   COMMENT ON COLUMN "PROJECT"."END_DATE" IS '종료일';
   COMMENT ON COLUMN "PROJECT"."DETAIL" IS '프로젝트 상세내용';
   COMMENT ON COLUMN "PROJECT"."CREATE_DATE" IS '프로젝트생성일';
   COMMENT ON COLUMN "PROJECT"."MODIFY_DATE" IS '프로젝트수정일';
   COMMENT ON COLUMN "PROJECT"."DELETE_STATUS" IS '삭제여부(Y: 삭제, N: 삭제X)';
--------------------------------------------------------
--  DDL for Table P_PARTICIPANT
--------------------------------------------------------

  CREATE TABLE "P_PARTICIPANT" 
   (	"PROJECT_NO" NUMBER, 
	"TASK_NO" NUMBER, 
	"DEPARTMENT_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"PM_STATUS" VARCHAR2(1 BYTE), 
	"TASK_ASSIGN" VARCHAR2(1 BYTE)
   ) ;

   COMMENT ON COLUMN "P_PARTICIPANT"."PROJECT_NO" IS '프로젝트번호';
   COMMENT ON COLUMN "P_PARTICIPANT"."TASK_NO" IS '작업번호';
   COMMENT ON COLUMN "P_PARTICIPANT"."DEPARTMENT_NO" IS '프로젝트참여부서';
   COMMENT ON COLUMN "P_PARTICIPANT"."USER_NO" IS '작업자/참조자';
   COMMENT ON COLUMN "P_PARTICIPANT"."PM_STATUS" IS 'PM여부(Y/N)';
   COMMENT ON COLUMN "P_PARTICIPANT"."TASK_ASSIGN" IS '작업담당자여부(Y/N)';
--------------------------------------------------------
--  DDL for Table REPORT
--------------------------------------------------------

  CREATE TABLE "REPORT" 
   (	"REPORT_NO" NUMBER, 
	"REPORT_BNO" NUMBER, 
	"REPORT_MNO" NUMBER, 
	"REPORT_KIND" VARCHAR2(100 BYTE), 
	"REPORT_CONTENT" VARCHAR2(2000 BYTE), 
	"REPORT_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE, 
	"REPORT_STA" VARCHAR2(1 BYTE) DEFAULT 0, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고번호';
   COMMENT ON COLUMN "REPORT"."REPORT_BNO" IS '신고게시글번호';
   COMMENT ON COLUMN "REPORT"."REPORT_MNO" IS '신고자회원번호';
   COMMENT ON COLUMN "REPORT"."REPORT_KIND" IS '신고구분';
   COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';
   COMMENT ON COLUMN "REPORT"."REPORT_DATE" IS '신고일';
   COMMENT ON COLUMN "REPORT"."MODIFY_DATE" IS '처리일';
   COMMENT ON COLUMN "REPORT"."REPORT_STA" IS '처리상태';
   COMMENT ON COLUMN "REPORT"."STATUS" IS '등록상태';
--------------------------------------------------------
--  DDL for Table RES_CAR
--------------------------------------------------------

  CREATE TABLE "RES_CAR" 
   (	"RES_NO" NUMBER, 
	"RENTAL_DATE" VARCHAR2(100 BYTE), 
	"RENTAL_TIME" VARCHAR2(100 BYTE), 
	"RETURN_DATE" VARCHAR2(100 BYTE), 
	"RETURN_TIME" VARCHAR2(100 BYTE), 
	"USAGE" VARCHAR2(1000 BYTE), 
	"CAR_CODE" NUMBER, 
	"RES_USER" NUMBER, 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"MODIFY_DATE" DATE DEFAULT sysdate
   ) ;

   COMMENT ON COLUMN "RES_CAR"."RES_NO" IS '예약번호';
   COMMENT ON COLUMN "RES_CAR"."RENTAL_DATE" IS '대여일';
   COMMENT ON COLUMN "RES_CAR"."RENTAL_TIME" IS '대여시간';
   COMMENT ON COLUMN "RES_CAR"."RETURN_DATE" IS '반납일';
   COMMENT ON COLUMN "RES_CAR"."RETURN_TIME" IS '반납시간';
   COMMENT ON COLUMN "RES_CAR"."USAGE" IS '사용용도';
   COMMENT ON COLUMN "RES_CAR"."CAR_CODE" IS '대여차량코드';
   COMMENT ON COLUMN "RES_CAR"."RES_USER" IS '예약자번호';
   COMMENT ON COLUMN "RES_CAR"."CREATE_DATE" IS '예약생성일';
   COMMENT ON COLUMN "RES_CAR"."MODIFY_DATE" IS '예약수정일';
--------------------------------------------------------
--  DDL for Table RES_ROOM
--------------------------------------------------------

  CREATE TABLE "RES_ROOM" 
   (	"RES_NO" NUMBER, 
	"RES_DATE" VARCHAR2(100 BYTE), 
	"START_TIME" VARCHAR2(100 BYTE), 
	"END_TIME" VARCHAR2(100 BYTE), 
	"SUBJECT" VARCHAR2(1000 BYTE), 
	"ROOM_NO" NUMBER, 
	"RES_USER" NUMBER, 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"MODIFY_DATE" DATE DEFAULT sysdate
   ) ;

   COMMENT ON COLUMN "RES_ROOM"."RES_NO" IS '예약번호';
   COMMENT ON COLUMN "RES_ROOM"."RES_DATE" IS '예약날짜';
   COMMENT ON COLUMN "RES_ROOM"."START_TIME" IS '예약시작시간';
   COMMENT ON COLUMN "RES_ROOM"."END_TIME" IS '예약종료시간';
   COMMENT ON COLUMN "RES_ROOM"."SUBJECT" IS '회의명';
   COMMENT ON COLUMN "RES_ROOM"."ROOM_NO" IS '예약회의실번호';
   COMMENT ON COLUMN "RES_ROOM"."RES_USER" IS '예약자';
   COMMENT ON COLUMN "RES_ROOM"."CREATE_DATE" IS '예약생성일';
   COMMENT ON COLUMN "RES_ROOM"."MODIFY_DATE" IS '예약수정일';
--------------------------------------------------------
--  DDL for Table ROOM
--------------------------------------------------------

  CREATE TABLE "ROOM" 
   (	"ROOM_NO" NUMBER, 
	"ROOM_NAME" VARCHAR2(500 BYTE), 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"MODIFY_DATE" DATE DEFAULT sysdate, 
	"CREATE_USER" NUMBER, 
	"DELETE_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "ROOM"."ROOM_NO" IS '회의실번호';
   COMMENT ON COLUMN "ROOM"."ROOM_NAME" IS '회의실명';
   COMMENT ON COLUMN "ROOM"."CREATE_DATE" IS '등록일';
   COMMENT ON COLUMN "ROOM"."MODIFY_DATE" IS '수정일';
   COMMENT ON COLUMN "ROOM"."CREATE_USER" IS '등록유저';
   COMMENT ON COLUMN "ROOM"."DELETE_STATUS" IS '삭제여부(Y: 삭제, N: 삭제X)';
--------------------------------------------------------
--  DDL for Table R_PARTICIPANT
--------------------------------------------------------

  CREATE TABLE "R_PARTICIPANT" 
   (	"RES_NO" NUMBER, 
	"USER_NO" NUMBER
   ) ;

   COMMENT ON COLUMN "R_PARTICIPANT"."RES_NO" IS '예약번호';
--------------------------------------------------------
--  DDL for Table TASK
--------------------------------------------------------

  CREATE TABLE "TASK" 
   (	"TASK_NO" NUMBER, 
	"PROJECT_NO" NUMBER, 
	"ASSIGN_USER" NUMBER, 
	"TASK_NAME" VARCHAR2(500 BYTE), 
	"TASK_CONTENT" VARCHAR2(4000 BYTE), 
	"FILE_PATH" VARCHAR2(1000 BYTE), 
	"FILE_ORIGIN_NAME" VARCHAR2(500 BYTE), 
	"TASK_STATUS" VARCHAR2(50 BYTE), 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"MODIFY_DATE" DATE DEFAULT sysdate, 
	"DELETE_STATUS" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "TASK"."TASK_NO" IS '작업번호';
   COMMENT ON COLUMN "TASK"."PROJECT_NO" IS '프로젝트번호';
   COMMENT ON COLUMN "TASK"."ASSIGN_USER" IS '담당자(작업생성자)';
   COMMENT ON COLUMN "TASK"."TASK_NAME" IS '작업명';
   COMMENT ON COLUMN "TASK"."TASK_CONTENT" IS '작업내용';
   COMMENT ON COLUMN "TASK"."FILE_PATH" IS '첨부파일경로';
   COMMENT ON COLUMN "TASK"."FILE_ORIGIN_NAME" IS '첨부파일원본명';
   COMMENT ON COLUMN "TASK"."TASK_STATUS" IS '작업상태(1:대기, 2:진행중, 3:완료, 4:보류)';
   COMMENT ON COLUMN "TASK"."CREATE_DATE" IS '작업생성일';
   COMMENT ON COLUMN "TASK"."MODIFY_DATE" IS '작업수정일';
   COMMENT ON COLUMN "TASK"."DELETE_STATUS" IS '삭제여부(Y:삭제, N:삭제X)';
--------------------------------------------------------
--  DDL for Table WORK
--------------------------------------------------------

  CREATE TABLE "WORK" 
   (	"WORK_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"WORK_DATE" DATE, 
	"WORK_IN" DATE DEFAULT SYSDATE, 
	"WORK_OUT" DATE DEFAULT SYSDATE, 
	"WORK_TIME" VARCHAR2(30 BYTE) DEFAULT SYSDATE, 
	"STATUS" VARCHAR2(10 BYTE)
   ) ;

   COMMENT ON COLUMN "WORK"."WORK_TIME" IS '하루 몇시간';
   COMMENT ON COLUMN "WORK"."STATUS" IS '정상 | 지각 | 조퇴 | 결근 | 휴가';
REM INSERTING into ADDRESS_LIKE
SET DEFINE OFF;
Insert into ADDRESS_LIKE (USER_NO,LIKE_USER) values (4,1);
Insert into ADDRESS_LIKE (USER_NO,LIKE_USER) values (4,2);
Insert into ADDRESS_LIKE (USER_NO,LIKE_USER) values (4,3);
Insert into ADDRESS_LIKE (USER_NO,LIKE_USER) values (4,5);
REM INSERTING into APPROVAL
SET DEFINE OFF;
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (1,'PPIC-221224-00001',3,'업무기안','2023 영업년도 워크숍 시행의 건','22/12/22','22/12/24',1,1,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (2,'PPIC-230105-00003',4,'업무기안','Korea Shipping Gazette 추가구독','22/12/28','23/01/05',1,1,'승인','N');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (3,'PPIC-230104-00002',5,'인사발령품의서','인사발령','23/01/03','23/01/04',3,3,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (4,'PPIC-230123-00005',3,'인사발령품의서','인사발령 고속 승진건 포함','23/01/12','23/01/23',2,2,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (5,'PPIC-230125-00006',4,'비품신청서','LG 전자기기 신청','23/01/15','23/01/25',1,2,'반려','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (6,'PPIC-230121-00004',5,'비품신청서','샤오미 전자기기 신청','23/01/20','23/01/21',2,2,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (7,'PPIC-230211-00009',3,'지출결의서','지출결의서','23/01/21','23/02/11',2,2,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (8,'PPIC-230212-00011',4,'지출결의서','지출결의서입니다.','23/01/25','23/02/12',2,2,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (9,'PPIC-230212-00010',5,'업무기안','Cargo News 광고 연장','23/02/01','23/02/12',0,2,'반려','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (10,'PPIC-230205-00007',3,'업무기안','서비스 활성화를 위한 인력충원의 건','23/02/04','23/02/05',2,2,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (11,'PPIC-230210-00008',4,'인사발령품의서','인사발령 고속 승진건 포함','23/02/07','23/02/10',2,2,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (12,'PPIC-230214-00012',5,'인사발령품의서','인사발령 2계급 특진건 포함','23/02/10','23/02/14',3,3,'승인','N');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (13,'PPIC-230301-00014',3,'비품신청서','Apple 전자기기 신청','23/02/13','23/03/01',1,1,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (14,'PPIC-230220-00013',4,'비품신청서','samsung 전자기기 신청','23/02/17','23/02/20',0,1,'반려','N');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (15,'PPIC-230302-00015',5,'지출결의서','(지출결의서)','23/02/22','23/03/02',1,1,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (16,null,3,'지출결의서','안녕하세요. 지출결의서입니다.','23/02/26',null,1,2,'임시저장','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (17,'PPIC-230302-00036',4,'업무기안','워크숍 시행의 건','23/02/27','23/03/20',1,2,'반려','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (18,'PPIC-230320-00016',5,'인사발령품의서','인사발령 초고속 승진건 포함','23/03/01','23/03/20',2,2,'승인','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (19,null,3,'비품신청서','LG 전자기기 신청','23/03/02',null,0,3,'임시저장','Y');
Insert into APPROVAL (APPROVAL_NO,COMPLETE_NO,USER_NO,FORM,TITLE,CREATE_DATE,COMPLETE_DATE,CURRENT_ORDER,FINAL_ORDER,APPROVAL_STATUS,STATUS) values (20,null,4,'지출결의서','(지출결의서) 지출결의서입니다.','23/03/05',null,2,3,'진행중','N');
REM INSERTING into APP_CHANGE
SET DEFINE OFF;
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (1,1,3,'님이 글을 작성했어요.','22/12/22','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (2,1,2,'님이 승인했어요.','22/12/24','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (3,1,4,'완벽한 기안이네요? 작성법 저도 한수 배워갑니다..','22/12/26','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (4,2,4,'님이 글을 작성했어요.','22/12/28','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (5,3,5,'님이 글을 작성했어요.','23/01/03','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (6,3,4,'님이 승인했어요.','23/01/03','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (7,3,3,'님이 승인했어요.','23/01/04','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (8,3,1,'님이 승인했어요.','23/01/04','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (9,2,3,'님이 승인했어요.','23/01/05','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (10,2,2,'놀라워요~','23/01/05','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (11,4,3,'님이 글을 작성했어요.','23/01/12','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (12,4,2,'님이 승인했어요.','23/01/15','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (13,5,4,'님이 글을 작성했어요.','23/01/15','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (14,6,5,'님이 글을 작성했어요.','23/01/20','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (15,6,3,'님이 승인했어요.','23/01/21','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (16,6,2,'님이 승인했어요.','23/01/21','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (17,6,3,'믿고 승인합니다.','23/01/21','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (18,7,3,'님이 글을 작성했어요.','23/01/21','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (19,7,2,'님이 승인했어요.','23/01/22','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (20,6,1,'역시!','23/01/22','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (21,4,1,'님이 승인했어요.','23/01/23','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (22,5,3,'님이 승인했어요.','23/01/23','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (23,4,3,'wow!','23/01/24','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (24,5,2,'님이 <span style="color:red;">반려</span>했어요.','23/01/25','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (25,8,4,'님이 글을 작성했어요.','23/01/25','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (26,8,3,'님이 승인했어요.','23/01/27','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (27,9,5,'님이 글을 작성했어요.','23/02/01','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (28,10,3,'님이 글을 작성했어요.','23/02/04','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (29,10,2,'님이 승인했어요.','23/02/04','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (30,10,1,'님이 승인했어요.','23/02/05','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (31,10,3,'이 기안이 통과하다니…!','23/02/06','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (32,11,4,'님이 글을 작성했어요.','23/02/07','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (33,11,5,'님이 승인했어요.','23/02/08','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (34,11,2,'님이 승인했어요.','23/02/10','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (35,12,5,'님이 글을 작성했어요.','23/02/10','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (36,12,4,'님이 승인했어요.','23/02/11','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (37,12,2,'님이 승인했어요.','23/02/11','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (38,7,1,'님이 승인했어요.','23/02/11','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (39,8,1,'님이 승인했어요.','23/02/12','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (40,9,4,'님이 <span style="color:red;">반려</span>했어요.','23/02/12','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (41,9,4,'반려된 이유, 본인이 더 잘 아시겠죠?','23/02/12','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (42,12,2,'멋지십니다!','23/02/12','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (43,9,5,'어우..','23/02/13','댓글','N');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (44,13,3,'님이 글을 작성했어요.','23/02/13','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (45,12,1,'님이 승인했어요.','23/02/14','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (46,14,4,'님이 글을 작성했어요.','23/02/17','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (47,14,2,'님이 <span style="color:red;">반려</span>했어요.','23/02/20','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (48,15,5,'님이 글을 작성했어요.','23/02/22','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (49,17,4,'님이 글을 작성했어요.','23/02/27','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (50,17,3,'승인받고싶다면 왼손을 들어주세요','23/02/27','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (51,13,1,'님이 승인했어요.','23/03/01','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (52,18,5,'님이 글을 작성했어요.','23/03/01','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (53,18,4,'님이 승인했어요.','23/03/01','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (54,15,4,'님이 승인했어요.','23/03/02','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (55,20,4,'님이 글을 작성했어요.','23/03/05','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (56,20,5,'님이 승인했어요.','23/03/06','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (57,20,2,'님이 승인했어요.','23/03/06','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (58,20,4,'이제 마지막 한분 남았네요!','23/03/06','댓글','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (60,18,1,'님이 승인했어요.','23/03/20','변경','Y');
Insert into APP_CHANGE (CHANGE_NO,APPROVAL_NO,USER_NO,CONTENT,CREATE_DATE,ROLE,STATUS) values (80,17,2,'님이 <span style=''color:red;''>반려</span>했어요.','23/03/20','변경','Y');
REM INSERTING into APP_PROCESS
SET DEFINE OFF;
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (1,1,0,'참조',null,'22/12/22','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (1,3,0,'결재','승인','22/12/22','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (1,2,1,'결재','승인','22/12/24','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (2,2,0,'참조',null,'22/12/28','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (2,4,0,'결재','승인','22/12/28','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (2,3,1,'결재','승인','23/01/05','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (3,5,0,'결재','승인','23/01/03','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (3,4,1,'결재','승인','23/01/03','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (3,3,2,'결재','승인','23/01/04','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (3,1,3,'결재','승인','23/01/04','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (4,5,0,'참조',null,'23/01/12','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (4,3,0,'결재','승인','23/01/12','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (4,2,1,'결재','승인','23/01/15','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (4,1,2,'결재','승인','23/01/23','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (5,4,0,'결재','승인','23/01/15','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (5,3,1,'결재','승인','23/01/23','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (5,2,2,'결재','반려','23/01/25','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (6,2,0,'참조',null,'23/01/20','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (6,4,0,'참조',null,'23/01/20','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (6,5,0,'결재','승인','23/01/20','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (6,3,1,'결재','승인','23/01/21','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (6,1,2,'결재','승인','23/01/21','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (7,3,0,'결재','승인','23/01/21','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (7,2,1,'결재','승인','23/01/22','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (7,1,2,'결재','승인','23/02/11','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (8,4,0,'결재','승인','23/01/25','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (8,3,1,'결재','승인','23/01/27','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (8,1,2,'결재','승인','23/02/12','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (9,3,0,'참조',null,'23/02/01','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (9,5,0,'결재','승인','23/02/01','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (9,4,1,'결재','반려','23/02/12','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (9,2,2,'결재',null,null,'N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (10,4,0,'참조',null,'23/02/04','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (10,3,0,'결재','승인','23/02/04','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (10,2,1,'결재','승인','23/02/04','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (10,1,2,'결재','승인','23/02/05','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (11,4,0,'결재','승인','23/02/07','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (11,5,1,'결재','승인','23/02/08','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (11,2,2,'결재','승인','23/02/10','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (12,3,0,'참조',null,'23/02/10','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (12,5,0,'결재','승인','23/02/10','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (12,4,1,'결재','승인','23/02/11','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (12,2,2,'결재','승인','23/02/11','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (12,1,3,'결재','승인','23/02/14','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (13,3,0,'결재','승인','23/02/13','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (13,1,1,'결재','승인','23/03/01','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (14,4,0,'결재','승인','23/02/17','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (14,2,1,'결재','반려','23/02/20','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (15,5,0,'결재','승인','23/02/22','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (15,4,1,'결재','승인','23/03/02','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (16,2,0,'참조',null,'23/02/26','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (16,3,0,'결재','승인','23/02/26','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (16,4,1,'결재',null,null,'N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (16,1,2,'결재',null,null,'N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (17,5,0,'참조',null,'23/02/27','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (17,4,0,'결재','승인','23/02/27','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (17,3,1,'결재','승인','23/03/20','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (17,2,2,'결재','반려','23/03/20','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (18,5,0,'결재','승인','23/03/01','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (18,4,1,'결재','승인','23/03/01','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (18,1,2,'결재','승인','23/03/20','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (19,5,0,'참조',null,'23/03/02','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (19,3,0,'결재','승인','23/03/02','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (19,4,1,'결재',null,null,'N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (19,2,2,'결재',null,null,'N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (19,1,3,'결재',null,null,'N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (20,3,0,'참조',null,'23/03/05','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (20,4,0,'결재','승인','23/03/05','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (20,5,1,'결재','승인','23/03/06','N');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (20,2,2,'결재','승인','23/03/06','Y');
Insert into APP_PROCESS (APPROVAL_NO,USER_NO,PROCESS_ORDER,APPROVAL_ROLE,STATUS,APPROVAL_DATE,BOOKMARK) values (20,1,3,'결재',null,null,'N');
REM INSERTING into ATTACHMENT
SET DEFINE OFF;
Insert into ATTACHMENT (ATTACHMENT_NO,ORIGIN_NAME,CHANGE_NAME,CATEGORY_NO,REF_NO) values (32,'04_Mybatis-페이징처리.pdf','resources/uploadFiles/noticeFile/2023031315170123494.pdf',2,27);
Insert into ATTACHMENT (ATTACHMENT_NO,ORIGIN_NAME,CHANGE_NAME,CATEGORY_NO,REF_NO) values (33,'Sample Table Script.sql','resources/uploadFiles/noticeFile/2023031315170131682.sql',2,27);
Insert into ATTACHMENT (ATTACHMENT_NO,ORIGIN_NAME,CHANGE_NAME,CATEGORY_NO,REF_NO) values (35,'03_Mybatis-동적쿼리.pdf','resources/uploadFiles/noticeFile/2023031315183139322.pdf',2,22);
Insert into ATTACHMENT (ATTACHMENT_NO,ORIGIN_NAME,CHANGE_NAME,CATEGORY_NO,REF_NO) values (34,'04_Mybatis-페이징처리.pdf','resources/uploadFiles/noticeFile/2023031315172565371.pdf',2,20);
Insert into ATTACHMENT (ATTACHMENT_NO,ORIGIN_NAME,CHANGE_NAME,CATEGORY_NO,REF_NO) values (37,'Sample Table Script.sql','resources/uploadFiles/noticeFile/2023031315224725432.sql',2,21);
REM INSERTING into AUTHORITY
SET DEFINE OFF;
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (0,'모두');
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (1,'메일');
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (2,'근무');
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (3,'회사소식');
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (4,'구성원');
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (5,'전자결재');
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (6,'문서');
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (7,'예약');
Insert into AUTHORITY (AUTHORITY_NO,AUTHORITY_NAME) values (8,'업무');
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (1,10,'새해복많이받으세용~','새해복많이받으세요 뿌잉!!!!!!!!',114,to_date('23/01/01','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (2,11,'익명게시판제목2','익명게시판내용2',2,to_date('23/01/02','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (3,12,'익명게시판제목3','익명게시판내용3',0,to_date('23/01/03','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (4,13,'익명게시판제목4','익명게시판내용4',0,to_date('23/01/04','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (5,14,'익명게시판제목5','익명게시판내용5',0,to_date('23/01/05','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (6,15,'익명게시판제목6','익명게시판내용6',0,to_date('23/01/06','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (7,16,'익명게시판제목7','익명게시판내용7',0,to_date('23/01/07','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (8,17,'익명게시판제목8','익명게시판내용8',0,to_date('23/01/08','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (9,18,'익명게시판제목9','익명게시판내용9',0,to_date('23/01/09','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (10,19,'익명게시판제목10','익명게시판내용10',0,to_date('23/01/10','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (11,20,'익명게시판제목11','익명게시판내용11',0,to_date('23/01/11','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (12,21,'익명게시판제목12','익명게시판내용12',0,to_date('23/01/12','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (13,22,'익명게시판제목13','익명게시판내용13',0,to_date('23/01/13','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (14,23,'익명게시판제목14','익명게시판내용14',0,to_date('23/01/14','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (15,24,'익명게시판제목15','익명게시판내용15',0,to_date('23/01/15','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (16,25,'익명게시판제목16','익명게시판내용16',0,to_date('23/01/16','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (17,26,'익명게시판제목17','익명게시판내용17',0,to_date('23/01/17','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (18,27,'익명게시판제목18','익명게시판내용18',0,to_date('23/01/18','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (19,28,'익명게시판제목19','익명게시판내용19',0,to_date('23/01/19','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (20,29,'익명게시판제목20','익명게시판내용20',0,to_date('23/01/20','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (21,30,'익명게시판제목21','익명게시판내용21',11,to_date('23/01/21','RR/MM/DD'),null,'Y','Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (22,31,'익명게시판제목22','익명게시판내용22',0,to_date('23/01/22','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (23,32,'익명게시판제목23','익명게시판내용23',1,to_date('23/01/23','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (24,33,'익명게시판제목24','익명게시판내용24',1,to_date('23/01/24','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (25,34,'익명게시판제목25','익명게시판내용25',1,to_date('23/01/25','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (26,35,'익명게시판제목26','익명게시판내용26',2,to_date('23/01/26','RR/MM/DD'),null,'Y','Y');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (27,36,'익명게시판제목27','익명게시판내용27',2,to_date('23/01/27','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (28,37,'익명게시판제목28','익명게시판내용28',5,to_date('23/01/28','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (29,38,'익명게시판제목29','익명게시판내용29',15,to_date('23/01/29','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (30,39,'벌써 1월 끝 실화냐','누가 내 시간 도려갔냐~~!!',92,to_date('23/01/30','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (33,11,'아하하하','히히히히',14,to_date('23/03/13','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (34,5,'dfdf','dfdf',0,to_date('23/03/16','RR/MM/DD'),null,'Y','N');
Insert into BOARD (BOARD_NO,BOARD_WRITER,BOARD_TITLE,BOARD_CONTENT,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,BLIND_STA) values (35,4,'화면구현좀 대신 해주십쇼','예?',3,to_date('23/03/17','RR/MM/DD'),null,'Y','N');
REM INSERTING into CAR
SET DEFINE OFF;
REM INSERTING into CHAT
SET DEFINE OFF;
Insert into CHAT (CHAT_NO,ROOM_NO,SEND_NO,CHAT_CONTENT,SEND_DATE,NOT_READ) values (69,58,5,'힘내용 ㅎㅎ',to_date('23/03/21','RR/MM/DD'),1);
Insert into CHAT (CHAT_NO,ROOM_NO,SEND_NO,CHAT_CONTENT,SEND_DATE,NOT_READ) values (70,59,5,'화이팅',to_date('23/03/21','RR/MM/DD'),1);
Insert into CHAT (CHAT_NO,ROOM_NO,SEND_NO,CHAT_CONTENT,SEND_DATE,NOT_READ) values (71,60,5,'아자아자',to_date('23/03/21','RR/MM/DD'),1);
Insert into CHAT (CHAT_NO,ROOM_NO,SEND_NO,CHAT_CONTENT,SEND_DATE,NOT_READ) values (72,61,5,'팟팅이에욧!',to_date('23/03/21','RR/MM/DD'),1);
Insert into CHAT (CHAT_NO,ROOM_NO,SEND_NO,CHAT_CONTENT,SEND_DATE,NOT_READ) values (73,62,5,'아자아자',to_date('23/03/21','RR/MM/DD'),4);
Insert into CHAT (CHAT_NO,ROOM_NO,SEND_NO,CHAT_CONTENT,SEND_DATE,NOT_READ) values (68,58,5,'채팅!',to_date('23/03/21','RR/MM/DD'),0);
Insert into CHAT (CHAT_NO,ROOM_NO,SEND_NO,CHAT_CONTENT,SEND_DATE,NOT_READ) values (74,62,5,'우리팀',to_date('23/03/21','RR/MM/DD'),4);
Insert into CHAT (CHAT_NO,ROOM_NO,SEND_NO,CHAT_CONTENT,SEND_DATE,NOT_READ) values (75,62,5,'홧팅이닷!',to_date('23/03/21','RR/MM/DD'),4);
REM INSERTING into CHATROOM
SET DEFINE OFF;
Insert into CHATROOM (ROOM_NO,ROOM_NAME,LAST_CHAT,CREATE_DATE,MODIFY_DATE,GROUP_COUNT) values (59,null,'70',to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),2);
Insert into CHATROOM (ROOM_NO,ROOM_NAME,LAST_CHAT,CREATE_DATE,MODIFY_DATE,GROUP_COUNT) values (58,null,'69',to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),2);
Insert into CHATROOM (ROOM_NO,ROOM_NAME,LAST_CHAT,CREATE_DATE,MODIFY_DATE,GROUP_COUNT) values (60,null,'71',to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),2);
Insert into CHATROOM (ROOM_NO,ROOM_NAME,LAST_CHAT,CREATE_DATE,MODIFY_DATE,GROUP_COUNT) values (61,null,'72',to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),2);
Insert into CHATROOM (ROOM_NO,ROOM_NAME,LAST_CHAT,CREATE_DATE,MODIFY_DATE,GROUP_COUNT) values (62,'파이널🍒🍒','75',to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),5);
REM INSERTING into CHAT_LIKE
SET DEFINE OFF;
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (40,43,to_date('23/03/15','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (40,3,to_date('23/03/14','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (40,5,to_date('23/03/15','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (40,1,to_date('23/03/15','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (1,2,to_date('23/03/21','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (40,39,to_date('23/03/15','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (5,4,to_date('23/03/17','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (4,5,to_date('23/03/21','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (5,1,to_date('23/03/21','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (5,3,to_date('23/03/21','RR/MM/DD'));
Insert into CHAT_LIKE (MYUSER_NO,LIKEUSER_NO,LIKE_DATE) values (5,2,to_date('23/03/21','RR/MM/DD'));
REM INSERTING into COMPANY_SCH
SET DEFINE OFF;
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (23,'0','0','아묻따휴일',null,null,'0','2023-03-16','2023-03-24','Y',null,null,'N',null);
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (24,'1',null,'울랄라','내방으로.','내방',null,'2023-04-05','2023-03-24','N','15:47','17:47','N',null);
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (1,'0','0','1월 1일',null,null,'0','2023-01-01',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (2,'0','0','설날',null,null,'0','2022-12-30','2023-01-02','Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (3,'0','0','3.1절',null,null,'0','2023-03-01',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (4,'0','0','근로자의 날',null,null,'0','2023-05-01',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (5,'0','0','어린이날',null,null,'0','2023-05-05',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (6,'0','0','부처님 오신 날',null,null,'1','2023-04-08',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (7,'0','0','현충일',null,null,'0','2023-06-06',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (8,'0','0','광복절',null,null,'0','2023-08-15',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (9,'0','0','추석',null,null,'1','2023-08-14','2023-08-16','Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (10,'0','0','개천절',null,null,'0','2023-10-03',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (11,'0','0','한글날',null,null,'0','2023-10-09',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (12,'0','0','크리스마스',null,null,'0','2023-12-25',null,'Y',null,null,'N','Y');
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (13,'1',null,'사내 마라톤 대회','회사 창립 1주년을 기념하고 새로운 도약을 위한 사내 마라톤 대회','반포한강공원',null,'2023-03-25','2023-03-25','N','10:00','15:00','N',null);
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (14,'1',null,'IT 심포지엄','유비쿼터스 시대를 위한 IT 기술의 미래','대강당',null,'2023-03-26','2023-03-27','N','15:00','18:00','N',null);
Insert into COMPANY_SCH (SCH_NO,SCH_KIND,RESTDAY_KIND,SCH_NAME,SCH_CONTENT,SCH_LOCATION,LUNAR_SOLAR,START_DATE,END_DATE,ANNUAL,START_TIME,END_TIME,ALLDAY,LEGALHOLIDAY) values (20,'1',null,'저쩌구 행사','회의실로 오삼','회의실',null,'2023-03-30','2023-03-30','N',null,null,'Y',null);
REM INSERTING into DEPT
SET DEFINE OFF;
Insert into DEPT (DEPARTMENT_NO,DEPARTMENT_NAME) values (1,'미지정');
Insert into DEPT (DEPARTMENT_NO,DEPARTMENT_NAME) values (2,'총무');
Insert into DEPT (DEPARTMENT_NO,DEPARTMENT_NAME) values (3,'인사');
Insert into DEPT (DEPARTMENT_NO,DEPARTMENT_NAME) values (4,'기획');
Insert into DEPT (DEPARTMENT_NO,DEPARTMENT_NAME) values (5,'영업');
Insert into DEPT (DEPARTMENT_NO,DEPARTMENT_NAME) values (6,'회계');
Insert into DEPT (DEPARTMENT_NO,DEPARTMENT_NAME) values (7,'마케팅');
Insert into DEPT (DEPARTMENT_NO,DEPARTMENT_NAME) values (8,'개발');
REM INSERTING into DOCUMENT
SET DEFINE OFF;
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (4,1,'호호문서','resources/uploadFiles/commonDocs/2023031201165672198.jpg','a1bb3614a2769e5a095a1b201323ebf5.jpg',1,to_date('23/03/09','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'N');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (5,1,'gg','resources/uploadFiles/commonDocs/2023031201172642396.jpg','b9b5fa5eae8329c5eae0521ed83d23aa.jpg',1,to_date('23/03/10','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'N');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (6,1,'휴..','resources/uploadFiles/commonDocs/2023031016022172986.png','스크린샷 2023-03-03 165350.png',1,to_date('23/03/10','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'Y');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (7,1,'왜그러는겨','resources/uploadFiles/commonDocs/2023031201054572272.jpg','도대체.jpg',1,to_date('23/03/10','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'Y');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (8,1,'슬프다','resources/uploadFiles/commonDocs/2023031016043246592.png','스크린샷 2023-03-03 165517.png',1,to_date('23/03/10','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'Y');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (9,1,'우수사원표창장','resources/uploadFiles/commonDocs/2023031201190325582.jpg','0e2fb4aa286044b767b03a2f86506868 (1).jpg',1,to_date('23/03/12','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'Y');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (10,2,'연봉백억','resources/uploadFiles/myDocs/2023031203212581597.jpg','도대체.jpg',1,to_date('23/03/12','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'N');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (11,2,'나는야우수사원','resources/uploadFiles/myDocs/2023031203244373526.jpg','0e2fb4aa286044b767b03a2f86506868 (1) (2).jpg',1,to_date('23/03/12','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'N');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (12,2,'zzz','resources/uploadFiles/myDocs/2023031220353293487.jpg','도대체 (4).jpg',1,to_date('23/03/12','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'Y');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (13,2,'허허','resources/uploadFiles/myDocs/2023031220392294975.jpg','images.jpg',1,to_date('23/03/12','RR/MM/DD'),to_date('23/03/12','RR/MM/DD'),'N');
Insert into DOCUMENT (DOC_NO,DOC_TYPE,DOC_NAME,SAVE_PATH,ORIGIN_NAME,CREATE_USER,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (14,2,'경력ㅎㅎ','resources/uploadFiles/myDocs/2023031516243281614.pdf','경력증명서 (6).pdf',1,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'N');
REM INSERTING into FORM_CASH
SET DEFINE OFF;
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (52,7,'알라딘','도서 "Do it! 리액트 모던 웹 개발 with 타입스크립트" 구매',36000,0);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (53,7,'andar','릴렉스 마사지 싱글볼',5310,590);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (54,7,'쿠팡','TWG 잉글리시 블랙퍼스트 홍차 티백',45540,5060);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (55,7,'쿠팡','피스코리아 평화 스테플러 침 1000p',14580,1620);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (56,8,'알라딘','실용 SQL',27000,0);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (57,8,'오피스디포','복사용지A4(80g/Paperone All Purpose/APRIL/500매*5권/박스)',27900,3100);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (58,8,'andar','릴렉스 요가링',9810,1090);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (59,8,'쿠팡','쓰리엠 스카치 초강력 다용도 테이프 18mmx20m 디스펜서 2개 리필4롤',15210,1690);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (60,8,'쿠팡','TWG 잉글리시 블랙퍼스트 홍차 티백',45540,5060);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (61,15,'알라딘','클린 코드 Clean Code',29700,0);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (62,15,'쿠팡','TWG 잉글리시 블랙퍼스트 홍차 티백',45540,5060);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (63,15,'쿠팡','피스코리아 평화 스테플러 침 1000p',14580,1620);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (64,15,'andar','릴렉스 마사지 스틱',8910,990);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (65,15,'오피스디포','복사용지A4(80g/Paperone All Purpose/APRIL/500매*5권/박스)',27900,3100);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (66,16,'알라딘','이펙티브 자바',32400,0);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (67,16,'쿠팡','쓰리엠 스카치 초강력 다용도 테이프 18mmx20m 디스펜서 2개 리필4롤',15210,1690);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (68,16,'쿠팡','TWG 잉글리시 블랙퍼스트 홍차 티백',45540,5060);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (69,16,'쿠팡','피스코리아 평화 스테플러 침 1000p',14580,1620);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (70,16,'andar','릴렉스 마사지 듀얼볼',8910,990);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (71,16,'오피스디포','복사용지A4(80g/Paperone All Purpose/APRIL/500매*5권/박스)',27900,3100);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (72,20,'알라딘','챗 GPT',11700,0);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (73,20,'쿠팡','쓰리엠 스카치 초강력 다용도 테이프 18mmx20m 디스펜서 2개 리필4롤',15210,1690);
Insert into FORM_CASH (FORM_NO,APPROVAL_NO,ACCOUNT,USER_HISTORY,PRICE,VAT) values (74,20,'쿠팡','TWG 잉글리시 블랙퍼스트 홍차 티백',45540,5060);
REM INSERTING into FORM_CONSUME
SET DEFINE OFF;
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (29,5,'LG 그램 40.6cm','사무용','1',2,2440000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (30,5,'LG 울트라와이드 모니터','사무용','1',1,259000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (31,5,'LG 디오스 오브제컬렉션 전자레인지','사무용','1',2,208000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (32,5,'LG 퓨리케어 정수기(스윙, 냉온정)','사무용','1',1,777000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (33,5,'LG 스타일러','사무용','1',1,1430000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (34,6,'샤오미 레드미 패드 22081283G','개인용','1',1,338000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (35,6,'샤오미 스마트 가습기 2 화이트','부서용','1',1,64800);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (36,6,'샤오미 무선 실외 보안 카메라','도난방지용','1',3,88800);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (37,6,'샤오미 미밴드7 블랙 스마트밴드','개인업무','1',1,61800);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (38,13,'MacBook Pro 14 (스페이스 그레이)','사무업무','1',1,2790000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (39,13,'AirPods Max (스페이스 그레이)','사무업무','1',1,769000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (40,13,'Apple Watch Series 8 (미드나이트)','사무업무','1',1,599000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (41,13,'Magic Mouse - 블랙 Multi-Touch 표면','사무업무','1',1,119000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (42,13,'USB-C Digital AV Multiport 어댑터','사무업무','1',1,79000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (43,14,'The Freestyle + 스마트 모니터 68.6 cm','개인용','1',1,880000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (44,14,'BESPOKE 정수기','개인용','1',1,900000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (45,14,'25 W PD 충전기 (USB C to C 케이블 포함)','개인용','1',1,29100);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (46,14,'갤럭시 탭 S7 FE (Wi-Fi)','개인용','1',1,669200);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (47,14,'갤럭시 북3 360 CPU i5','개인용','1',1,2200000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (48,19,'LG 톤플러스','사내 행사상품','1',4,119000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (49,19,'LG 일반 LED TV (스탠드형)','사내 행사상품','1',2,540000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (50,19,'LG 시네빔 Laser','사내 행사상품','1',1,1850000);
Insert into FORM_CONSUME (FORM_NO,APPROVAL_NO,NAME,REASON,UNIT,COUNT,PRICE) values (51,19,'LG 울트라 탭','사내 행사상품','1',3,479000);
REM INSERTING into FORM_DRAFT
SET DEFINE OFF;
Insert into FORM_DRAFT (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,DEPARTMENT_NO) values (1,1,'23/01/01',1);
Insert into FORM_DRAFT (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,DEPARTMENT_NO) values (2,2,'23/02/01',2);
Insert into FORM_DRAFT (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,DEPARTMENT_NO) values (3,9,'23/02/15',3);
Insert into FORM_DRAFT (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,DEPARTMENT_NO) values (4,10,'23/02/10',4);
Insert into FORM_DRAFT (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,DEPARTMENT_NO) values (5,17,'23/04/01',5);
REM INSERTING into FORM_TRANSFER
SET DEFINE OFF;
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (6,3,'23/01/15','주강민','총무','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (7,3,'23/01/15','김경민','인사','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (8,3,'23/01/15','최경희','기획','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (9,3,'23/01/15','홍경희','영업','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (10,4,'23/02/01','신광현','회계','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (11,4,'23/02/01','박규인','마케팅','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (12,4,'23/02/01','김하니','개발','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (13,4,'23/02/01','주강민','총무','대리','과장','고속 승진');
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (14,4,'23/02/01','박경원','인사','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (15,11,'23/02/15','이경환','기획','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (16,11,'23/02/15','김계한','영업','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (17,11,'23/02/15','염광훈','회계','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (18,11,'23/02/15','박권석','마케팅','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (19,11,'23/02/15','김하니','개발','대리','과장','고속 승진');
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (20,12,'23/02/15','손건영','총무','사원','과장','2계급 특진');
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (21,12,'23/02/15','김경륜','인사','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (22,12,'23/02/15','정경환','기획','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (23,12,'23/02/15','홍경희','영업','대리','과장',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (24,12,'23/02/15','이권민','마케팅','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (25,18,'23/04/01','김하니','개발','과장','차장','초고속 승진');
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (26,18,'23/04/01','송근우','개발','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (27,18,'23/04/01','송근순','개발','사원','대리',null);
Insert into FORM_TRANSFER (FORM_NO,APPROVAL_NO,EFFECTIVE_DATE,USER_NAME,DEPARTMENT_NAME,CURRENT_POSITION,PROMOTE_POSITION,REMARK) values (28,18,'23/04/01','오근우','개발','사원','대리',null);
REM INSERTING into HOLIDAY
SET DEFINE OFF;
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (47,3,3,'23/03/22','추가지급',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (48,3,-1,'23/03/22','연차사용',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (49,3,null,'23/03/22','승인거절',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (52,3,-1,'23/03/22','연차사용',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (53,3,null,'23/03/22','승인거절',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (54,3,-1,'23/03/22','승인거절',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (55,3,-1,'23/03/22','연차사용',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (56,3,null,'23/03/22','연차사용',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (57,5,null,'23/03/22','연차사용',null);
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (2,1,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (3,2,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (4,3,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (5,4,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (6,5,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (7,6,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (8,7,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (9,8,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (10,9,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (11,10,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (12,11,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (13,12,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (14,13,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (15,14,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (16,15,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (17,16,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (18,17,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (19,18,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (20,19,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (21,20,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (22,21,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (23,22,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (24,23,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (25,24,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (26,25,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (27,26,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (28,27,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (29,28,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (30,29,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (31,30,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (32,31,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (33,32,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (34,33,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (35,34,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (36,35,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (37,36,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (38,37,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (39,38,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (40,39,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (41,40,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (42,43,13,'2023/01/01','연차지급','13');
Insert into HOLIDAY (HOLI_NO,USER_NO,H_GIVE,H_DATE,H_CAUSE,H_REMAIN) values (43,44,13,'2023/01/01','연차지급','13');
REM INSERTING into HOLIDAY_APPLY
SET DEFINE OFF;
Insert into HOLIDAY_APPLY (HOLIDAY_NO,USER_NO,H_TYPE,H_SORT,H_START,H_FINISH,H_DATE,H_REASON,STATUS) values (26,3,'연차',null,'2023-03-29','2023-03-29','1','연차신청','거절');
Insert into HOLIDAY_APPLY (HOLIDAY_NO,USER_NO,H_TYPE,H_SORT,H_START,H_FINISH,H_DATE,H_REASON,STATUS) values (29,3,'연차',null,'2023-03-30','2023-03-30','1','eeee','거절');
Insert into HOLIDAY_APPLY (HOLIDAY_NO,USER_NO,H_TYPE,H_SORT,H_START,H_FINISH,H_DATE,H_REASON,STATUS) values (28,3,'연차',null,'2023-03-29','2023-03-29','1','5','승인');
Insert into HOLIDAY_APPLY (HOLIDAY_NO,USER_NO,H_TYPE,H_SORT,H_START,H_FINISH,H_DATE,H_REASON,STATUS) values (30,3,'연차',null,'2023-03-24','2023-03-24','1','s','거절');
Insert into HOLIDAY_APPLY (HOLIDAY_NO,USER_NO,H_TYPE,H_SORT,H_START,H_FINISH,H_DATE,H_REASON,STATUS) values (31,3,'연차',null,'2023-03-23','2023-03-23','1','55','승인');
Insert into HOLIDAY_APPLY (HOLIDAY_NO,USER_NO,H_TYPE,H_SORT,H_START,H_FINISH,H_DATE,H_REASON,STATUS) values (32,5,'연차',null,'2023-03-22','2023-03-23','1','아파','승인');
Insert into HOLIDAY_APPLY (HOLIDAY_NO,USER_NO,H_TYPE,H_SORT,H_START,H_FINISH,H_DATE,H_REASON,STATUS) values (25,3,'연차',null,'2023-03-28','2023-03-28','1','연차신청','승인');
REM INSERTING into LIKEHATE
SET DEFINE OFF;
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (30,11,'1');
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (30,40,'0');
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (30,2,'0');
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (35,4,'0');
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (21,11,'0');
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (1,4,'0');
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (30,4,'1');
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (28,1,'1');
Insert into LIKEHATE (BOARD_NO,MEM_NO,STATUS) values (35,1,'0');
REM INSERTING into MAIL
SET DEFINE OFF;
REM INSERTING into MAIL_ATTACHMENT
SET DEFINE OFF;
REM INSERTING into MAIL_STATUS
SET DEFINE OFF;
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (1,'user01','$2a$10$JYUf9bQIwbyeSScRo6d7OOIuCIjX2wIlzZhFTyLvL/jOAoQyKlpje','구선화','user01@ppic.kr','01099999999','서울시 종로구 계동 109-20','1983.01.28',1,2,'2000','resources/profile_images/2023032022520661520.jpg',to_date('20/11/11','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (2,'user02','$2a$10$ewT6.lyLhhfJctQZeB7GZuu.F0EELTeF48D.aijx2lrelOVFJVxTq','문승하','user02@ppic.kr',null,null,'1983.01.28',2,3,'2001',null,to_date('20/12/25','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (3,'user03','$2a$10$OsVxLlcuJ6EsYf3McMX1e.nZ2.QpmA1XUDC5xZgoRM1OttEGg0Bxu','박은지','user03@ppic.kr','01011112226',null,'1983.01.28',3,4,'2002','resources/profile_images/2023031415242365154.png',to_date('21/05/05','RR/MM/DD'),null,'Y','2','Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (4,'user04','$2a$10$ynUWdlGdcGRftkAwifV0oudewCZ5o57TPMwTuUXWtxEyCOkVfs7fG','신하영','user04@ppic.kr','01043775019',null,'1983.01.28',4,5,'2003','resources/profile_images/2023031516541159107.jpg',to_date('22/03/01','RR/MM/DD'),null,'Y','0','Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (5,'user05','$2a$10$3mGaKcVAZ2RsfXaaLkLppeSC73b9yXj7qmji6Mxs.a6g0sCb4kdQC','윤예서','user05@ppic.kr',null,null,'1983.01.28',6,6,'2004',null,to_date('23/01/01','RR/MM/DD'),null,'Y','2,3,5','Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (6,'user06','pass06','남가영','user06@ppic.kr',null,null,'1983.01.28',7,8,null,null,to_date('22/05/01','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (7,'user07','pass07','주강민','user07@ppic.kr',null,null,'1983.01.28',7,8,null,null,to_date('22/05/02','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (8,'user08','pass08','손건영','user08@ppic.kr',null,null,'1983.01.28',7,8,null,null,to_date('22/05/03','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (9,'user09','pass09','박건우','user09@ppic.kr',null,null,'1983.01.28',7,8,null,null,to_date('22/05/04','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (10,'user10','pass10','김민지','user10@ppic.kr',null,null,'1983.01.28',7,8,null,null,to_date('22/05/05','RR/MM/DD'),null,'Y',null,'Y','2');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (11,'user11','pass11','김경륜','user11@ppic.kr',null,null,'1983.01.28',7,2,null,null,to_date('22/05/06','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (12,'user12','pass12','김경민','user12@ppic.kr',null,null,'1983.01.28',7,2,null,null,to_date('22/05/07','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (13,'user13','pass13','박경애','user13@ppic.kr',null,null,'1983.01.28',7,2,null,null,to_date('22/05/08','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (14,'user14','pass14','박경원','user14@ppic.kr',null,null,'1983.01.28',7,2,null,null,to_date('22/05/09','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (15,'user15','pass15','이경택','user15@ppic.kr',null,null,'1983.01.28',7,2,null,null,to_date('22/05/10','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (16,'user16','pass16','이경호','user16@ppic.kr',null,null,'1983.01.28',7,3,null,null,to_date('22/05/11','RR/MM/DD'),null,'Y',null,'Y','2');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (17,'user17','pass17','이경환','user17@ppic.kr',null,null,'1983.01.28',7,3,null,null,to_date('22/05/12','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (18,'user18','pass18','정경환','user18@ppic.kr',null,null,'1983.01.28',7,3,null,null,to_date('22/05/13','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (19,'user19','pass19','정경훈','user19@ppic.kr',null,null,'1983.01.28',7,3,null,null,to_date('22/05/14','RR/MM/DD'),null,'Y',null,'Y','2');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (20,'user20','pass20','최경희','user20@ppic.kr',null,null,'1983.01.28',7,3,null,null,to_date('22/05/15','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (21,'user21','pass21','홍경희','user21@ppic.kr',null,null,'1983.01.28',7,4,null,null,to_date('22/05/16','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (22,'user22','pass22','김계영','user22@ppic.kr',null,null,'1983.01.28',7,4,null,null,to_date('22/05/17','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (23,'user23','pass23','김계한','user23@ppic.kr',null,null,'1983.01.28',7,4,null,null,to_date('22/05/18','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (24,'user24','pass24','김고운','user24@ppic.kr',null,null,'1983.01.28',7,4,null,null,to_date('22/05/19','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (25,'user25','pass25','배고은','user25@ppic.kr',null,null,'1983.01.28',7,4,null,null,to_date('22/05/20','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (26,'user26','pass26','이곤순','user26@ppic.kr',null,null,'1983.01.28',7,5,null,null,to_date('22/05/21','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (27,'user27','pass27','유광규','user27@ppic.kr',null,null,'1983.01.28',7,5,null,null,to_date('22/05/22','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (28,'user28','pass28','김광인','user28@ppic.kr',null,null,'1983.01.28',7,5,null,null,to_date('22/05/23','RR/MM/DD'),null,'Y',null,'Y','2');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (29,'user29','pass29','신광현','user29@ppic.kr',null,null,'1983.01.28',7,5,null,null,to_date('22/05/24','RR/MM/DD'),null,'Y',null,'Y','2');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (30,'user30','pass30','강해린','user30@ppic.kr',null,null,'1983.01.28',7,5,null,null,to_date('22/05/25','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (31,'user31','pass31','박구영','user31@ppic.kr',null,null,'1983.01.28',7,6,null,null,to_date('22/05/26','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (32,'user32','pass32','이권민','user32@ppic.kr',null,null,'1983.01.28',7,6,null,null,to_date('22/05/27','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (33,'user33','pass33','박권석','user33@ppic.kr',null,null,'1983.01.28',7,6,null,null,to_date('22/05/28','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (34,'user34','pass34','박규상','user34@ppic.kr',null,null,'1983.01.28',7,6,null,null,to_date('22/05/29','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (35,'user35','pass35','박규인','user35@ppic.kr',null,null,'1983.01.28',7,6,null,null,to_date('22/05/30','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (36,'user36','pass36','송근순','user36@ppic.kr',null,null,'1983.01.28',7,7,null,null,to_date('22/05/31','RR/MM/DD'),null,'Y',null,'Y','1');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (37,'user37','pass37','송근우','user37@ppic.kr',null,null,'1983.01.28',7,7,null,null,to_date('22/06/01','RR/MM/DD'),null,'Y',null,'Y','2');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (38,'user38','pass38','오근우','user38@ppic.kr',null,null,'1983.01.28',7,7,null,null,to_date('22/06/02','RR/MM/DD'),null,'Y',null,'Y','2');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (39,'user39','pass39','이기덕','user39@ppic.kr',null,null,'1983.01.28',7,7,null,null,to_date('22/06/03','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (40,'user40','pass40','김하니','user40@ppic.kr',null,null,'1983.01.28',7,7,null,null,to_date('22/06/04','RR/MM/DD'),null,'Y',null,'Y','0');
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (43,'sf5019','$2a$10$EY/c0DJ9pokGrp.f4GMVAeHHJM0LGkN0Dz57knDCLLbXlzGPLdEta','신하영','sf5019@ppic.kr',null,null,null,7,7,null,null,null,null,'Y',null,'N',null);
Insert into MEMBER (USER_NO,USER_ID,USER_PWD,USER_NAME,MAIL,PHONE,ADDRESS,BIRTHDAY,POSITION,DEPARTMENT,EMPLOYEE_NO,PROFILE_IMG,HIRE_DATE,RESIGN_DATE,STATUS,AUTHORITY_NO,MEMBER_SIGN,CONN_STA) values (44,'hello','$2a$10$WdCIT30uoU52T5txER8kduEPRnBLCfiYQUZlZa5FUlFBXPzAtokrm','나이사','hello@ppic.kr','01011119999',null,'1960-01-26',2,1,null,null,null,null,'Y',null,'N',null);
REM INSERTING into NOTICE
SET DEFINE OFF;
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (1,6,'공지사항제목1',16,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (2,6,'공지사항제목2',4,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (3,6,'공지사항제목3',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (4,6,'공지사항제목4',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (5,6,'공지사항제목5',9,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (6,6,'공지사항제목6',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (7,6,'공지사항제목7',11,to_date('23/03/08','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (8,6,'공지사항제목8',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (9,6,'공지사항제목9',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (10,6,'공지사항제목10',1,to_date('23/03/08','RR/MM/DD'),null,'Y','Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (11,6,'공지사항제목11',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (12,6,'공지사항제목12',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (13,6,'공지사항제목13',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (14,6,'공지사항제목14',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (15,6,'공지사항제목15',1,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (16,6,'공지사항제목16',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (17,6,'공지사항제목17',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (18,6,'공지사항제목18',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (19,6,'공지사항제목19',1,to_date('23/03/08','RR/MM/DD'),null,'Y','Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (20,6,'공지사항제목20',6,to_date('23/03/08','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (21,6,'공지사항제목21',5,to_date('23/03/08','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (22,6,'공지사항제목22',3,to_date('23/03/08','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (23,6,'공지사항제목23',8,to_date('23/03/08','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'Y','Y');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (24,6,'공지사항제목24',1,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (25,6,'공지사항제목25',0,to_date('23/03/08','RR/MM/DD'),null,'Y','N');
Insert into NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,COUNT,CREATE_DATE,MODIFY_DATE,STATUS,IMPORTANT) values (27,6,'공지사항제목27',26,to_date('23/03/08','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'Y','Y');
REM INSERTING into NOTIFICATION
SET DEFINE OFF;
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (65,3,4,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (66,3,5,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (67,3,3,3,9,'박은지님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (68,3,3,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (69,3,4,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (70,3,5,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (71,3,3,3,10,'박은지님이 "연차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (72,3,3,3,11,'박은지님이 "반차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (73,3,4,3,11,'박은지님이 "반차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (20,2,4,0,1,'문승하님이 "워크숍 시행의 건"을(를) 반려했어요.',to_date('23/03/20','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (74,3,5,3,11,'박은지님이 "반차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (25,5,2,3,9,'윤예서님이 "반차"을(를) 승인했어요.',to_date('23/03/20','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (64,3,3,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (75,3,3,3,9,'박은지님이 "반차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (76,3,3,3,9,'박은지님이 "반차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (77,3,3,3,10,'박은지님이 "반차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (78,3,3,3,10,'박은지님이 "반차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (79,3,3,3,9,'박은지님이 "반차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (80,3,3,3,9,'박은지님이 "반차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (81,3,3,3,10,'박은지님이 "반차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (82,3,3,3,10,'박은지님이 "반차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (83,3,3,3,9,'박은지님이 "반차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (84,3,3,3,9,'박은지님이 "반차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (85,3,3,3,10,'박은지님이 "반차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (86,3,3,3,10,'박은지님이 "반차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (87,3,3,3,9,'박은지님이 "반차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (88,3,3,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (89,3,4,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (90,3,5,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (91,3,3,3,10,'박은지님이 "연차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (92,3,3,3,9,'박은지님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (93,3,3,3,9,'박은지님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (94,3,3,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (95,3,4,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (96,3,5,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (97,3,3,3,10,'박은지님이 "연차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (98,3,3,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (99,3,4,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (100,3,5,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (101,3,3,3,9,'박은지님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (102,3,3,3,10,'박은지님이 "연차"을(를) 거절했어요.',to_date('23/03/22','RR/MM/DD'),'Y','Y');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (103,3,3,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (104,3,4,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'Y','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (105,3,5,3,11,'박은지님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (106,3,3,3,9,'박은지님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (107,3,3,3,9,'박은지님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (108,3,3,3,9,'박은지님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (109,5,3,3,9,'윤예서님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (110,5,3,3,11,'윤예서님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (111,5,4,3,11,'윤예서님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (112,5,5,3,11,'윤예서님이 "연차"을(를) 신청했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
Insert into NOTIFICATION (NF_NO,SEND_NO,RECEIVE_NO,CAT_NO,DCAT_NO,NF_CONTENT,NF_DATE,CHECK_STA,DELETE_STA) values (113,3,5,3,9,'박은지님이 "연차"을(를) 승인했어요.',to_date('23/03/22','RR/MM/DD'),'N','N');
REM INSERTING into PARTICIPANT
SET DEFINE OFF;
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (58,5,0,69,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (59,5,0,70,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (59,2,1,0,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (58,1,1,68,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (60,5,0,71,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (60,3,1,0,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (61,5,0,72,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (61,4,1,0,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (62,1,3,0,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (62,2,3,0,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (62,3,3,0,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (62,4,3,0,to_date('23/03/21','RR/MM/DD'));
Insert into PARTICIPANT (ROOM_NO,USER_NO,NOTREAD_CHAT,LASTREAD_CHAT,CREATE_DATE) values (62,5,0,75,to_date('23/03/21','RR/MM/DD'));
REM INSERTING into POSITION
SET DEFINE OFF;
Insert into POSITION (POSITION_NO,POSITION_NAME) values (1,'사장');
Insert into POSITION (POSITION_NO,POSITION_NAME) values (2,'이사');
Insert into POSITION (POSITION_NO,POSITION_NAME) values (3,'부장');
Insert into POSITION (POSITION_NO,POSITION_NAME) values (4,'차장');
Insert into POSITION (POSITION_NO,POSITION_NAME) values (5,'과장');
Insert into POSITION (POSITION_NO,POSITION_NAME) values (6,'대리');
Insert into POSITION (POSITION_NO,POSITION_NAME) values (7,'사원');
REM INSERTING into PROJECT
SET DEFINE OFF;
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (1,1,'홈페이지 리뉴얼','2023.01.01','2023.03.29','10년만에 홈페이지 리뉴얼',to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (2,2,'PPIC App 수정','2023.02.01','2023.02.28','회원가입 기능 수정',to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (3,4,'CCACHU 고도화','2023.03.22','2023.07.31','카츄카츄 고도화',to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (4,3,'츄카 마케팅','2023.03.13','2023.03.20','츄카 광고(검색, 구글) 시작',to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (5,3,'디구 네이버 블로그 마케팅','2023.03.13','2023.03.20','석가는 얼마나 이상이 인간에 때에, 방황하여도, 못할 부패뿐이다. 굳세게 생명을 용감하고 할지라도 물방아 역사를 우리 이것이다. 할지니, 끓는 시들어 가는 운다. 위하여, 우리 가치를 예수는 사는가 옷을 끝에 피는 운다. 이상 쓸쓸한 듣기만 사람은 무엇이 사랑의 예수는 운다. 살았으며, 힘차게 스며들어 실현에 안고, 황금시대의 그러므로 인생에 못할 이것이다. 청춘의 꾸며 그들의 대한 열락의 어디 얼마나 천하를 따뜻한 사막이다.',to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (6,1,'프로젝트6','2023.02.01','2023.03.02','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (7,1,'프로젝트7','2023.04.02','2023.04.30','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (8,1,'프로젝트8','2023.04.03','2023.05.01','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (9,1,'프로젝트9','2023.04.04','2023.05.02','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (10,1,'프로젝트10','2023.04.05','2023.05.03','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (11,1,'프로젝트11','2023.04.06','2023.05.04','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (50,1,'프로젝트12','2023.04.07','2023.05.05','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (51,1,'프로젝트13','2023.04.08','2023.05.06','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (52,1,'프로젝트14','2023.04.09','2023.05.07','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (53,1,'프로젝트15','2023.04.10','2023.05.08','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (54,1,'프로젝트16','2023.04.11','2023.05.09','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (55,1,'프로젝트17','2023.04.12','2023.05.10','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (56,1,'프로젝트18','2023.04.13','2023.05.11','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (57,1,'프로젝트19','2023.04.14','2023.05.12','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (58,1,'프로젝트20','2023.04.15','2023.05.13','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (59,1,'프로젝트21','2023.04.16','2023.05.14','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (60,1,'프로젝트22','2023.04.17','2023.05.15','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (61,1,'프로젝트23','2023.04.18','2023.05.16','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (62,1,'프로젝트24','2023.04.19','2023.05.17','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (63,1,'프로젝트25','2023.04.20','2023.05.18','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (64,9,'프로젝트26','2023.04.21','2023.05.19','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (65,10,'프로젝트27','2023.04.22','2023.05.20','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (66,11,'프로젝트28','2023.04.23','2023.05.21','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (67,12,'프로젝트29','2023.04.24','2023.05.22','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (68,13,'프로젝트30','2023.04.25','2023.05.23','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (69,14,'프로젝트31','2023.04.26','2023.05.24','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (70,15,'프로젝트32','2023.04.27','2023.05.25','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (71,16,'프로젝트33','2023.04.28','2023.05.26','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (72,17,'프로젝트34','2023.04.29','2023.05.27','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (73,18,'프로젝트35','2023.04.30','2023.05.28','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (74,19,'프로젝트36','2023.02.01','2023.02.19','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
Insert into PROJECT (PROJECT_NO,PROJECT_MANAGER,PROJECT_NAME,START_DATE,END_DATE,DETAIL,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (75,20,'프로젝트37','2023.02.22','2023.02.28','청춘이 그리고 하나에 아침이 내 이제 까닭입니다.',to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'N');
REM INSERTING into P_PARTICIPANT
SET DEFINE OFF;
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (2,null,3,2,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (3,null,5,4,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (4,null,4,3,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (5,null,4,3,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (6,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (7,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (8,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (9,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (10,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,1,5,4,'N','N');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (11,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (50,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (51,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (52,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (53,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (54,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (55,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (56,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (57,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (58,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (59,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (60,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (61,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (62,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (63,null,2,1,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (64,null,8,9,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (65,null,8,10,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (66,null,2,11,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (67,null,2,12,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (68,null,2,13,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (69,null,2,14,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (70,null,2,15,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (71,null,3,16,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (72,null,3,17,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (73,null,3,18,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (74,null,3,19,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (75,null,3,20,'Y',null);
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,1,3,2,'N','Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (2,2,5,4,'N','Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,3,2,1,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (2,4,3,2,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (3,5,4,3,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (4,6,5,4,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (5,7,6,5,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (6,8,8,6,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (7,9,8,7,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (8,10,8,8,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (9,11,8,9,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (10,12,8,10,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,13,2,11,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (2,14,2,12,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (3,15,2,13,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (4,16,2,14,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (5,17,2,15,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (6,18,3,16,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (7,19,3,17,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (8,20,3,18,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (9,21,3,19,'N','Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (10,22,3,20,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,23,4,21,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (2,24,4,22,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (3,25,4,23,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (4,26,4,24,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (5,27,4,25,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (6,28,5,26,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (7,29,5,27,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (8,30,5,28,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (9,31,5,29,'N','Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (10,32,5,30,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,33,6,31,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (2,34,6,32,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (3,35,6,33,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (4,36,6,34,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (5,37,6,35,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (6,38,7,36,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (7,39,7,37,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (8,40,7,38,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (9,41,7,39,'N','Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (10,42,7,40,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (3,45,4,24,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (4,46,4,25,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (5,47,5,26,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (6,48,5,27,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (7,49,5,28,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (8,50,5,29,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (9,51,5,30,'N','Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (10,52,6,31,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,53,6,32,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (2,54,6,33,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (3,55,6,34,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (4,56,6,35,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (5,57,8,8,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (6,58,8,9,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (7,59,8,10,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (8,60,2,11,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (9,61,2,12,'N','Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (10,62,8,6,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (2,63,4,22,null,'Y');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,1,2,11,'N','N');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (10,42,5,26,'N','N');
Insert into P_PARTICIPANT (PROJECT_NO,TASK_NO,DEPARTMENT_NO,USER_NO,PM_STATUS,TASK_ASSIGN) values (1,3,6,33,'N','N');
REM INSERTING into REPORT
SET DEFINE OFF;
Insert into REPORT (REPORT_NO,REPORT_BNO,REPORT_MNO,REPORT_KIND,REPORT_CONTENT,REPORT_DATE,MODIFY_DATE,REPORT_STA,STATUS) values (1,29,40,'욕설/비방','어쩌구저쩌구',to_date('23/03/09','RR/MM/DD'),null,'0','Y');
Insert into REPORT (REPORT_NO,REPORT_BNO,REPORT_MNO,REPORT_KIND,REPORT_CONTENT,REPORT_DATE,MODIFY_DATE,REPORT_STA,STATUS) values (2,21,40,'기타','어쩔저쩔티비',to_date('23/03/09','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'1','Y');
REM INSERTING into RES_CAR
SET DEFINE OFF;
REM INSERTING into RES_ROOM
SET DEFINE OFF;
REM INSERTING into ROOM
SET DEFINE OFF;
REM INSERTING into R_PARTICIPANT
SET DEFINE OFF;
REM INSERTING into TASK
SET DEFINE OFF;
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (1,1,2,'DB 설계','DB 초안 설계',null,null,'2',to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (2,2,4,'DB 설계2','DB 초안 설계2',null,null,'2',to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (3,1,1,'회의록 작성','오늘 회의 내용 정리해서 작성',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (4,2,2,'발표자료 제작','프로젝트 진행상황에 대한 발표자료 작성',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (5,3,3,'업무분석','고객사 업무 프로세스 분석 및 개선방안 제안',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (6,4,4,'시스템 테스트','신규 시스템의 기능 및 성능 테스트 수행',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (7,5,5,'디자인 검토','제품 디자인 수정을 위한 검토 회의 참여',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (8,6,6,'마케팅 분석','제품 판매 동향 분석 및 마케팅 전략 수립',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (9,7,7,'코딩 작업','새로운 모듈의 개발을 위한 코딩 작업 수행',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (10,8,8,'교육 진행','신규 직원 교육을 위한 교육 계획 수립 및 교육 진행',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (11,9,9,'문서 작성','회사 정책서 작성',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (12,10,10,'프로젝트 발표 자료 준비','발표 ppt 작성',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (13,1,11,'데이터베이스 설계','ERD 작성',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (14,2,12,'업무 일지 작성','업무 일지 작성 및 보고서 작성',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (15,3,13,'클라이언트와의 미팅 준비','미팅 자료 준비',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (16,4,14,'데이터베이스 설계','스키마 설계',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (17,5,15,'서버 유지보수','서버 관리 및 유지보수',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (18,6,16,'보안 강화 작업','보안 취약점 조사 및 보완',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (19,7,17,'사용자 매뉴얼 작성','제품 사용자 매뉴얼 작성',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (20,8,18,'테스트 케이스 작성','제품 테스트 케이스 작성',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (21,9,19,'회사 웹사이트의 검색 기능 개선','웹사이트 검색 기능 개선 작업',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (22,10,20,'쇼핑몰 상품 리뷰 작성 기능 추가','쇼핑몰 상품 리뷰 작성 기능 추가 및 개선',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (23,1,21,'모바일 어플리케이션 로딩 속도 개선','모바일 어플리케이션 로딩 속도 개선 작업',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (24,2,22,'인터넷 기반 워드프로세서 개발','웹 기반 워드프로세서 개발',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (25,3,23,'온라인 교육 서비스의 UI 개선','온라인 교육 서비스 UI 개선 작업',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (26,4,24,'전자결재 시스템의 보안 강화','전자결재 시스템 보안 강화 작업',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (27,5,25,'위치기반 알림 기능 추가','위치기반 알림 기능 추가 개발',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (28,6,26,'실시간 주가 정보 제공 웹서비스 개발','실시간 주가 정보 제공 웹서비스 개발 작업',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (29,7,27,'소셜 미디어 분석 툴 개발','소셜 미디어 분석 툴 개발 작업',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (30,8,28,'자동 채팅봇 개발','자동 채팅봇 개발 작업',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (31,9,29,'회의록 작성','회의록 작성 및 보고서 작성',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (32,10,30,'회사 교육 자료 작성','회사의 교육 자료를 작성하여 회사 인트라넷에 업로드합니다.',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (33,1,31,'프로젝트 회의록 작성','프로젝트 회의를 진행하고 회의록을 작성합니다.',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (34,2,32,'쇼핑몰 상품 카테고리 추가 작업','쇼핑몰의 상품 카테고리를 추가하고 관리합니다.',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (35,3,33,'서버 백업 설정 작업','서버의 백업 설정 작업을 수행합니다.',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (36,4,34,'데이터베이스 백업 및 복구 작업','데이터베이스의 백업 및 복구 작업을 수행합니다.',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (37,5,35,'웹사이트 UI/UX 디자인 작업','웹사이트의 UI/UX 디자인 작업을 수행합니다.',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (38,6,36,'홈페이지 메인 페이지 리뉴얼 작업','홈페이지의 메인 페이지를 리뉴얼합니다.',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (39,7,37,'온라인 쇼핑몰 개발','온라인 쇼핑몰을 개발하고 관리합니다.',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (40,8,38,'보안 업그레이드 작업','보안 업그레이드 작업을 수행합니다.',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (41,9,39,'회사 인트라넷 제작 작업','회사 인트라넷을 제작하고 관리합니다.',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (42,10,40,'품질 관리 시스템 구축 작업','품질 관리 시스템을 구축하고 관리합니다.',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (45,3,24,'고객 서비스 및 상담 업무','고객 서비스 및 상담 업무를 수행합니다.',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (46,4,25,'마케팅 전략 수립 작업','마케팅 전략을 수립하고 이행합니다.',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (47,5,26,'영상 촬영 및 편집 작업','영상 촬영 및 편집 작업을 수행합니다.',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (48,6,27,'프로젝트 일정 관리 작업','프로젝트 일정을 관리하고 업데이트합니다.',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (49,7,28,'사내 교육과정 개발 작업','사내 교육과정을 개발하고 운영합니다.',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (50,8,29,'홍보 및 광고 캠페인 기획 작업','홍보 및 광고 캠페인의 전반적인 계획 수립 및 실행을 위한 타겟 시장, 목표 달성을 위한 전략, 콘텐츠 및 디자인 기획 등',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (51,9,30,'뉴스레터 작성 및 발송 작업','회사 뉴스레터의 내용 기획 및 작성, 발송 전 편집 및 검수, 이메일 마케팅 툴을 이용한 발송 작업 등',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (52,10,31,'지속적인 보안 감사 및 점검','시스템 보안 정책 수립, 보안 위협 및 취약점 파악 및 대응, 해킹 시뮬레이션 및 펜테스트 등',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (53,1,32,'새로운 피처 추가를 위한 설계','새로운 서비스 기능에 대한 요구사항 정의, 시스템 아키텍처 및 데이터베이스 설계 등',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (54,2,33,'새로운 테마 개발','서비스 사용자 경험을 개선하기 위한 새로운 디자인 테마 기획, 디자인 및 프론트엔드 작업 등',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (55,3,34,'시스템 백업 및 복원 테스트','시스템 데이터와 구성 요소의 백업 및 복원 기능을 테스트하여 장애 시 복구 가능성을 확인하는 작업 등',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (56,4,35,'고객 만족도 조사 분석','고객 만족도 조사 설계, 데이터 수집 및 분석, 향후 서비스 개선 방안 도출 등',null,null,'2',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (57,5,8,'모바일 앱의 UI/UX 개선','모바일 앱의 디자인, 사용자 경험 개선, 반응형 웹 디자인 및 모바일 퍼스트 전략 적용 등',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (58,6,9,'프로젝트 일정 관리 및 리소스 배분','프로젝트 일정 관리, 업무 우선순위 및 리소스(인력, 예산 등) 배분, 리스크 관리 등',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (59,7,10,'프로젝트 진행 상황 보고서 작성','프로젝트 진행 상황 보고서 작성, 이슈 및 리스크 보고, 문제 해결 및 대응 방안 제시 등',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (60,8,11,'소프트웨어 디버깅 및 테스트','소프트웨어 디버깅, 버그 리포팅 및 수정, 단위 테스트 및 시스템 테스트 등',null,null,'3',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (61,9,12,'데이터 마이그레이션 작업','이전 작업 계획 설정',null,null,'1',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (62,10,6,'서버 백업 설정 작업','서버의 백업 설정 작업을 수행합니다.',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (63,2,22,'블로그 기사 작성','블로그 기사를 작성하여 블로그에 업로드합니다.',null,null,'4',to_date('23/03/19','RR/MM/DD'),to_date('23/03/19','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (64,9,1,'업무추가추~','하하 업무가 과연~?','resources/uploadFiles/taskFiles/2023032214512447462.png','company_signature.png','2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (65,9,1,'업무추가추~','과연 ㅡㅡ;;??','resources/uploadFiles/taskFiles/2023032214540679981.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (66,9,1,'업무추가추~','과연 이번엔','resources/uploadFiles/taskFiles/2023032215011961143.png','company_signature.png','2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (67,9,1,'업추','과연','resources/uploadFiles/taskFiles/2023032215130852241.png','company_signature.png','2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (68,9,1,'gg','dd','resources/uploadFiles/taskFiles/2023032215151395514.png','company_signature.png','2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (69,9,1,'dff','ff','resources/uploadFiles/taskFiles/2023032215201143753.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (71,9,1,'dd','df','resources/uploadFiles/taskFiles/2023032215220483856.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (73,9,1,'업무추가추~','223rrrrrrrrrrrrrrrrrrr','resources/uploadFiles/taskFiles/2023032215272870151.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (75,9,1,'f','d',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (77,9,1,'업무추가추~','d','resources/uploadFiles/taskFiles/2023032215412695711.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (78,9,1,'gg','dd','resources/uploadFiles/taskFiles/2023032215425393685.png','company_signature.png','2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (79,9,1,'업무추가추~','d','resources/uploadFiles/taskFiles/2023032215450321308.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (80,9,1,'좋은말로 할 때','들어가라','resources/uploadFiles/taskFiles/2023032215482467528.png','company_signature.png','2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (81,9,1,'nnnnn','nnsdfsdf','resources/uploadFiles/taskFiles/2023032215512396565.png','company_signature.png','2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (82,9,1,'ㅠㅠ','gg','resources/uploadFiles/taskFiles/2023032215520951548.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (83,9,1,'gdg','asdf','resources/uploadFiles/taskFiles/2023032215531114885.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (84,9,1,'들어가','즈에발','resources/uploadFiles/taskFiles/2023032215552462541.png','company_signature.png','2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (85,9,1,'zzzzz','bbbb',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (86,9,1,'f','d','resources/uploadFiles/taskFiles/2023032215590636984.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (87,9,1,'업무213','0oi','resources/uploadFiles/taskFiles/2023032216001470157.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (88,9,1,'dfd','sadfsdf','resources/uploadFiles/taskFiles/2023032216010716788.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (89,9,1,'f','d',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (90,9,1,'zz','d','resources/uploadFiles/taskFiles/2023032216100410321.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (91,9,1,'ㅎㄹㅇㄶ','ㄹㄹ',null,null,'2',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (92,9,1,'업무추ㅇㅁㄴㅇㄹ','2345','resources/uploadFiles/taskFiles/2023032216120924281.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (93,9,1,'ㄹ','ㄴ','resources/uploadFiles/taskFiles/2023032216125766900.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (94,9,1,'업무213','ㅔㅐㅓㅐㅓ',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (95,9,1,'ㅇ','ㄹ','resources/uploadFiles/taskFiles/2023032216221471131.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (96,9,1,'ㄹㄹ','ㄴㄴ',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (97,9,1,'ㄹㄹ','ㄴㄴ',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (98,9,1,'ㅇㄹㅇㄹ','ㅁㄴㅇㄹ',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (99,9,1,'ㄹㅇㄹ','ㅇㄹㅇㄹ',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (100,9,1,'ㄹㅇㅇ','ㄴㅁㅇㄹ',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (101,9,1,'ㄹ','ㄴ',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (102,9,1,'업무추가추~','1df',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (103,9,1,'f','s',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (104,9,1,'fs','fsfsf','resources/uploadFiles/taskFiles/2023032216555240147.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (105,9,1,'s','f','resources/uploadFiles/taskFiles/2023032216572879634.png','company_signature.png','1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (106,9,1,'ㅇ','ㄹㅇ',null,null,'1',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
Insert into TASK (TASK_NO,PROJECT_NO,ASSIGN_USER,TASK_NAME,TASK_CONTENT,FILE_PATH,FILE_ORIGIN_NAME,TASK_STATUS,CREATE_DATE,MODIFY_DATE,DELETE_STATUS) values (107,9,1,'되나????????????????????????','dd','resources/uploadFiles/taskFiles/2023032217230144143.png','company_signature.png','3',to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'N');
REM INSERTING into WORK
SET DEFINE OFF;
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (38,6,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (39,7,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (40,8,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (41,9,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (42,10,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (43,1,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (44,2,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (45,3,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','지각');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (46,4,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (47,5,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (48,6,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (49,7,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (50,8,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (51,9,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (52,10,to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),to_date('23/02/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (53,1,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (54,2,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (55,3,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (56,4,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (57,5,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (58,6,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (59,7,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (60,8,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (61,9,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (62,10,to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),to_date('23/02/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (63,1,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (64,2,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (65,3,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (66,4,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (67,5,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (68,6,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (69,7,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (70,8,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (71,9,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (72,10,to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),to_date('23/02/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (73,1,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (74,2,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (75,3,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (76,4,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (77,5,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (78,6,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (79,7,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (80,8,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (81,9,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (82,10,to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),to_date('23/02/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (83,1,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (84,2,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (85,3,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (86,4,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (87,5,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (88,6,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (89,7,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (90,8,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (91,9,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (92,10,to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),to_date('23/02/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (93,1,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (94,2,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (95,3,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (96,4,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (97,5,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (98,6,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (99,7,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (100,8,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (101,9,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (102,10,to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),to_date('23/02/22','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (103,1,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (104,2,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (105,3,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (106,4,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (107,5,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (108,6,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (109,7,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (110,8,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (111,9,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (112,10,to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),to_date('23/02/23','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (113,1,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (114,2,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (115,3,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (116,4,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (117,5,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (118,6,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (119,7,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (120,8,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (121,9,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (122,10,to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),to_date('23/02/24','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (123,1,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (124,2,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (125,3,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (126,4,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (127,5,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (128,6,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (129,7,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (130,8,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (131,9,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (132,10,to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),to_date('23/02/27','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (133,1,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (134,2,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (135,3,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (136,4,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (3,1,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (4,2,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (5,3,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (6,4,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (7,5,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (8,6,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (9,7,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (10,8,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (11,9,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (12,10,to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),to_date('23/02/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (13,1,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (14,2,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (15,3,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (16,4,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (17,5,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (18,6,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (19,7,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (20,8,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (21,9,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (22,10,to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),to_date('23/02/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (23,1,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (24,2,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (25,3,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (26,4,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (27,5,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (28,6,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (29,7,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (30,8,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (31,9,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (32,10,to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),to_date('23/02/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (33,1,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (34,2,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (35,3,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (36,4,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (37,5,to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),to_date('23/02/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (137,5,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (138,6,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (139,7,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (140,8,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (141,9,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (142,10,to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),to_date('23/02/28','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (143,1,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (144,2,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (145,3,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (146,4,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (147,5,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (148,6,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (149,7,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (150,8,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (151,9,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (152,10,to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),to_date('23/03/02','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (153,1,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (154,2,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (155,3,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (156,4,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (157,5,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (158,6,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (159,7,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (160,8,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (161,9,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (162,10,to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),to_date('23/03/03','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (163,1,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (164,2,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (165,3,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (166,4,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (167,5,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (168,6,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (169,7,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (170,8,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (171,9,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (172,10,to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),to_date('23/03/06','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (173,1,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (174,2,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (175,3,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (176,4,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (177,5,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (178,6,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (179,7,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (180,8,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (181,9,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (182,10,to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),to_date('23/03/07','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (183,1,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (184,2,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (185,3,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (186,4,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (187,5,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (188,6,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (189,7,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (190,8,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (191,9,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (192,10,to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),to_date('23/03/08','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (193,1,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (194,2,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (195,3,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (196,4,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (197,5,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (198,6,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (199,7,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (200,8,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (201,9,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (202,10,to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),to_date('23/03/09','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (203,1,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (204,2,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (205,3,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (206,4,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (207,5,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (208,6,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (209,7,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (210,8,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (211,9,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (212,10,to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),to_date('23/03/10','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (213,1,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (214,2,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (215,3,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (216,4,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (217,5,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (218,6,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (219,7,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (220,8,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (221,9,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (222,10,to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),to_date('23/03/13','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (223,1,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (224,2,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (225,3,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (226,4,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (227,5,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (228,6,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (229,7,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (230,8,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (231,9,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (232,10,to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),to_date('23/03/14','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (233,1,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (234,2,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (235,3,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'10','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (236,4,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (237,5,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (238,6,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (239,7,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (240,8,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (241,9,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (242,10,to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),to_date('23/03/15','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (243,1,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (244,2,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (245,3,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (246,4,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (247,5,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (248,6,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (249,7,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (250,8,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (251,9,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (252,10,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (253,1,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (254,2,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (255,3,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (256,4,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (257,5,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (258,6,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (259,7,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (260,8,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (261,9,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (262,10,to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),to_date('23/03/17','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (263,1,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (264,2,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (265,3,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'10','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (266,4,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (267,5,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (268,6,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (269,7,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (270,8,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (271,9,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (272,10,to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),to_date('23/03/20','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (273,1,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (274,2,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (275,3,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'9','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (276,4,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (277,5,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (278,6,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (279,7,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (280,8,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (281,9,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (282,10,to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),to_date('23/03/21','RR/MM/DD'),'8','정상');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (283,1,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (284,2,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (285,3,to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),to_date('23/03/22','RR/MM/DD'),'5','조퇴');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (286,4,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (287,5,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (288,6,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (289,7,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (290,8,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (291,9,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
Insert into WORK (WORK_NO,USER_NO,WORK_DATE,WORK_IN,WORK_OUT,WORK_TIME,STATUS) values (292,10,to_date('23/03/22','RR/MM/DD'),null,null,null,'결근');
--------------------------------------------------------
--  DDL for Index PK_MAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MAIL" ON "MAIL" ("MAIL_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CAR" ON "CAR" ("CAR_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_HOLIDAY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_HOLIDAY" ON "HOLIDAY" ("HOLI_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FORM_TRANSFER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FORM_TRANSFER" ON "FORM_TRANSFER" ("FORM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_COMPANY_SCH
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_COMPANY_SCH" ON "COMPANY_SCH" ("SCH_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FORM_DRAFT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FORM_DRAFT" ON "FORM_DRAFT" ("FORM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BOARD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOARD" ON "BOARD" ("BOARD_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_REPORT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REPORT" ON "REPORT" ("REPORT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_WORK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_WORK" ON "WORK" ("WORK_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FORM_CASH
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FORM_CASH" ON "FORM_CASH" ("FORM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_RES_CAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RES_CAR" ON "RES_CAR" ("RES_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ROOM" ON "ROOM" ("ROOM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LIKEHATE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LIKEHATE" ON "LIKEHATE" ("BOARD_NO", "MEM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_MAIL_ATTACHMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MAIL_ATTACHMENT" ON "MAIL_ATTACHMENT" ("FILE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_RES_ROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RES_ROOM" ON "RES_ROOM" ("RES_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_DOCUMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DOCUMENT" ON "DOCUMENT" ("DOC_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_APPROVAL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_APPROVAL" ON "APPROVAL" ("APPROVAL_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ATTACHMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ATTACHMENT" ON "ATTACHMENT" ("ATTACHMENT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_AUTHORITY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_AUTHORITY" ON "AUTHORITY" ("AUTHORITY_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_HOLIDAY_APPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_HOLIDAY_APPLY" ON "HOLIDAY_APPLY" ("HOLIDAY_NO", "USER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTIFICATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTIFICATION" ON "NOTIFICATION" ("NF_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TASK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TASK" ON "TASK" ("TASK_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTICE" ON "NOTICE" ("NOTICE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FORM_CONSUME
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FORM_CONSUME" ON "FORM_CONSUME" ("FORM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_POSITION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_POSITION" ON "POSITION" ("POSITION_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PARTICIPANT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PARTICIPANT" ON "PARTICIPANT" ("ROOM_NO", "USER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CHATROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CHATROOM" ON "CHATROOM" ("ROOM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_DEPT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DEPT" ON "DEPT" ("DEPARTMENT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_APP_CHANGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_APP_CHANGE" ON "APP_CHANGE" ("CHANGE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MEMBER" ON "MEMBER" ("USER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PROJECT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROJECT" ON "PROJECT" ("PROJECT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CHAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CHAT" ON "CHAT" ("CHAT_NO") 
  ;
--------------------------------------------------------
--  Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY ("CHAT_NO") ENABLE;
  ALTER TABLE "CHAT" MODIFY ("CHAT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "CHAT" MODIFY ("SEND_NO" NOT NULL ENABLE);
  ALTER TABLE "CHAT" MODIFY ("ROOM_NO" NOT NULL ENABLE);
  ALTER TABLE "CHAT" MODIFY ("CHAT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APP_CHANGE
--------------------------------------------------------

  ALTER TABLE "APP_CHANGE" ADD CONSTRAINT "CHECK_CK_STATUS" CHECK (
	"STATUS" IN ('Y','N')
) ENABLE;
  ALTER TABLE "APP_CHANGE" ADD CONSTRAINT "CHECK_ROLE" CHECK (
	"ROLE" IN ('변경','댓글')
) ENABLE;
  ALTER TABLE "APP_CHANGE" ADD CONSTRAINT "PK_APP_CHANGE" PRIMARY KEY ("CHANGE_NO") ENABLE;
  ALTER TABLE "APP_CHANGE" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "APP_CHANGE" MODIFY ("CONTENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TASK
--------------------------------------------------------

  ALTER TABLE "TASK" ADD CONSTRAINT "PK_TASK" PRIMARY KEY ("TASK_NO") ENABLE;
  ALTER TABLE "TASK" MODIFY ("TASK_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "TASK" MODIFY ("TASK_NAME" NOT NULL ENABLE);
  ALTER TABLE "TASK" MODIFY ("ASSIGN_USER" NOT NULL ENABLE);
  ALTER TABLE "TASK" MODIFY ("PROJECT_NO" NOT NULL ENABLE);
  ALTER TABLE "TASK" MODIFY ("TASK_NO" NOT NULL ENABLE);
  ALTER TABLE "TASK" MODIFY ("DELETE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "TASK" MODIFY ("MODIFY_DATE" NOT NULL ENABLE);
  ALTER TABLE "TASK" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "TASK" MODIFY ("TASK_STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHAT_LIKE
--------------------------------------------------------

  ALTER TABLE "CHAT_LIKE" MODIFY ("LIKEUSER_NO" NOT NULL ENABLE);
  ALTER TABLE "CHAT_LIKE" MODIFY ("MYUSER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MAIL_ATTACHMENT
--------------------------------------------------------

  ALTER TABLE "MAIL_ATTACHMENT" ADD CONSTRAINT "PK_MAIL_ATTACHMENT" PRIMARY KEY ("FILE_NO") ENABLE;
  ALTER TABLE "MAIL_ATTACHMENT" MODIFY ("CHANE_NAME" NOT NULL ENABLE);
  ALTER TABLE "MAIL_ATTACHMENT" MODIFY ("ORIGIN_NAME" NOT NULL ENABLE);
  ALTER TABLE "MAIL_ATTACHMENT" MODIFY ("MAIL_NO" NOT NULL ENABLE);
  ALTER TABLE "MAIL_ATTACHMENT" MODIFY ("FILE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMPANY_SCH
--------------------------------------------------------

  ALTER TABLE "COMPANY_SCH" ADD CONSTRAINT "PK_COMPANY_SCH" PRIMARY KEY ("SCH_NO") ENABLE;
  ALTER TABLE "COMPANY_SCH" MODIFY ("SCH_NAME" NOT NULL ENABLE);
  ALTER TABLE "COMPANY_SCH" MODIFY ("SCH_KIND" NOT NULL ENABLE);
  ALTER TABLE "COMPANY_SCH" MODIFY ("SCH_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHATROOM
--------------------------------------------------------

  ALTER TABLE "CHATROOM" ADD CONSTRAINT "PK_CHATROOM" PRIMARY KEY ("ROOM_NO") ENABLE;
  ALTER TABLE "CHATROOM" MODIFY ("ROOM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPT
--------------------------------------------------------

  ALTER TABLE "DEPT" ADD CONSTRAINT "PK_DEPT" PRIMARY KEY ("DEPARTMENT_NO") ENABLE;
  ALTER TABLE "DEPT" MODIFY ("DEPARTMENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "DEPT" MODIFY ("DEPARTMENT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY ("REPORT_NO") ENABLE;
  ALTER TABLE "REPORT" MODIFY ("REPORT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "REPORT" MODIFY ("REPORT_KIND" NOT NULL ENABLE);
  ALTER TABLE "REPORT" MODIFY ("REPORT_MNO" NOT NULL ENABLE);
  ALTER TABLE "REPORT" MODIFY ("REPORT_BNO" NOT NULL ENABLE);
  ALTER TABLE "REPORT" MODIFY ("REPORT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RES_CAR
--------------------------------------------------------

  ALTER TABLE "RES_CAR" ADD CONSTRAINT "PK_RES_CAR" PRIMARY KEY ("RES_NO") ENABLE;
  ALTER TABLE "RES_CAR" MODIFY ("MODIFY_DATE" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("RES_USER" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("CAR_CODE" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("USAGE" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("RETURN_TIME" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("RETURN_DATE" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("RENTAL_TIME" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("RENTAL_DATE" NOT NULL ENABLE);
  ALTER TABLE "RES_CAR" MODIFY ("RES_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table R_PARTICIPANT
--------------------------------------------------------

  ALTER TABLE "R_PARTICIPANT" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "R_PARTICIPANT" MODIFY ("RES_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CAR
--------------------------------------------------------

  ALTER TABLE "CAR" ADD CONSTRAINT "PK_CAR" PRIMARY KEY ("CAR_CODE") ENABLE;
  ALTER TABLE "CAR" MODIFY ("DELETE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "CAR" MODIFY ("CREATE_USER" NOT NULL ENABLE);
  ALTER TABLE "CAR" MODIFY ("MODIFY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CAR" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CAR" MODIFY ("CAR_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "CAR" MODIFY ("CAR_NAME" NOT NULL ENABLE);
  ALTER TABLE "CAR" MODIFY ("CAR_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECT
--------------------------------------------------------

  ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY ("PROJECT_NO") ENABLE;
  ALTER TABLE "PROJECT" MODIFY ("DELETE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "PROJECT" MODIFY ("MODIFY_DATE" NOT NULL ENABLE);
  ALTER TABLE "PROJECT" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "PROJECT" MODIFY ("DETAIL" NOT NULL ENABLE);
  ALTER TABLE "PROJECT" MODIFY ("END_DATE" NOT NULL ENABLE);
  ALTER TABLE "PROJECT" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "PROJECT" MODIFY ("PROJECT_NAME" NOT NULL ENABLE);
  ALTER TABLE "PROJECT" MODIFY ("PROJECT_MANAGER" NOT NULL ENABLE);
  ALTER TABLE "PROJECT" MODIFY ("PROJECT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WORK
--------------------------------------------------------

  ALTER TABLE "WORK" ADD CONSTRAINT "PK_WORK" PRIMARY KEY ("WORK_NO") ENABLE;
  ALTER TABLE "WORK" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "WORK" MODIFY ("WORK_DATE" NOT NULL ENABLE);
  ALTER TABLE "WORK" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "WORK" MODIFY ("WORK_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POSITION
--------------------------------------------------------

  ALTER TABLE "POSITION" ADD CONSTRAINT "PK_POSITION" PRIMARY KEY ("POSITION_NO") ENABLE;
  ALTER TABLE "POSITION" MODIFY ("POSITION_NAME" NOT NULL ENABLE);
  ALTER TABLE "POSITION" MODIFY ("POSITION_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MAIL
--------------------------------------------------------

  ALTER TABLE "MAIL" ADD CONSTRAINT "PK_MAIL" PRIMARY KEY ("MAIL_NO") ENABLE;
  ALTER TABLE "MAIL" MODIFY ("TEMP_STATUS" NOT NULL ENABLE);
  ALTER TABLE "MAIL" MODIFY ("SENDER_MAIL" NOT NULL ENABLE);
  ALTER TABLE "MAIL" MODIFY ("SENDER" NOT NULL ENABLE);
  ALTER TABLE "MAIL" MODIFY ("MAIL_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PARTICIPANT
--------------------------------------------------------

  ALTER TABLE "PARTICIPANT" ADD CONSTRAINT "PK_PARTICIPANT" PRIMARY KEY ("ROOM_NO", "USER_NO") ENABLE;
  ALTER TABLE "PARTICIPANT" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "PARTICIPANT" MODIFY ("ROOM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MAIL_STATUS
--------------------------------------------------------

  ALTER TABLE "MAIL_STATUS" MODIFY ("IMPORTANT_STATUS" NOT NULL ENABLE);
  ALTER TABLE "MAIL_STATUS" MODIFY ("BIN_STATUS" NOT NULL ENABLE);
  ALTER TABLE "MAIL_STATUS" MODIFY ("SENDER_MAIL" NOT NULL ENABLE);
  ALTER TABLE "MAIL_STATUS" MODIFY ("MAIL_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LIKEHATE
--------------------------------------------------------

  ALTER TABLE "LIKEHATE" ADD CONSTRAINT "PK_LIKEHATE" PRIMARY KEY ("BOARD_NO", "MEM_NO") ENABLE;
  ALTER TABLE "LIKEHATE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "LIKEHATE" MODIFY ("MEM_NO" NOT NULL ENABLE);
  ALTER TABLE "LIKEHATE" MODIFY ("BOARD_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FORM_CONSUME
--------------------------------------------------------

  ALTER TABLE "FORM_CONSUME" ADD CONSTRAINT "PK_FORM_CONSUME" PRIMARY KEY ("FORM_NO") ENABLE;
  ALTER TABLE "FORM_CONSUME" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "FORM_CONSUME" MODIFY ("COUNT" NOT NULL ENABLE);
  ALTER TABLE "FORM_CONSUME" MODIFY ("UNIT" NOT NULL ENABLE);
  ALTER TABLE "FORM_CONSUME" MODIFY ("REASON" NOT NULL ENABLE);
  ALTER TABLE "FORM_CONSUME" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADDRESS_LIKE
--------------------------------------------------------

  ALTER TABLE "ADDRESS_LIKE" MODIFY ("LIKE_USER" NOT NULL ENABLE);
  ALTER TABLE "ADDRESS_LIKE" MODIFY ("USER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("NOTICE_NO") ENABLE;
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_TITLE" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_WRITER" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FORM_CASH
--------------------------------------------------------

  ALTER TABLE "FORM_CASH" ADD CONSTRAINT "PK_FORM_CASH" PRIMARY KEY ("FORM_NO") ENABLE;
  ALTER TABLE "FORM_CASH" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "FORM_CASH" MODIFY ("USER_HISTORY" NOT NULL ENABLE);
  ALTER TABLE "FORM_CASH" MODIFY ("ACCOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FORM_DRAFT
--------------------------------------------------------

  ALTER TABLE "FORM_DRAFT" ADD CONSTRAINT "PK_FORM_DRAFT" PRIMARY KEY ("FORM_NO") ENABLE;
  ALTER TABLE "FORM_DRAFT" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "FORM_DRAFT" MODIFY ("EFFECTIVE_DATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROOM
--------------------------------------------------------

  ALTER TABLE "ROOM" ADD CONSTRAINT "PK_ROOM" PRIMARY KEY ("ROOM_NO") ENABLE;
  ALTER TABLE "ROOM" MODIFY ("DELETE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "ROOM" MODIFY ("CREATE_USER" NOT NULL ENABLE);
  ALTER TABLE "ROOM" MODIFY ("MODIFY_DATE" NOT NULL ENABLE);
  ALTER TABLE "ROOM" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "ROOM" MODIFY ("ROOM_NAME" NOT NULL ENABLE);
  ALTER TABLE "ROOM" MODIFY ("ROOM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HOLIDAY
--------------------------------------------------------

  ALTER TABLE "HOLIDAY" ADD CONSTRAINT "PK_HOLIDAY" PRIMARY KEY ("HOLI_NO") ENABLE;
  ALTER TABLE "HOLIDAY" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY" MODIFY ("HOLI_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOCUMENT
--------------------------------------------------------

  ALTER TABLE "DOCUMENT" ADD CONSTRAINT "PK_DOCUMENT" PRIMARY KEY ("DOC_NO") ENABLE;
  ALTER TABLE "DOCUMENT" MODIFY ("DELETE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "DOCUMENT" MODIFY ("MODIFY_DATE" NOT NULL ENABLE);
  ALTER TABLE "DOCUMENT" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "DOCUMENT" MODIFY ("CREATE_USER" NOT NULL ENABLE);
  ALTER TABLE "DOCUMENT" MODIFY ("DOC_NAME" NOT NULL ENABLE);
  ALTER TABLE "DOCUMENT" MODIFY ("DOC_TYPE" NOT NULL ENABLE);
  ALTER TABLE "DOCUMENT" MODIFY ("DOC_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APP_PROCESS
--------------------------------------------------------

  ALTER TABLE "APP_PROCESS" ADD CONSTRAINT "CHECK_BOOKMARK" CHECK (
	"BOOKMARK" IN ('Y','N')
) ENABLE;
  ALTER TABLE "APP_PROCESS" ADD CONSTRAINT "CHECK_PRO_STATUS" CHECK (
	"STATUS" IN ('승인','반려')
) ENABLE;
  ALTER TABLE "APP_PROCESS" ADD CONSTRAINT "CHECK_APPROVAL_ROLE" CHECK (
	"APPROVAL_ROLE" IN ('결재','참조')
) ENABLE;
  ALTER TABLE "APP_PROCESS" MODIFY ("APPROVAL_ROLE" NOT NULL ENABLE);
  ALTER TABLE "APP_PROCESS" MODIFY ("PROCESS_ORDER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APPROVAL
--------------------------------------------------------

  ALTER TABLE "APPROVAL" ADD CONSTRAINT "CHECK_STATUS" CHECK (
	"STATUS" IN ('Y','N')
) ENABLE;
  ALTER TABLE "APPROVAL" ADD CONSTRAINT "CHECK_APPROVAL_STATUS" CHECK (
	"APPROVAL_STATUS" IN ('대기','진행중','승인','반려','임시저장')
) ENABLE;
  ALTER TABLE "APPROVAL" ADD CONSTRAINT "CHECK_FORM" CHECK (
	"FORM" IN ('업무기안','인사발령품의서','비품신청서','지출결의서')
) ENABLE;
  ALTER TABLE "APPROVAL" ADD CONSTRAINT "PK_APPROVAL" PRIMARY KEY ("APPROVAL_NO") ENABLE;
  ALTER TABLE "APPROVAL" MODIFY ("FINAL_ORDER" NOT NULL ENABLE);
  ALTER TABLE "APPROVAL" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "APPROVAL" MODIFY ("FORM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FORM_TRANSFER
--------------------------------------------------------

  ALTER TABLE "FORM_TRANSFER" ADD CONSTRAINT "PK_FORM_TRANSFER" PRIMARY KEY ("FORM_NO") ENABLE;
  ALTER TABLE "FORM_TRANSFER" MODIFY ("PROMOTE_POSITION" NOT NULL ENABLE);
  ALTER TABLE "FORM_TRANSFER" MODIFY ("CURRENT_POSITION" NOT NULL ENABLE);
  ALTER TABLE "FORM_TRANSFER" MODIFY ("DEPARTMENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "FORM_TRANSFER" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "FORM_TRANSFER" MODIFY ("EFFECTIVE_DATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HOLIDAY_APPLY
--------------------------------------------------------

  ALTER TABLE "HOLIDAY_APPLY" ADD CONSTRAINT "PK_HOLIDAY_APPLY" PRIMARY KEY ("HOLIDAY_NO", "USER_NO") ENABLE;
  ALTER TABLE "HOLIDAY_APPLY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY_APPLY" MODIFY ("H_REASON" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY_APPLY" MODIFY ("H_FINISH" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY_APPLY" MODIFY ("H_START" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY_APPLY" MODIFY ("H_TYPE" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY_APPLY" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY_APPLY" MODIFY ("HOLIDAY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY ("BOARD_NO") ENABLE;
  ALTER TABLE "BOARD" MODIFY ("BOARD_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BOARD_TITLE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BOARD_WRITER" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BOARD_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RES_ROOM
--------------------------------------------------------

  ALTER TABLE "RES_ROOM" ADD CONSTRAINT "PK_RES_ROOM" PRIMARY KEY ("RES_NO") ENABLE;
  ALTER TABLE "RES_ROOM" MODIFY ("ROOM_NO" NOT NULL ENABLE);
  ALTER TABLE "RES_ROOM" MODIFY ("SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "RES_ROOM" MODIFY ("END_TIME" NOT NULL ENABLE);
  ALTER TABLE "RES_ROOM" MODIFY ("START_TIME" NOT NULL ENABLE);
  ALTER TABLE "RES_ROOM" MODIFY ("RES_DATE" NOT NULL ENABLE);
  ALTER TABLE "RES_ROOM" MODIFY ("RES_NO" NOT NULL ENABLE);
  ALTER TABLE "RES_ROOM" MODIFY ("MODIFY_DATE" NOT NULL ENABLE);
  ALTER TABLE "RES_ROOM" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "RES_ROOM" MODIFY ("RES_USER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("USER_NO") ENABLE;
  ALTER TABLE "MEMBER" MODIFY ("MEMBER_SIGN" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("DEPARTMENT" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("POSITION" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("MAIL" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_PWD" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("USER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUTHORITY
--------------------------------------------------------

  ALTER TABLE "AUTHORITY" ADD CONSTRAINT "PK_AUTHORITY" PRIMARY KEY ("AUTHORITY_NO") ENABLE;
  ALTER TABLE "AUTHORITY" MODIFY ("AUTHORITY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "PK_NOTIFICATION" PRIMARY KEY ("NF_NO") ENABLE;
  ALTER TABLE "NOTIFICATION" MODIFY ("DCAT_NO" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("CAT_NO" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("RECEIVE_NO" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("SEND_NO" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("NF_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ATTACHMENT
--------------------------------------------------------

  ALTER TABLE "ATTACHMENT" ADD CONSTRAINT "PK_ATTACHMENT" PRIMARY KEY ("ATTACHMENT_NO") ENABLE;
  ALTER TABLE "ATTACHMENT" MODIFY ("REF_NO" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("CATEGORY_NO" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("CHANGE_NAME" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("ORIGIN_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ADDRESS_LIKE
--------------------------------------------------------

  ALTER TABLE "ADDRESS_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_ADDRESS_LIKE_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table APPROVAL
--------------------------------------------------------

  ALTER TABLE "APPROVAL" ADD CONSTRAINT "FK_MEMBER_TO_APPROVAL_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table APP_CHANGE
--------------------------------------------------------

  ALTER TABLE "APP_CHANGE" ADD CONSTRAINT "FK_APPROVAL_TO_APP_CHANGE_1" FOREIGN KEY ("APPROVAL_NO")
	  REFERENCES "APPROVAL" ("APPROVAL_NO") ENABLE;
  ALTER TABLE "APP_CHANGE" ADD CONSTRAINT "FK_MEMBER_TO_APP_CHANGE_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table APP_PROCESS
--------------------------------------------------------

  ALTER TABLE "APP_PROCESS" ADD CONSTRAINT "FK_APPROVAL_TO_APP_PROCESS_1" FOREIGN KEY ("APPROVAL_NO")
	  REFERENCES "APPROVAL" ("APPROVAL_NO") ENABLE;
  ALTER TABLE "APP_PROCESS" ADD CONSTRAINT "FK_MEMBER_TO_APP_PROCESS_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY ("BOARD_WRITER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CAR
--------------------------------------------------------

  ALTER TABLE "CAR" ADD CONSTRAINT "FK_MEMBER_TO_CAR_1" FOREIGN KEY ("CREATE_USER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "CHAT" ADD CONSTRAINT "FK_CHATROOM_TO_CHAT_1" FOREIGN KEY ("ROOM_NO")
	  REFERENCES "CHATROOM" ("ROOM_NO") ENABLE;
  ALTER TABLE "CHAT" ADD CONSTRAINT "FK_MEMBER_TO_CHAT_1" FOREIGN KEY ("SEND_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHAT_LIKE
--------------------------------------------------------

  ALTER TABLE "CHAT_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_CHAT_LIKE_1" FOREIGN KEY ("MYUSER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "CHAT_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_CHAT_LIKE_2" FOREIGN KEY ("LIKEUSER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DOCUMENT
--------------------------------------------------------

  ALTER TABLE "DOCUMENT" ADD CONSTRAINT "FK_MEMBER_TO_DOCUMENT_1" FOREIGN KEY ("CREATE_USER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FORM_CASH
--------------------------------------------------------

  ALTER TABLE "FORM_CASH" ADD CONSTRAINT "FK_APPROVAL_TO_FORM_CASH_1" FOREIGN KEY ("APPROVAL_NO")
	  REFERENCES "APPROVAL" ("APPROVAL_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FORM_CONSUME
--------------------------------------------------------

  ALTER TABLE "FORM_CONSUME" ADD CONSTRAINT "FK_APPROVAL_TO_FORM_CONSUME_1" FOREIGN KEY ("APPROVAL_NO")
	  REFERENCES "APPROVAL" ("APPROVAL_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FORM_DRAFT
--------------------------------------------------------

  ALTER TABLE "FORM_DRAFT" ADD CONSTRAINT "FK_APPROVAL_TO_FORM_DRAFT_1" FOREIGN KEY ("APPROVAL_NO")
	  REFERENCES "APPROVAL" ("APPROVAL_NO") ENABLE;
  ALTER TABLE "FORM_DRAFT" ADD CONSTRAINT "FK_DEPT_TO_FORM_DRAFT_1" FOREIGN KEY ("DEPARTMENT_NO")
	  REFERENCES "DEPT" ("DEPARTMENT_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FORM_TRANSFER
--------------------------------------------------------

  ALTER TABLE "FORM_TRANSFER" ADD CONSTRAINT "FK_APPROVAL_TO_FORM_TRANSFER_1" FOREIGN KEY ("APPROVAL_NO")
	  REFERENCES "APPROVAL" ("APPROVAL_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HOLIDAY
--------------------------------------------------------

  ALTER TABLE "HOLIDAY" ADD CONSTRAINT "FK_MEMBER_TO_HOLIDAY_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HOLIDAY_APPLY
--------------------------------------------------------

  ALTER TABLE "HOLIDAY_APPLY" ADD CONSTRAINT "FK_MEMBER_TO_HOLIDAY_APPLY_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIKEHATE
--------------------------------------------------------

  ALTER TABLE "LIKEHATE" ADD CONSTRAINT "FK_BOARD_TO_LIKEHATE_1" FOREIGN KEY ("BOARD_NO")
	  REFERENCES "BOARD" ("BOARD_NO") ENABLE;
  ALTER TABLE "LIKEHATE" ADD CONSTRAINT "FK_MEMBER_TO_LIKEHATE_1" FOREIGN KEY ("MEM_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MAIL
--------------------------------------------------------

  ALTER TABLE "MAIL" ADD CONSTRAINT "FK_MEMBER_TO_MAIL_1" FOREIGN KEY ("SENDER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MAIL_ATTACHMENT
--------------------------------------------------------

  ALTER TABLE "MAIL_ATTACHMENT" ADD CONSTRAINT "FK_MAIL_TO_MAIL_ATTACHMENT_1" FOREIGN KEY ("MAIL_NO")
	  REFERENCES "MAIL" ("MAIL_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MAIL_STATUS
--------------------------------------------------------

  ALTER TABLE "MAIL_STATUS" ADD CONSTRAINT "FK_MAIL_TO_MAIL_STATUS_1" FOREIGN KEY ("MAIL_NO")
	  REFERENCES "MAIL" ("MAIL_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_DEPT_TO_MEMBER_1" FOREIGN KEY ("DEPARTMENT")
	  REFERENCES "DEPT" ("DEPARTMENT_NO") ENABLE;
  ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_POSITION_TO_MEMBER_1" FOREIGN KEY ("POSITION")
	  REFERENCES "POSITION" ("POSITION_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_MEMBER_TO_NOTICE_1" FOREIGN KEY ("NOTICE_WRITER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "FK_MEMBER_TO_NOTIFICATION_1" FOREIGN KEY ("SEND_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PARTICIPANT
--------------------------------------------------------

  ALTER TABLE "PARTICIPANT" ADD CONSTRAINT "FK_CHATROOM_TO_PARTICIPANT_1" FOREIGN KEY ("ROOM_NO")
	  REFERENCES "CHATROOM" ("ROOM_NO") ENABLE;
  ALTER TABLE "PARTICIPANT" ADD CONSTRAINT "FK_MEMBER_TO_PARTICIPANT_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROJECT
--------------------------------------------------------

  ALTER TABLE "PROJECT" ADD CONSTRAINT "FK_MEMBER_TO_PROJECT_1" FOREIGN KEY ("PROJECT_MANAGER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table P_PARTICIPANT
--------------------------------------------------------

  ALTER TABLE "P_PARTICIPANT" ADD CONSTRAINT "FK_DEPT_TO_P_PARTICIPANT_1" FOREIGN KEY ("DEPARTMENT_NO")
	  REFERENCES "DEPT" ("DEPARTMENT_NO") ENABLE;
  ALTER TABLE "P_PARTICIPANT" ADD CONSTRAINT "FK_MEMBER_TO_P_PARTICIPANT_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "P_PARTICIPANT" ADD CONSTRAINT "FK_PROJECT_TO_P_PARTICIPANT_1" FOREIGN KEY ("PROJECT_NO")
	  REFERENCES "PROJECT" ("PROJECT_NO") ENABLE;
  ALTER TABLE "P_PARTICIPANT" ADD CONSTRAINT "FK_TASK_TO_P_PARTICIPANT_1" FOREIGN KEY ("TASK_NO")
	  REFERENCES "TASK" ("TASK_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "REPORT" ADD CONSTRAINT "FK_BOARD_TO_REPORT_1" FOREIGN KEY ("REPORT_BNO")
	  REFERENCES "BOARD" ("BOARD_NO") ENABLE;
  ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY ("REPORT_MNO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RES_CAR
--------------------------------------------------------

  ALTER TABLE "RES_CAR" ADD CONSTRAINT "FK_CAR_TO_RES_CAR_1" FOREIGN KEY ("CAR_CODE")
	  REFERENCES "CAR" ("CAR_CODE") ENABLE;
  ALTER TABLE "RES_CAR" ADD CONSTRAINT "FK_MEMBER_TO_RES_CAR_1" FOREIGN KEY ("RES_USER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RES_ROOM
--------------------------------------------------------

  ALTER TABLE "RES_ROOM" ADD CONSTRAINT "FK_MEMBER_TO_RES_ROOM_1" FOREIGN KEY ("RES_USER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "RES_ROOM" ADD CONSTRAINT "FK_ROOM_TO_RES_ROOM_1" FOREIGN KEY ("ROOM_NO")
	  REFERENCES "ROOM" ("ROOM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ROOM
--------------------------------------------------------

  ALTER TABLE "ROOM" ADD CONSTRAINT "FK_MEMBER_TO_ROOM_1" FOREIGN KEY ("CREATE_USER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table R_PARTICIPANT
--------------------------------------------------------

  ALTER TABLE "R_PARTICIPANT" ADD CONSTRAINT "FK_MEMBER_TO_R_PARTICIPANT_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "R_PARTICIPANT" ADD CONSTRAINT "FK_RES_ROOM_TO_R_PARTICIPANT_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RES_ROOM" ("RES_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TASK
--------------------------------------------------------

  ALTER TABLE "TASK" ADD CONSTRAINT "FK_MEMBER_TO_TASK_1" FOREIGN KEY ("ASSIGN_USER")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
  ALTER TABLE "TASK" ADD CONSTRAINT "FK_PROJECT_TO_TASK_1" FOREIGN KEY ("PROJECT_NO")
	  REFERENCES "PROJECT" ("PROJECT_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WORK
--------------------------------------------------------

  ALTER TABLE "WORK" ADD CONSTRAINT "FK_MEMBER_TO_WORK_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "MEMBER" ("USER_NO") ENABLE;
