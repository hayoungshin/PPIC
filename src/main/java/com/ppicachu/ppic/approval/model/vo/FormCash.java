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
public class FormCash {
	private int approvalNo;
	
	private String account;
	private String userHistory;
	private int price;
	private int formNo;
	
	private ArrayList<FormCash> fcaList;
}
