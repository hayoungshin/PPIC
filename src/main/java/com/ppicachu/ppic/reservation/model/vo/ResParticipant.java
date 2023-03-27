package com.ppicachu.ppic.reservation.model.vo;

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
public class ResParticipant {
	private String resNo;
	private String userNo;
	private String rType;
	
	private String userName;
	private String deptNo;
	private String deptName;
	private String position;
}
