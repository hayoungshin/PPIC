package com.ppicachu.ppic.work.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.service.WorkService;
import com.ppicachu.ppic.work.model.vo.Holiday;
import com.ppicachu.ppic.work.model.vo.HolidayApply;
import com.ppicachu.ppic.work.model.vo.Work;

@Controller
public class WorkController {
	
	@Autowired
	private WorkService wService;
	
	@Autowired
	private MemberService mService;
	
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
	
	@RequestMapping("holiEnroll.ho")
	public String holiApplyEnroll(Holiday h) {
		
		int result = wService.holiApplyEnroll(h);
		
		return "redirect:holiApply.ho";		
	}
	
	/* 근무_구성원근무 */
	@RequestMapping("memberWork.wo")
	public String memberwork(Model model) {
		// 사용자 리스트
		ArrayList<Member> list1 = mService.selectListMember();
		// 휴가 
		ArrayList<Member> list2 = wService.selectHolidayList();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
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
	public String holiGive(Model model, HttpSession session) {
		
		ArrayList<Member> list1 = mService.selectListMember();
		model.addAttribute("list1", list1);
		ArrayList<Department> list2 = mService.selectDeptList();
		session.setAttribute("list2", list2);
		
		return "work/holidayGiveForm";
	}
	
	/* 근무_휴가승인 */
	@RequestMapping("holiApprove.ho")
	public String holiApprove(Model model) {
		
		ArrayList<Holiday> list = wService.selectBeforeUseList(); 
		model.addAttribute("list",list);
		
		return "work/holidayApproveView";
	}
	
	// home 출근기록 조회하기 
	@ResponseBody
	@RequestMapping(value="workRecord.wo", produces="application/json; charset=utf-8")
	public String ajaxSelectWork(int no, Model model) {
      
      Work w = wService.selectWorkRecord(no);
      
      HashMap<String,Object> map = new HashMap<String,Object>();
      map.put("w", w);
      
	  return new Gson().toJson(map);
	}
	
	// home 출근등록하기 
	@ResponseBody
	@RequestMapping(value="workIn.wo", produces="application/json; charset=utf-8" )
	public void ajaxUpdateWorkIn(int no){
		
		int result = wService.updateWorkIn(no);
	}

	// home 퇴근등록하기 
	@ResponseBody
	@RequestMapping(value="workOut.wo", produces="application/json; charset=utf-8" )
	public void ajaxUpdateWorkOut(int no){
		
		int result = wService.updateWorkOut(no);
		
		}

	@ResponseBody
	@RequestMapping(value="selectHoliList.ho", produces="application/json; charset=utf-8")
	public String ajaxSelectHoliList(int no, Model model) {
      
      ArrayList<Holiday> list = wService.selectHoliList(no);
      
      
      HashMap<String,Object> map = new HashMap<String,Object>();
      map.put("list", list);
      
      
	  return new Gson().toJson(map);
	}
	
	
	
	
	
	
	
	
	
	
}
