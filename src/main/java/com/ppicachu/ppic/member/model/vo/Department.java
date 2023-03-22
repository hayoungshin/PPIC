package com.ppicachu.ppic.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Department {
	
	private int departmentNo;
	private String departmentName;
	
	private int memCount;
}
