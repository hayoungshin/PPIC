package com.ppicachu.ppic.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Mail {
	
	private int mailNo;
	private int sender;
	private String senderMail;
	private String recipientMail;
	private String refMail;
	private String hidRefMail;
	private String mailTitle;
	private String mailContent;
	private String sentDate;
	private String tempStatus;

	private String importantStatus;	// mail_status 테이블의 컬럼임
	private String mailType;		// mail_status 테이블의 컬럼임 : 1받은 2참조 3숨은참조
	
	private String[] recipientArr;
	private String[] refArr;
	private String[] hidRefArr;
}
