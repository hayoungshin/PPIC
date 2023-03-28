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
public class Approval {
	private int approvalNo;
	private String department;
	private String position;
	private int userNo;
	private String userName;
	private String form;
	private String title;
	private String originName;
	private String approvalStatus;
	private int currentOrder;
	private int finalOrder;
	private String createDate;
	private String completeDate;
	private String completeNo;
	private String bookmark;
	
	private String tem;
	
	private String agrUserName;
	private String refUserName;
	private String period;
	private String orderBy;
	
	private int[] delAttNo;
	private String[] delAttName;
}
