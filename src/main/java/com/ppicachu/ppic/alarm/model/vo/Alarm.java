package com.ppicachu.ppic.alarm.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Alarm {

	private String nfNo;
	private String sendNo;
	private String receiveNo;
	private String catNo;
	private String dcatNo;
	private String nfContent;
	private String nfDate;
	private String checkSta;
	private String deleteSta;
	private String nfCount;
}
