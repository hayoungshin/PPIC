package com.ppicachu.ppic.work.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.service.WorkService;
import com.ppicachu.ppic.work.model.vo.Holiday;

@Controller
public class WorkController {
	
	@Autowired
	private WorkService wService;
	
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
	
	/* 근무_전사원휴가보유현황 */
	@RequestMapping("memberHoli.ho")
	public String memberHoli(Model model) {
		ArrayList<Member> list = wService.selectHolidayList();
		model.addAttribute("list", list);
		return "work/holidayMemberView";
	}
	
	/* 근무_전사원휴가사용내역 */
	@RequestMapping("memberHoliUse.ho")
	public String memberHoliUse(Model model) {
		ArrayList<Holiday> list = wService.selectHolidayUseList();
		model.addAttribute("list", list);
		return "work/holidayMemberUseView";
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
