package com.ppicachu.ppic.work.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Holiday {
	
	private int holidayNo;
	private int userNo;
	private String type;
	private String sort;
	private String start;
	private String finish;
	private String datea;
	private String reason;
	private String status;
	private String userName;

}
