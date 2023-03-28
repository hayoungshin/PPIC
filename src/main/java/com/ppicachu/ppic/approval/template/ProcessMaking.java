package com.ppicachu.ppic.approval.template;

import java.util.ArrayList;

import com.ppicachu.ppic.approval.model.vo.AppProcess;
import com.ppicachu.ppic.approval.model.vo.Approval;

public class ProcessMaking {
	public static ArrayList<AppProcess> makeProcess(Approval a, String agrUserNo, String refUserNo){
		
		// AppProcess 생성
		ArrayList<AppProcess> apList = new ArrayList<>();
		AppProcess ap = new AppProcess(); // 기안자 등록
		ap.setUserName(a.getUserNo() + "");
		ap.setProcessOrder(0);
		ap.setApprovalRole("결재");
		ap.setStatus("승인");
		if(a.getApprovalNo() != 0) {
			ap.setApprovalNo(a.getApprovalNo());
		}
		apList.add(ap);
		String[] agrNoArr = {agrUserNo}; // 결재자 등록
		if(agrUserNo.contains(",")) {
			agrNoArr = agrUserNo.split(",");
		}
		for(int i=0; i<agrNoArr.length; i++) {
			AppProcess ap1 = new AppProcess();
			ap1.setUserName(agrNoArr[i]);
			ap1.setProcessOrder(i + 1);
			ap1.setApprovalRole("결재");
			if(a.getApprovalNo() != 0) {
				ap1.setApprovalNo(a.getApprovalNo());
			}
			apList.add(ap1);
		}
		if(refUserNo != null) {
			String[] refNoArr = {refUserNo}; // 참조자 등록
			if(refUserNo.contains(",")) {
				refNoArr = refUserNo.split(",");
			}
			for(int j=0; j<refNoArr.length; j++) {
				AppProcess ap2 = new AppProcess();
				ap2.setUserName(refNoArr[j]);
				ap2.setProcessOrder(0);
				ap2.setApprovalRole("참조");
				if(a.getApprovalNo() != 0) {
					ap2.setApprovalNo(a.getApprovalNo());
				}
				apList.add(ap2);
			}
		}
		
		return apList;
	}
}
