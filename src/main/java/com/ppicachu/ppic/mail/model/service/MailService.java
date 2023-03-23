package com.ppicachu.ppic.mail.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.mail.model.vo.Mail;
import com.ppicachu.ppic.mail.model.vo.MailAttachment;

public interface MailService {
	
	// 1. 메일 보내기 서비스
	int sendMail(Mail m, ArrayList<MailAttachment> list);

}
