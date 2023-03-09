package com.ppicachu.ppic.comschedule.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Comschedule {

	private int schNo;
	private String schKind;
	private String restdayKind;
	private String schName;
	private String schContent;
	private String schLocation;
	private String lunarSolar;
	private String startDate;
	private String endDate;
	private String annual;
	private String startTime;
	private String endTime;
	private String allday;
	private String legalholiday;
}
