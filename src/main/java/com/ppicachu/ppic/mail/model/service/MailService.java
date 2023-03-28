package com.ppicachu.ppic.mail.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.mail.model.vo.Mail;
import com.ppicachu.ppic.mail.model.vo.MailAttachment;
import com.ppicachu.ppic.mail.model.vo.MailStatus;

public interface MailService {
	
	// 1. 메일 보내기 서비스
	int sendMail(Mail m, ArrayList<MailAttachment> list, MailStatus status);
	// 1-1. 임시저장 서비스
	int tempSaveMail(Mail m);
	
	// 2. 받은메일 리스트 조회 서비스
	int selectRecieveListCount(String userMail);
	int selectUnreadRecieveListCount(String userMail);
	int selectImportantRecieveListCount(String userMail);
	int selectToMeRecieveListCount(String userMail);
	int selectAtcRecieveListCount(String userMail);
	ArrayList<MailStatus> selectRecieveList(PageInfo pi, String userMail);
	ArrayList<MailStatus> selectUnreadRecieveList(PageInfo pi, String userMail);
	ArrayList<MailStatus> selectImportantRecieveList(PageInfo pi, String userMail);
	ArrayList<MailStatus> selectToMeRecieveList(PageInfo pi, String userMail);
	ArrayList<MailStatus> selectAtcRecieveList(PageInfo pi, String userMail);
	// 3. 받은메일 상세 조회 서비스
	int selectReadStatus(MailStatus status);
	int updateReadDate(MailStatus status);
	Mail selectRecieve(MailStatus status);
	ArrayList<MailAttachment> selectAttachmentList(int mailNo);
	
	// 4. 보낸메일 리스트 조회 서비스
	int selectSendListCount(String userMail);
	int selectImportantSendListCount(String userMail);
	int selectAtcSendListCount(String userMail);
	ArrayList<MailStatus> selectSendList(PageInfo pi, String userMail);
	ArrayList<MailStatus> selectImportantSendList(PageInfo pi, String userMail);
	ArrayList<MailStatus> selectAtcSendList(PageInfo pi, String userMail);
	// 5. 보낸메일 상세 조회 서비스
	Mail selectSend(int mailNo);
	
	// 6. 중요메일 리스트 조회 서비스
	int selectImportantListCount(String userMail);
	ArrayList<MailStatus> selectImportantList(PageInfo pi, String userMail);
	ArrayList<MailStatus> selectImportantListOlder(PageInfo pi, String userMail);
	
	// 7. 중요메일 해제,등록 서비스
	int deleteImportantStatus(MailStatus status);
	int updateImportantStatus(MailStatus status);
	
	// 8. 메일 삭제 서비스 : binStatus 업데이트, 삭제예정일 업데이트
	int deleteMail(MailStatus status);
	
	// 9. 안읽음으로 표시 서비스
	int updateReadNull(MailStatus status);
	
	// 10. 휴지통 리스트 조회 서비스
	int selectBinListCount(String userMail);
	ArrayList<MailStatus> selectBinList(PageInfo pi, String userMail);
	
	// 11. 임시저장 리스트 조회 서비스
	int selectTempListCount(String userMail);
	ArrayList<Mail> selectTempList(PageInfo pi, String userMail);
	// 12. 임시저장 상세 조회 서비스 : 작성 폼
	Mail selectTemp(int mailNo);
	// 13. 임시저장 삭제 서비스
	int deleteTemp(MailStatus status);
	
	// 14. 메일 복구 서비스
	int recoverMail(MailStatus status);

	// 메일 영구삭제 서비스 (스케줄러)
	int completeDeleteMail();

}
