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
public class FormDraft {
	private int approvalNo;
	
	private String effectiveDate;
	private String departmentNo;
	private String content;
	private int formNo;
}
