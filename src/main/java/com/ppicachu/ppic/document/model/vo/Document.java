package com.ppicachu.ppic.document.model.vo;

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
public class Document {
	private int docNo;
	private String docType;
	private String docName;
	private String savePath;
	private String originName;
	private String createUser;
	private String createDate;
	private String modifyDate;
	private String deleteStatus;
}

