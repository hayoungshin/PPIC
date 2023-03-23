package com.ppicachu.ppic.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MailAttachment {

	private int fileNo;
	private int mailNo;
	private String originName;
	private String changeName;
	
}
