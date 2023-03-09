package com.ppicachu.ppic.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkController {
	
	/* 단순 페이지 오픈 */
	
	/* 근무 메인 */
	@RequestMapping("workMain.wo")
	public String workMain() {
		return "work/workMainView";
	}
	
	/* 근무_출퇴근기록 */
	@RequestMapping("workList.wo")
	public String workList() {
		return "work/workCalendarView";
	}
	
	/* 근무_올해근무정보 */
	@RequestMapping("workInfo.wo")
	public String workInfo() {
		return "work/workYearView";
	}
	
	/* 근무_휴가현황 */
	@RequestMapping("holiInfo.ho")
	public String holiInfo() {
		return "work/holidayInfoView";
	}
	
	/* 근무_휴가신청 */
	@RequestMapping("holiApply.ho")
	public String holidayEnroll() {
		return "work/holidayEnrollForm";
	}
	
	/* 근무_구성원근무 */
	@RequestMapping("memberWork.wo")
	public String memberwork() {
		return "work/workMemberView";
	}
	
	/* 근무_전사원휴가현황 */
	@RequestMapping("memberHoli.ho")
	public String memberHoli() {
		return "work/holidayMemberView";
	}
	
	/* 근무_휴가지급 */
	@RequestMapping("holiGive.ho")
	public String holiGive() {
		return "work/holidayGiveForm";
	}
	
	/* 근무_휴가승인 */
	@RequestMapping("holiApprove.ho")
	public String holiApprove() {
		return "work/holidayApproveView";
	}

}
