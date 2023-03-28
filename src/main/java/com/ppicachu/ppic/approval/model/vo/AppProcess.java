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
public class AppProcess {
	private int approvalNo;
	private int userNo;
	private String userName;
	private String departmentName;
	private String positionName;
	private int processOrder;
	private String approvalRole;
	private String status;
	private String approvalDate;
	private String bookmark;
}
