package com.ppicachu.ppic.approval.model.vo;

import java.util.ArrayList;

import com.ppicachu.ppic.common.model.vo.Attachment;

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
public class AppDetail {
	private int approvalNo;
	
	// 결재 테이블 1 : 1
	private Approval app;
	
	// 양식 테이블
	private FormDraft draft;					// - 1 : 1
	private ArrayList<FormTransfer> transfer;	// - 1 : N
	private ArrayList<FormConsume> consume;		// - 1 : N
	private ArrayList<FormCash> cash;			// - 1 : N
	
	// 결재선 테이블 1 : N
	private ArrayList<AppProcess> process;
	
	// 첨부파일 테이블 1 : N
	private ArrayList<Attachment> att;
}
