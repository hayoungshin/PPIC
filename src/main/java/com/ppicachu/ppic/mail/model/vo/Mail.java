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

	private String[] recipientArr;
	private String[] refArr;
	private String[] hidRefArr;
	
	// 메일 리스트 조회용
	private String importantStatus;	// Y|N
	private String readStatus;		// 0|1
	private String mailType;		// 1받은 2참조 3숨은참조 4받은
	private String attachmentStatus;// 0|1
}
