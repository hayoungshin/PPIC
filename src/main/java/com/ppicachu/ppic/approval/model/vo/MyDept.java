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
public class MyDept {
	private int myi; // 개인_기안_진행중
	private int agr; // 승인필요
	private int mye; // 개인_기안_완료
	private int myt; // 개인_기안_임시저장
	private int myr; // 개인_참조
	private int myb; // 개인_중요
	
	private int dpi; // 부서_진행중
	private int dpe; // 부서_완료
	
	private int a; // 전체관리
	private int d; // 삭제관리
}
