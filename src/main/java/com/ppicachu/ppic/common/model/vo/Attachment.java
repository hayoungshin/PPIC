package com.ppicachu.ppic.common.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Attachment {
	
	private int attachmentNo;
	private String originName;
	private String changeName;
	private int categoryNo;
	private int refNo;

}
