package com.ppicachu.ppic.approval.model.vo;

import java.util.ArrayList;

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
public class FormTransfer {
	private String effectiveDate;
	private String userName;
	private String departmentName;
	private String currentPosition;
	private String promotePosition;
	private String remark;
	private int formNo;
	
	private ArrayList<FormTransfer> ftrList;
}
