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
	ArrayList<Mail> selectRecieveList(PageInfo pi, String userMail);

}
