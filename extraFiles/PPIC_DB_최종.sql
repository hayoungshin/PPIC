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
CREATE TABLE "dept" (
	"department_no"	NUMBER		NOT NULL,
	"department_name"	VARCHAR2(10)		NOT NULL
);

CREATE TABLE "member" (
	"user_no"	NUMBER		NOT NULL,
	"user_id"	VARCHAR2(30)		NOT NULL,
	"user_pwd"	VARCHAR2(100)		NOT NULL,
	"user_name"	VARCHAR2(15)		NOT NULL,
	"mail"	VARCHAR2(40)		NOT NULL,
	"phone"	VARCHAR2(11)		NULL,
	"address"	VARCHAR2(100)		NULL,
	"company"	VARCHAR2(30)	DEFAULT '삑카츄'	NOT NULL,
	"position"	NUMBER		NOT NULL,
	"department"	NUMBER		NOT NULL,
	"employee_no"	VARCHAR2(10)		NULL,
	"profile_img"	VARCHAR2(200)		NULL,
	"hire_date"	DATE		NULL,
	"resign_date"	DATE		NULL,
	"status"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"authority_no"	NUMBER		NULL,
	"member_sign"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"conn_sta"	VARCHAR2(1)		NULL
);

COMMENT ON COLUMN "member"."conn_sta" IS '접속상태(0온라인/1오프라인/2부재중)';

CREATE TABLE "approval" (
	"approval_no"	number		NULL,
	"complete_no"	varchar2(20)	UNIQUE	NULL,
	"user_no"	number		NULL,
	"department_no"	number		NULL,
	"position_no"	number		NULL,
	"form"	varchar2(30)		NOT NULL,
	"title"	varchar2(100)		NOT NULL,
	"create_date"	varchar2(20)	DEFAULT SYSDATE	NULL,
	"complete_date"	varchar2(20)		NULL,
	"current_order"	number	DEFAULT 0	NULL,
	"final_order"	number		NOT NULL,
	"approval_status"	varchar2(20)	DEFAULT '대기'	NULL,
	"status"	varchar2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "approval"."approval_no" IS '전자결재번호';

COMMENT ON COLUMN "approval"."complete_no" IS '문서번호';

COMMENT ON COLUMN "approval"."user_no" IS '회원번호';

COMMENT ON COLUMN "approval"."department_no" IS '부서번호';

COMMENT ON COLUMN "approval"."position_no" IS '직급번호';

COMMENT ON COLUMN "approval"."form" IS '문서양식';

COMMENT ON COLUMN "approval"."title" IS '제목';

COMMENT ON COLUMN "approval"."create_date" IS '작성일';

COMMENT ON COLUMN "approval"."complete_date" IS '완료일';

COMMENT ON COLUMN "approval"."current_order" IS '진행순서';

COMMENT ON COLUMN "approval"."final_order" IS '최종순서';

COMMENT ON COLUMN "approval"."approval_status" IS '결재상태';

COMMENT ON COLUMN "approval"."status" IS '상태';

CREATE TABLE "form_draft" (
	"approval_no"	number		NULL,
	"effective_date"	varchar2(20)		NOT NULL,
	"department_no"	number		NULL,
	"content"	varchar2(4000)		NOT NULL
);

COMMENT ON COLUMN "form_draft"."approval_no" IS '전자결재번호';

COMMENT ON COLUMN "form_draft"."effective_date" IS '시행일자';

COMMENT ON COLUMN "form_draft"."department_no" IS '협조부서';

COMMENT ON COLUMN "form_draft"."content" IS '내용';

CREATE TABLE "form_transfer" (
	"approval_no"	number		NULL,
	"effective_date"	varchar2(20)		NOT NULL,
	"user_name"	varchar2(20)		NOT NULL,
	"department_name"	varchar2(20)		NOT NULL,
	"current_position"	varchar2(20)		NOT NULL,
	"promote_position"	varchar2(20)		NOT NULL,
	"remark"	varchar2(200)		NULL
);

COMMENT ON COLUMN "form_transfer"."approval_no" IS '전자결재번호';

COMMENT ON COLUMN "form_transfer"."effective_date" IS '시행일자';

COMMENT ON COLUMN "form_transfer"."user_name" IS '이름';

COMMENT ON COLUMN "form_transfer"."department_name" IS '부서명';

COMMENT ON COLUMN "form_transfer"."current_position" IS '현직급';

COMMENT ON COLUMN "form_transfer"."promote_position" IS '승진직급';

COMMENT ON COLUMN "form_transfer"."remark" IS '비고';

CREATE TABLE "form_consume" (
	"approval_no"	number		NULL,
	"name"	varchar2(50)		NOT NULL,
	"reason"	varchar2(200)		NOT NULL,
	"unit"	varchar2(50)		NOT NULL,
	"count"	number		NOT NULL,
	"price"	number		NOT NULL
);

COMMENT ON COLUMN "form_consume"."approval_no" IS '전자결재번호';

COMMENT ON COLUMN "form_consume"."name" IS '품명';

COMMENT ON COLUMN "form_consume"."reason" IS '사유';

COMMENT ON COLUMN "form_consume"."unit" IS '단위';

COMMENT ON COLUMN "form_consume"."count" IS '수량';

COMMENT ON COLUMN "form_consume"."price" IS '단가';

CREATE TABLE "position" (
	"position_no"	NUMBER		NOT NULL,
	"postiion_name"	VARCHAR2(10)		NOT NULL
);

CREATE TABLE "form_cash" (
	"approval_no"	number		NULL,
	"account"	varchar2(20)		NOT NULL,
	"use_history"	varchar2(200)		NOT NULL,
	"price"	number		NOT NULL,
	"vat"	number	DEFAULT 0	NULL
);

COMMENT ON COLUMN "form_cash"."approval_no" IS '전자결재번호';

COMMENT ON COLUMN "form_cash"."account" IS '거래처';

COMMENT ON COLUMN "form_cash"."use_history" IS '사용내역';

COMMENT ON COLUMN "form_cash"."price" IS '금액';

COMMENT ON COLUMN "form_cash"."vat" IS '부가가치세';

CREATE TABLE "app_change" (
	"change_no"	number		NULL,
	"approval_no"	number		NULL,
	"user_no"	number		NULL,
	"content"	varchar2(200)		NOT NULL,
	"create_date"	varchar2(20)	DEFAULT SYSDATE	NULL,
	"role"	varchar2(10)		NOT NULL,
	"status"	varchar2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "app_change"."change_no" IS '변경사항번호';

COMMENT ON COLUMN "app_change"."approval_no" IS '전자결재번호';

COMMENT ON COLUMN "app_change"."user_no" IS '회원번호';

COMMENT ON COLUMN "app_change"."content" IS '내용';

COMMENT ON COLUMN "app_change"."create_date" IS '등록일';

COMMENT ON COLUMN "app_change"."role" IS '역할';

COMMENT ON COLUMN "app_change"."status" IS '상태';

CREATE TABLE "app_process" (
	"approval_no"	number		NULL,
	"user_no"	number		NULL,
	"order"	number		NOT NULL,
	"approval_role"	varchar2(10)		NOT NULL,
	"status"	varchar2(10)		NULL,
	"approval_date"	varchar2(20)		NULL,
	"bookmark"	varchar2(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "app_process"."approval_no" IS '전자결재번호';

COMMENT ON COLUMN "app_process"."user_no" IS '회원번호';

COMMENT ON COLUMN "app_process"."order" IS '순서';

COMMENT ON COLUMN "app_process"."approval_role" IS '결재역할';

COMMENT ON COLUMN "app_process"."status" IS '상태';

COMMENT ON COLUMN "app_process"."approval_date" IS '결재일';

COMMENT ON COLUMN "app_process"."bookmark" IS '중요';

CREATE TABLE "attachment" (
	"attachment_no"	number		NULL,
	"original_name"	varchar2(50)		NOT NULL,
	"change_name"	varchar2(50)		NOT NULL,
	"category"	number		NOT NULL,
	"ref_no"	number		NOT NULL
);

COMMENT ON COLUMN "attachment"."attachment_no" IS '첨부파일번호';

COMMENT ON COLUMN "attachment"."original_name" IS '원본명';

COMMENT ON COLUMN "attachment"."change_name" IS '수정명';

COMMENT ON COLUMN "attachment"."category" IS '첨부파일유형';

COMMENT ON COLUMN "attachment"."ref_no" IS '참조게시글번호';

CREATE TABLE "DOCUMENT" (
	"doc_no"	number		NOT NULL,
	"doc_type"	number		NOT NULL,
	"doc_name"	varchar2(500)		NOT NULL,
	"save_path"	varchar2(1000)		NULL,
	"origin_name"	varchar2(500)		NULL,
	"create_user"	number		NOT NULL,
	"create_date"	date	DEFAULT sysdate	NOT NULL,
	"modify_date"	date	DEFAULT sysdate	NOT NULL,
	"delete_status"	varchar2(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "DOCUMENT"."doc_no" IS '문서번호';

COMMENT ON COLUMN "DOCUMENT"."doc_type" IS '문서타입(1:회사문서/2:개인문서)';

COMMENT ON COLUMN "DOCUMENT"."doc_name" IS '문서명';

COMMENT ON COLUMN "DOCUMENT"."save_path" IS '첨부파일경로';

COMMENT ON COLUMN "DOCUMENT"."origin_name" IS '첨부파일원본명';

COMMENT ON COLUMN "DOCUMENT"."create_user" IS '등록유저번호';

COMMENT ON COLUMN "DOCUMENT"."create_date" IS '등록일';

COMMENT ON COLUMN "DOCUMENT"."modify_date" IS '수정일';

COMMENT ON COLUMN "DOCUMENT"."delete_status" IS '삭제여부(Y: 삭제, N: 삭제X)';

CREATE TABLE "holiday_apply" (
	"holiday_no"	NUMBER		NOT NULL,
	"user_no"	NUMBER		NOT NULL,
	"h_type"	VARCHAR2(5)		NOT NULL,
	"h_sort"	VARCHAR2(5)		NULL,
	"h_start"	VARCHAR2(30)		NOT NULL,
	"h_finish"	VARCHAR2(30)		NOT NULL,
	"h_day"	VARCHAR2(30)		NULL,
	"h_reason"	VARCHAR2(2000)		NOT NULL,
	"status"	VARCHAR2(20)	DEFAULT '승인대기'	NOT NULL
);

COMMENT ON COLUMN "holiday_apply"."h_type" IS '연차 | 반차';

COMMENT ON COLUMN "holiday_apply"."h_sort" IS '오전 | 오후';

COMMENT ON COLUMN "holiday_apply"."status" IS '승인|거절|승인대기';

CREATE TABLE "ROOM" (
	"room_no"	number		NOT NULL,
	"room_name"	varchar2(500)		NOT NULL,
	"create_date"	date	DEFAULT sysdate	NOT NULL,
	"modify_date"	date	DEFAULT sysdate	NOT NULL,
	"create_user"	number		NOT NULL,
	"delete_status"	varchar2(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "ROOM"."room_no" IS '회의실번호';

COMMENT ON COLUMN "ROOM"."room_name" IS '회의실명';

COMMENT ON COLUMN "ROOM"."create_date" IS '등록일';

COMMENT ON COLUMN "ROOM"."modify_date" IS '수정일';

COMMENT ON COLUMN "ROOM"."create_user" IS '등록유저';

COMMENT ON COLUMN "ROOM"."delete_status" IS '삭제여부(Y: 삭제, N: 삭제X)';

CREATE TABLE "work" (
	"work_no"	NUMBER		NOT NULL,
	"user_no"	NUMBER		NOT NULL,
	"work_date"	VARCHAR2(30)		NOT NULL,
	"work_in"	VARCHAR2(30)	DEFAULT SYSDATE	NULL,
	"work_out"	VARCHAR2(30)	DEFAULT SYSDATE	NULL,
	"work_time"	VARCHAR2(30)	DEFAULT SYSDATE	NULL,
	"status"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "work"."work_time" IS '하루 몇시간';

COMMENT ON COLUMN "work"."status" IS '정상 | 지각 | 조퇴 | 결근 | 휴가';

CREATE TABLE "CAR" (
	"car_code"	number		NOT NULL,
	"car_name"	varchar2(300)		NOT NULL,
	"car_number"	varchar2(100)		NOT NULL,
	"create_date"	date	DEFAULT sysdate	NOT NULL,
	"modify_date"	date	DEFAULT sysdate	NOT NULL,
	"create_user"	number		NOT NULL,
	"delete_status"	varchar2(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "CAR"."car_code" IS '차량코드';

COMMENT ON COLUMN "CAR"."car_name" IS '법인차량명';

COMMENT ON COLUMN "CAR"."car_number" IS '법인차량번호';

COMMENT ON COLUMN "CAR"."create_date" IS '등록일';

COMMENT ON COLUMN "CAR"."modify_date" IS '수정일';

COMMENT ON COLUMN "CAR"."create_user" IS '등록유저';

COMMENT ON COLUMN "CAR"."delete_status" IS '삭제여부(Y: 삭제, N: 삭제X)';

CREATE TABLE "RES_ROOM" (
	"res_no"	number		NOT NULL,
	"res_date"	varchar2(100)		NOT NULL,
	"start_time"	varchar2(100)		NOT NULL,
	"end_time"	varchar2(100)		NOT NULL,
	"subject"	varchar2(1000)		NOT NULL,
	"room_no"	number		NOT NULL,
	"res_user"	number		NOT NULL,
	"create_date"	date	DEFAULT sysdate	NOT NULL,
	"modify_date"	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN "RES_ROOM"."res_no" IS '예약번호';

COMMENT ON COLUMN "RES_ROOM"."res_date" IS '예약날짜';

COMMENT ON COLUMN "RES_ROOM"."start_time" IS '예약시작시간';

COMMENT ON COLUMN "RES_ROOM"."end_time" IS '예약종료시간';

COMMENT ON COLUMN "RES_ROOM"."subject" IS '회의명';

COMMENT ON COLUMN "RES_ROOM"."room_no" IS '예약회의실번호';

COMMENT ON COLUMN "RES_ROOM"."res_user" IS '예약자';

COMMENT ON COLUMN "RES_ROOM"."create_date" IS '예약생성일';

COMMENT ON COLUMN "RES_ROOM"."modify_date" IS '예약수정일';

CREATE TABLE "RES_CAR" (
	"res_no"	number		NOT NULL,
	"rental_date"	varchar2(100)		NOT NULL,
	"rental_time"	varchar2(100)		NOT NULL,
	"return_date"	varchar2(100)		NOT NULL,
	"return_time"	varchar2(100)		NOT NULL,
	"usage"	varchar2(1000)		NOT NULL,
	"car_code"	number		NOT NULL,
	"res_user"	number		NOT NULL,
	"create_date"	date	DEFAULT sysdate	NOT NULL,
	"modify_date"	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN "RES_CAR"."res_no" IS '예약번호';

COMMENT ON COLUMN "RES_CAR"."rental_date" IS '대여일';

COMMENT ON COLUMN "RES_CAR"."rental_time" IS '대여시간';

COMMENT ON COLUMN "RES_CAR"."return_date" IS '반납일';

COMMENT ON COLUMN "RES_CAR"."return_time" IS '반납시간';

COMMENT ON COLUMN "RES_CAR"."usage" IS '사용용도';

COMMENT ON COLUMN "RES_CAR"."car_code" IS '대여차량코드';

COMMENT ON COLUMN "RES_CAR"."res_user" IS '예약자번호';

COMMENT ON COLUMN "RES_CAR"."create_date" IS '예약생성일';

COMMENT ON COLUMN "RES_CAR"."modify_date" IS '예약수정일';

CREATE TABLE "PROJECT" (
	"project_no"	number		NOT NULL,
	"project_manager"	number		NOT NULL,
	"project_name"	varchar2(500)		NOT NULL,
	"start_date"	varchar2(100)		NOT NULL,
	"end_date"	varchar2(100)		NOT NULL,
	"detail"	varchar2(4000)		NOT NULL,
	"create_date"	date	DEFAULT sysdate	NOT NULL,
	"modify_date"	date	DEFAULT sysdate	NOT NULL,
	"delete_status"	varchar2(1)		NOT NULL
);

COMMENT ON COLUMN "PROJECT"."project_no" IS '프로젝트번호';

COMMENT ON COLUMN "PROJECT"."project_manager" IS 'PM유저번호(프로젝트생성자)';

COMMENT ON COLUMN "PROJECT"."project_name" IS '프로젝트명';

COMMENT ON COLUMN "PROJECT"."start_date" IS '시작일';

COMMENT ON COLUMN "PROJECT"."end_date" IS '종료일';

COMMENT ON COLUMN "PROJECT"."detail" IS '프로젝트 상세내용';

COMMENT ON COLUMN "PROJECT"."create_date" IS '프로젝트생성일';

COMMENT ON COLUMN "PROJECT"."modify_date" IS '프로젝트수정일';

COMMENT ON COLUMN "PROJECT"."delete_status" IS '삭제여부(Y: 삭제, N: 삭제X)';

CREATE TABLE "mail_attachment" (
	"file_no"	NUMBER		NOT NULL,
	"mail_no"	NUMBER		NOT NULL,
	"origin_name"	VARCHAR2(100)		NOT NULL,
	"change_name"	VARCHAR2(200)		NOT NULL
);

CREATE TABLE "TASK" (
	"task_no"	number		NOT NULL,
	"project_no"	number		NOT NULL,
	"assing_user"	number		NOT NULL,
	"task_name"	varchar2(500)		NOT NULL,
	"task_content"	varchar2(4000)		NOT NULL,
	"file_path"	varchar2(1000)		NULL,
	"file_origin_name"	varchar2(500)		NULL,
	"task_status"	varchar2(50)		NOT NULL,
	"create_date"	date	DEFAULT sysdate	NOT NULL,
	"modify_date"	date	DEFAULT sysdate	NOT NULL,
	"delete_status"	varchar2(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "TASK"."task_no" IS '작업번호';

COMMENT ON COLUMN "TASK"."project_no" IS '프로젝트번호';

COMMENT ON COLUMN "TASK"."assing_user" IS '담당자(작업생성자)';

COMMENT ON COLUMN "TASK"."task_name" IS '작업명';

COMMENT ON COLUMN "TASK"."task_content" IS '작업내용';

COMMENT ON COLUMN "TASK"."file_path" IS '첨부파일경로';

COMMENT ON COLUMN "TASK"."file_origin_name" IS '첨부파일원본명';

COMMENT ON COLUMN "TASK"."task_status" IS '작업상태(1:대기, 2:진행중, 3:완료, 4:보류)';

COMMENT ON COLUMN "TASK"."create_date" IS '작업생성일';

COMMENT ON COLUMN "TASK"."modify_date" IS '작업수정일';

COMMENT ON COLUMN "TASK"."delete_status" IS '삭제여부(Y:삭제, N:삭제X)';

CREATE TABLE "address_like" (
	"user_no"	NUMBER		NOT NULL,
	"like_user"	NUMBER		NOT NULL
);

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"NOTICE_WRITER"	NUMBER		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(200)		NOT NULL,
	"NOTICE_CONTENT"	CLOB		NOT NULL,
	"COUNT"	NUMBER	DEFAULT 0	NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"IMPORTANT"	VARCHAR2(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '공지사항번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_WRITER" IS '작성자회원번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_TITLE" IS '공지사항제목';

COMMENT ON COLUMN "NOTICE"."NOTICE_CONTENT" IS '공지사항내용';

COMMENT ON COLUMN "NOTICE"."COUNT" IS '조회수';

COMMENT ON COLUMN "NOTICE"."CREATE_DATE" IS '공지사항작성일';

COMMENT ON COLUMN "NOTICE"."MODIFY_DATE" IS '공지사항수정일';

COMMENT ON COLUMN "NOTICE"."STATUS" IS '공지사항등록상태';

COMMENT ON COLUMN "NOTICE"."IMPORTANT" IS '중요공지사항여부';

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_WRITER"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(200)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"COUNT"	NUMBER	DEFAULT 0	NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"BLIND_STA"	VARCHAR2(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "BOARD"."BOARD_WRITER" IS '작성자회원번호';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '익명게시판제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '익명게시판내용';

COMMENT ON COLUMN "BOARD"."COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."CREATE_DATE" IS '익명게시판작성일';

COMMENT ON COLUMN "BOARD"."MODIFY_DATE" IS '익명게시판수정일';

COMMENT ON COLUMN "BOARD"."STATUS" IS '익명게시판등록상태';

COMMENT ON COLUMN "BOARD"."BLIND_STA" IS '블라인드여부';

CREATE TABLE "CHAT" (
	"CHAT_NO"	NUMBER		NOT NULL,
	"ROOM_NO"	NUMBER		NOT NULL,
	"SEND_NO"	NUMBER		NOT NULL,
	"CHAT_CONTENT"	VARCHAR2(3000)		NOT NULL,
	"SEND_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"NOT_READ"	NUMBER		NULL
);

COMMENT ON COLUMN "CHAT"."CHAT_NO" IS '채팅번호';

COMMENT ON COLUMN "CHAT"."ROOM_NO" IS '채팅방번호';

COMMENT ON COLUMN "CHAT"."SEND_NO" IS '발신자회원번호';

COMMENT ON COLUMN "CHAT"."CHAT_CONTENT" IS '채팅내용';

COMMENT ON COLUMN "CHAT"."SEND_DATE" IS '채팅전송시간';

COMMENT ON COLUMN "CHAT"."NOT_READ" IS '읽지않은회원수';

CREATE TABLE "NOTIFICATION" (
	"NF_NO"	NUMBER		NOT NULL,
	"SEND_NO"	NUMBER		NOT NULL,
	"RECEIVE_NO"	NUMBER		NOT NULL,
	"CAT_NO"	NUMBER		NOT NULL,
	"DCAT_NO"	NUMBER		NOT NULL,
	"NF_CONTENT"	VARCHAR2(2000)		NULL,
	"NF_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"CHECK_STA"	VARCHAR2(1)	DEFAULT 'N'	NULL,
	"DELETE_STA"	VARCHAR2(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "NOTIFICATION"."NF_NO" IS '알림번호';

COMMENT ON COLUMN "NOTIFICATION"."SEND_NO" IS '발신자회원번호';

COMMENT ON COLUMN "NOTIFICATION"."RECEIVE_NO" IS '수신자회원번호(1,2,3...)';

COMMENT ON COLUMN "NOTIFICATION"."CAT_NO" IS '카테고리번호';

COMMENT ON COLUMN "NOTIFICATION"."DCAT_NO" IS '세부카테고리번호';

COMMENT ON COLUMN "NOTIFICATION"."NF_CONTENT" IS '알림내용';

COMMENT ON COLUMN "NOTIFICATION"."NF_DATE" IS '알림시간';

COMMENT ON COLUMN "NOTIFICATION"."CHECK_STA" IS '조회여부';

COMMENT ON COLUMN "NOTIFICATION"."DELETE_STA" IS '삭제여부';

CREATE TABLE "LIKEHATE" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"STATUS"	VARCHAR2(1)		NOT NULL
);

COMMENT ON COLUMN "LIKEHATE"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "LIKEHATE"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "LIKEHATE"."STATUS" IS '좋아요(0)/싫어요(1)';

CREATE TABLE "REPORT" (
	"REPORT_BNO"	NUMBER		NOT NULL,
	"REPORT_MNO"	NUMBER		NOT NULL,
	"REPORT_KIND"	VARCHAR2(1)		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"REPORT_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE		NULL,
	"REPORT_STA"	VARCHAR2(1)	DEFAULT 0	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "REPORT"."REPORT_BNO" IS '신고게시글번호';

COMMENT ON COLUMN "REPORT"."REPORT_MNO" IS '신고자회원번호';

COMMENT ON COLUMN "REPORT"."REPORT_KIND" IS '신고구분';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';

COMMENT ON COLUMN "REPORT"."REPORT_DATE" IS '신고일';

COMMENT ON COLUMN "REPORT"."MODIFY_DATE" IS '처리일';

COMMENT ON COLUMN "REPORT"."REPORT_STA" IS '처리상태';

COMMENT ON COLUMN "REPORT"."STATUS" IS '등록상태';

CREATE TABLE "CHATROOM" (
	"ROOM_NO"	NUMBER		NOT NULL,
	"ROOM_NAME"	VARCHAR2(1000)		NULL,
	"LAST_CHAT"	VARCHAR2(3000)		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE		NULL
);

COMMENT ON COLUMN "CHATROOM"."ROOM_NO" IS '채팅방번호';

COMMENT ON COLUMN "CHATROOM"."ROOM_NAME" IS '채팅방이름';

COMMENT ON COLUMN "CHATROOM"."LAST_CHAT" IS '마지막채팅';

COMMENT ON COLUMN "CHATROOM"."CREATE_DATE" IS '채팅방생성일';

COMMENT ON COLUMN "CHATROOM"."MODIFY_DATE" IS '채팅방수정일';

CREATE TABLE "authority" (
	"authority_no"	NUMBER		NOT NULL,
	"authority_name"	VARCHAR2(10)		NULL
);

CREATE TABLE "PARTICIPANT" (
	"ROOM_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"NOTREAD_CHAT"	NUMBER		NULL,
	"LASTREAD_CHAT"	NUMBER		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "PARTICIPANT"."ROOM_NO" IS '채팅방번호';

COMMENT ON COLUMN "PARTICIPANT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "PARTICIPANT"."NOTREAD_CHAT" IS '읽지않은채팅수';

COMMENT ON COLUMN "PARTICIPANT"."LASTREAD_CHAT" IS '마지막으로읽은채팅번호';

COMMENT ON COLUMN "PARTICIPANT"."CREATE_DATE" IS '생성일자';

CREATE TABLE "mail" (
	"mail_no"	NUMBER		NOT NULL,
	"sender"	NUMBER		NOT NULL,
	"sender_mail"	VARCHAR2(40)		NOT NULL,
	"recipient_mail"	VARCHAR2(40)		NULL,
	"reference_mail"	VARCHAR2(40)		NULL,
	"hidden_reference_mail"	VARCHAR2(40)		NULL,
	"mail_title"	VARCHAR2(100)	DEFAULT '제목없음'	NULL,
	"mail_content"	CLOB		NULL,
	"sent_date"	DATE	DEFAULT SYSDATE	NULL,
	"temp_status"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "mail"."recipient_mail" IS '이메일,이메일,이메일..';

COMMENT ON COLUMN "mail"."reference_mail" IS '이메일,이메일,이메일..';

COMMENT ON COLUMN "mail"."hidden_reference_mail" IS '이메일,이메일,이메일..';

CREATE TABLE "mail_status" (
	"mail_no"	NUMBER		NOT NULL,
	"sender_mail"	VARCHAR2(40)		NOT NULL,
	"recipient_mail"	VARCHAR2(40)		NULL,
	"mail_type"	NUMBER		NULL,
	"read_date"	DATE		NULL,
	"bin_status"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"important_status"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"delete_date"	DATE		NULL
);

COMMENT ON COLUMN "mail_status"."recipient_mail" IS '보낸메일일 경우 NULL';

COMMENT ON COLUMN "mail_status"."mail_type" IS '1받은메일/2보낸메일/3참조메일/4숨은참조메일';

COMMENT ON COLUMN "mail_status"."read_date" IS '이걸로 읽음여부는 판단가능';

COMMENT ON COLUMN "mail_status"."delete_date" IS '스케줄링을 위해서 필요';

CREATE TABLE "holiday" (
	"holi_no"	NUMBER		NOT NULL,
	"user_no"	NUMBER		NOT NULL,
	"h_give"	number		NULL,
	"h_date"	varchar2(30)	DEFAULT sysdate	NULL,
	"h_cause"	varchar2(300)		NULL,
	"h_remain"	varchar2(30)		NULL
);

CREATE TABLE "R_PARTICIPANT" (
	"res_no"	number		NOT NULL,
	"user_no"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "R_PARTICIPANT"."res_no" IS '예약번호';

CREATE TABLE "P_PARTICIPANT" (
	"project_no"	number		NULL,
	"task_no"	number		NULL,
	"department_no"	NUMBER		NOT NULL,
	"user_no"	number		NOT NULL
);

COMMENT ON COLUMN "P_PARTICIPANT"."project_no" IS '프로젝트번호';

COMMENT ON COLUMN "P_PARTICIPANT"."task_no" IS '작업번호';

COMMENT ON COLUMN "P_PARTICIPANT"."department_no" IS '프로젝트참여부서';

COMMENT ON COLUMN "P_PARTICIPANT"."user_no" IS '작업자/참조자';

CREATE TABLE "CHAT_LIKE" (
	"MYUSER_NO"	NUMBER		NOT NULL,
	"LIKEUSER_NO"	NUMBER		NOT NULL,
	"LIKE_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "CHAT_LIKE"."MYUSER_NO" IS '기준회원번호';

COMMENT ON COLUMN "CHAT_LIKE"."LIKEUSER_NO" IS '즐겨찾는회원번호';

COMMENT ON COLUMN "CHAT_LIKE"."LIKE_DATE" IS '즐겨찾기추가일';

CREATE TABLE "COMPANY_SCH" (
	"SCH_NO"	NUMBER		NOT NULL,
	"SCH_KIND"	VARCHAR2(1)		NOT NULL,
	"RESTDAY_KIND"	VARCHAR2(1)		NULL,
	"SCH_NAME"	VARCHAR2(500)		NOT NULL,
	"SCH_CONTENT"	VARCHAR2(2000)		NULL,
	"SCH_LOCATION"	VARCHAR2(1000)		NULL,
	"LUNAR_SOLAR"	VARCHAR2(1)		NULL,
	"START_DATE"	VARCHAR2(100)		NULL,
	"END_DATE"	VARCHAR2(100)		NULL,
	"ANNUAL"	VARCHAR2(1)		NULL,
	"START_TIME"	VARCHAR2(100)		NULL,
	"END_TIME"	VARCHAR2(100)		NULL,
	"ALLDAY"	VARCHAR2(1)		NULL,
	"LEGALHOLLIDAY"	VARCHAR2(1)		NULL
);

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

COMMENT ON COLUMN "COMPANY_SCH"."LEGALHOLLIDAY" IS '법정공휴일여부';

ALTER TABLE "dept" ADD CONSTRAINT "PK_DEPT" PRIMARY KEY (
	"department_no"
);

ALTER TABLE "member" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"user_no"
);

ALTER TABLE "approval" ADD CONSTRAINT "PK_APPROVAL" PRIMARY KEY (
	"approval_no"
);

ALTER TABLE "position" ADD CONSTRAINT "PK_POSITION" PRIMARY KEY (
	"position_no"
);

ALTER TABLE "app_change" ADD CONSTRAINT "PK_APP_CHANGE" PRIMARY KEY (
	"change_no"
);

ALTER TABLE "attachment" ADD CONSTRAINT "PK_ATTACHMENT" PRIMARY KEY (
	"attachment_no"
);

ALTER TABLE "DOCUMENT" ADD CONSTRAINT "PK_DOCUMENT" PRIMARY KEY (
	"doc_no"
);

ALTER TABLE "holiday_apply" ADD CONSTRAINT "PK_HOLIDAY_APPLY" PRIMARY KEY (
	"holiday_no",
	"user_no"
);

ALTER TABLE "ROOM" ADD CONSTRAINT "PK_ROOM" PRIMARY KEY (
	"room_no"
);

ALTER TABLE "work" ADD CONSTRAINT "PK_WORK" PRIMARY KEY (
	"work_no"
);

ALTER TABLE "CAR" ADD CONSTRAINT "PK_CAR" PRIMARY KEY (
	"car_code"
);

ALTER TABLE "RES_ROOM" ADD CONSTRAINT "PK_RES_ROOM" PRIMARY KEY (
	"res_no"
);

ALTER TABLE "RES_CAR" ADD CONSTRAINT "PK_RES_CAR" PRIMARY KEY (
	"res_no"
);

ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY (
	"project_no"
);

ALTER TABLE "mail_attachment" ADD CONSTRAINT "PK_MAIL_ATTACHMENT" PRIMARY KEY (
	"file_no"
);

ALTER TABLE "TASK" ADD CONSTRAINT "PK_TASK" PRIMARY KEY (
	"task_no"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY (
	"CHAT_NO"
);

ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "PK_NOTIFICATION" PRIMARY KEY (
	"NF_NO"
);

ALTER TABLE "LIKEHATE" ADD CONSTRAINT "PK_LIKEHATE" PRIMARY KEY (
	"BOARD_NO",
	"MEM_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_BNO",
	"REPORT_MNO"
);

ALTER TABLE "CHATROOM" ADD CONSTRAINT "PK_CHATROOM" PRIMARY KEY (
	"ROOM_NO"
);

ALTER TABLE "authority" ADD CONSTRAINT "PK_AUTHORITY" PRIMARY KEY (
	"authority_no"
);

ALTER TABLE "PARTICIPANT" ADD CONSTRAINT "PK_PARTICIPANT" PRIMARY KEY (
	"ROOM_NO",
	"USER_NO"
);

ALTER TABLE "mail" ADD CONSTRAINT "PK_MAIL" PRIMARY KEY (
	"mail_no"
);

ALTER TABLE "holiday" ADD CONSTRAINT "PK_HOLIDAY" PRIMARY KEY (
	"holi_no"
);

ALTER TABLE "COMPANY_SCH" ADD CONSTRAINT "PK_COMPANY_SCH" PRIMARY KEY (
	"SCH_NO"
);

ALTER TABLE "holiday_apply" ADD CONSTRAINT "FK_member_TO_holiday_apply_1" FOREIGN KEY (
	"user_no"
)
REFERENCES "member" (
	"user_no"
);

ALTER TABLE "LIKEHATE" ADD CONSTRAINT "FK_BOARD_TO_LIKEHATE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "LIKEHATE" ADD CONSTRAINT "FK_member_TO_LIKEHATE_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "member" (
	"user_no"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_BOARD_TO_REPORT_1" FOREIGN KEY (
	"REPORT_BNO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_member_TO_REPORT_1" FOREIGN KEY (
	"REPORT_MNO"
)
REFERENCES "member" (
	"user_no"
);

ALTER TABLE "PARTICIPANT" ADD CONSTRAINT "FK_CHATROOM_TO_PARTICIPANT_1" FOREIGN KEY (
	"ROOM_NO"
)
REFERENCES "CHATROOM" (
	"ROOM_NO"
);

ALTER TABLE "PARTICIPANT" ADD CONSTRAINT "FK_member_TO_PARTICIPANT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "member" (
	"user_no"
);

-- 시퀀스
CREATE SEQUENCE SEQ_CHATROOMNO
NOCACHE; -- 채팅방

CREATE SEQUENCE SEQ_CHATNO
NOCACHE; -- 채팅

CREATE SEQUENCE SEQ_NOTNO
NOCACHE; -- 알림

CREATE SEQUENCE SEQ_BNO
NOCACHE; -- 익명게시판

CREATE SEQUENCE SEQ_NNO
NOCACHE; -- 공지사항

CREATE SEQUENCE SEQ_SCHNO
NOCACHE; -- 회사일정

create sequence seq_atno
NOCACHE; -- 첨부파일(전자결재/공지)

CREATE SEQUENCE SEQ_APNO
NOCACHE; -- 전자결재

CREATE SEQUENCE SEQ_CONO
NOCACHE; -- 결재문서

CREATE SEQUENCE SEQ_CHNO
NOCACHE; -- 변경사항

CREATE SEQUENCE SEQ_MAILNO
NOCACHE; -- 메일

CREATE SEQUENCE SEQ_MAILATCNO
NOCACHE; -- 메일첨부파일

CREATE SEQUENCE SEQ_MEMNO
NOCACHE; -- 멤버

CREATE SEQUENCE SEQ_DEPTNO
NOCACHE; -- 부서

CREATE SEQUENCE SEQ_POSNO
NOCACHE; -- 직급

create sequence seq_hano
NOCACHE; -- 휴가

create sequence seq_hno
NOCACHE; -- 휴가

create sequence seq_wno
NOCACHE; -- 근태
    
create sequence seq_auno
NOCACHE; -- 권한

create sequence seq_pjno
NOCACHE; -- 프로젝트

create sequence seq_tkno
NOCACHE; -- 작업

create sequence seq_rmno
NOCACHE; -- 회의실

create sequence seq_rsrmno
NOCACHE; -- 회의실예약

create sequence seq_carno
NOCACHE; -- 차량코드

create sequence seq_rscno
NOCACHE; -- 차량예약

create sequence seq_docno

NOCACHE; -- 문서번호
