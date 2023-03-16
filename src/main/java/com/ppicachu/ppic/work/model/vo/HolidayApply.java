package com.ppicachu.ppic.work.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class HolidayApply {
	
	private int holiNo;
	private int userNo;
	private int give;
	private String date;
	private String cause;
	private String remain;

}
