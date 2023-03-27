package com.ppicachu.ppic.work.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

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
	public String workMain(int no, Model model) {
		
		ArrayList<Work> list1 = wService.selectMemberWorkList(no);
		model.addAttribute("list1", list1);
		
		Work w  = wService.countWorkStatus(no);
		model.addAttribute("w", w);
		Member m = wService.selectMemberHoliday(no);
		model.addAttribute("m",m);
		
		return "work/workMainView";
	}
	
	/* 근무_출퇴근기록 */
	@RequestMapping("workList.wo")
	public String workList(int no, Model model) {
		
		ArrayList<Work> list = wService.workCalendar(no);
	      model.addAttribute("list",list);
		
		return "work/workCalendarView";
	}
	
	/* 근무_올해근무정보 */
	@RequestMapping("workInfo.wo")
	public String workInfo() {
		return "work/workYearView";
	}
	
	/* 근무_휴가현황 */
	@RequestMapping("holiInfo.ho")
	public String holiInfo(int no, Model model) {
		Member m = wService.selectMemberHoliday(no);
		model.addAttribute("m",m);
		ArrayList<Holiday> list = wService.selectMemberHolidayList(no);
		model.addAttribute("list", list);
		
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
		return "work/workMemberView";
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxMemberList.wo", produces="application/json; charset=utf-8")
	public String ajaxMemberList(Model model) {
		ArrayList<Member> mlist = wService.selectAllMember();
		ArrayList<Member> hlist = wService.selectHolidayList();
		ArrayList<Member> wlist = wService.selectWorkCountList();
		ArrayList<Member> tlist = wService.selectTimeCountList();
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("mlist", mlist);
		map.put("hlist", hlist);
		map.put("wlist", wlist);
		map.put("tlist", tlist);
		
		return new Gson().toJson(map);
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
		Work w = new Work();
		w.setUserNo(no);
		w.setConnSta(0);
		
		wService.updateConnSta(w);
		
	}
	
	// home 출근등록하기 (지각)
	@ResponseBody
	@RequestMapping(value="workInLate.wo", produces="application/json; charset=utf-8" )
	public void ajaxUpdateWorkInLate(int no){
		int result = wService.updateWorkInLate(no);
		
		Work w = new Work();
		w.setUserNo(no);
		w.setConnSta(0);
		
		wService.updateConnSta(w);
		
		
	}

	// home 퇴근등록하기 
	@ResponseBody
	@RequestMapping(value="workOut.wo", produces="application/json; charset=utf-8" )
	public void ajaxUpdateWorkOut(int no){
		int result = wService.updateWorkOut(no);
		
		Work w = new Work();
		w.setUserNo(no);
		w.setConnSta(1);
		
		wService.updateConnSta(w);
		
		if (result>0) {
			int timeup = wService.updateWorkTime(no);
		}
	}
	
	// home 퇴근등록하기 (조퇴)
	@ResponseBody
	@RequestMapping(value="workOutEarly.wo", produces="application/json; charset=utf-8" )
	public void ajaxUpdateWorkOutEarly(int no){
		int result = wService.updateWorkOutEarly(no);
		
		Work w = new Work();
		w.setUserNo(no);
		w.setConnSta(1);
		
		wService.updateConnSta(w);
		
		if (result>0) {
			int timeup = wService.updateWorkTime(no);
		}
		
	}

	// 사용자 예정 휴가 조회하기 
	@ResponseBody
	@RequestMapping(value="selectHoliList.ho", produces="application/json; charset=utf-8")
	public String ajaxSelectHoliList(int no, Model model) {
      
      ArrayList<Holiday> list = wService.selectHoliList(no);
      
      
      HashMap<String,Object> map = new HashMap<String,Object>();
      map.put("list", list);
      
      
	  return new Gson().toJson(map);
	}
	
	/* 미승인 휴가 삭제하기  */
	@RequestMapping("holiyApplyDelete.ho")
	public String holidayApplyDelete(Holiday h, HttpSession session) {
		int result = wService.holidayApplyDelete(h);
		session.setAttribute("alertMsg", "삭제완료");
		return "redirect:holiApply.ho";
	}
	
	/* 미승인 휴가 승인,거절하기 */
	@RequestMapping("approve.ho")
	public String holidayApprove(Holiday h, HttpSession session) {
		// holiday_apply 테이블 업데이트
		int result = wService.holidayApprove(h);
		
		if(result>0) { 
			// holiday insert
			int result2 = wService.holidayInsert(h);
			session.setAttribute("alertMsg", "승인완료");
			return "redirect:holiApprove.ho";
			
		}else { 
			return "redirect:holiApprove.ho";
		}
		
		
	}
	
	/* 관리자 휴가 지급하기 */
	@RequestMapping("holidayGive.ho")
	public String holidayGive(Holiday h, HttpSession session) {
		int result = wService.holidayGive(h);
		
		if(result>0) { 
			session.setAttribute("alertMsg", "휴가 지급 성공");
			return "redirect:holiGive.ho";
		}else { 
			session.setAttribute("errorMsg", "휴가지급 실패");
			return "redirect:holiGive.ho";
		}
		
	}
	
	/* 관리자 휴가 회수하기 */
	@RequestMapping("holiWithDraw.ho")
	public String holidayWithDraw(Holiday h, HttpSession session) {
		int result = wService.holidayInsert(h);
		if(result>0) { 
			session.setAttribute("alertMsg", "휴가 회수 성공");
			return "redirect:holiGive.ho";
		}else { 
			session.setAttribute("errorMsg", "휴가회수 실패");
			return "redirect:holiGive.ho";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="workCalendar.wo", produces="application/json; charset=utf-8")
	public String ajaxWorkCalendar(int no, Model model) {
		ArrayList<Work> list = wService.workCalendar(no);
	      
	      
	    HashMap<String,Object> map = new HashMap<String,Object>();
	    map.put("list", list);
	      
	    return new Gson().toJson(map);
	}
	
}
