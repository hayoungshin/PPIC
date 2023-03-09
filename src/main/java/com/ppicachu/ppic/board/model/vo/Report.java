package com.ppicachu.ppic.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Report {

	private int reportNo;
	private int reportBno;
	private int reportMno;
	private String reportKind;
	private String reportContent;
	private String reportDate;
	private String modifyDate;
	private String reportSta;
	private String status;
	private String boardTitle;
}
