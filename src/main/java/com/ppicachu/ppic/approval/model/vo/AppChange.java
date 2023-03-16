package com.ppicachu.ppic.approval.model.vo;

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
public class AppChange {
	private int changeNo;
	private String userName;
	private String departmentName;
	private String positionName;
	private String content;
	private String createDate;
	private String role;
}
