package com.ppicachu.ppic.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MailStatus {
	
	private int mailNo;
	private String senderMail;
	private String recipientMail;
	private String mailType;		// 1받은 2참조 3숨은참조
	private String readDate;		// 읽음 여부
	private String binStatus;
	private String importantStatus;
	private String deleteDate;		// 삭제예정일
	
}
