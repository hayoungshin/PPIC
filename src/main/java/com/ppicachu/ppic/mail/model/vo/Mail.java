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
}
