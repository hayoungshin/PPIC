package com.ppicachu.ppic.mail.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.mail.model.vo.Mail;
import com.ppicachu.ppic.mail.model.vo.MailAttachment;
import com.ppicachu.ppic.mail.model.vo.MailStatus;

public interface MailService {
	
	// 1. 메일 보내기 서비스
	int sendMail(Mail m, ArrayList<MailAttachment> list, MailStatus status);
	
	// 2. 받은메일 리스트 조회 서비스
	int selectRecieveListCount(String userMail);
	ArrayList<MailStatus> selectRecieveList(PageInfo pi, String userMail);
	// 3. 받은메일 상세 조회 서비스
	int selectReadStatus(MailStatus status);
	int updateReadDate(MailStatus status);
	Mail selectRecieve(MailStatus status);
	ArrayList<MailAttachment> selectAttachmentList(int mailNo);
	
	// 4. 보낸메일 리스트 조회 서비스
	int selectSendListCount(String userMail);
	ArrayList<MailStatus> selectSendList(PageInfo pi, String userMail);
	// 5. 보낸메일 상세 조회 서비스
	Mail selectSend(int mailNo);
	
	// 6. 중요메일 리스트 조회 서비스
	int selectImportantListCount(String userMail);
	ArrayList<MailStatus> selectImportantList(PageInfo pi, String userMail);
}
