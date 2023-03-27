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
	
	// 받은 메일 리스트 조회용
	private String mailTitle;
	private String sentDate;
	private String attachmentStatus;	// 0|1
	
	private String[] recipientArr;
	
	// 리스트에서 체크된 mailNo 받아오기 위해
	private int[] mailNoArr;
}
