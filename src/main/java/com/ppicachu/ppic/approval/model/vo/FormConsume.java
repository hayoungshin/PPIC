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
public class FormConsume {
	private int approvalNo;
	
	private String name;
	private String reason;
	private String unit;
	private int count;
	private int price;
	private int formNo;
	
	private ArrayList<FormConsume> fcoList;
}
