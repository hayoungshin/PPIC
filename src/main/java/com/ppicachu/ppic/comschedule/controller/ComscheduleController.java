package com.ppicachu.ppic.comschedule.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppicachu.ppic.comschedule.model.service.ComscheduleService;
import com.ppicachu.ppic.comschedule.model.vo.Comschedule;

@Controller
public class ComscheduleController {

	@Autowired
	private ComscheduleService cService;
	
	@RequestMapping("schedule.bo")
	public String selectComscheduleList() {
		return "comschedule/companySchedule";
	}
	
	@ResponseBody
	@RequestMapping(value="comScheduleList.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectComscheduleList(int schKind){
		ArrayList<Comschedule> list = cService.selectComscheduleList(schKind);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("insert.sch")
	public String insertSchedule(Comschedule cs, Model m, HttpSession session) {
		int result = cService.insertSchedule(cs);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 일정 추가 되었습니다.");
			return "redirect:schedule.bo";
		}else {
			m.addAttribute("errorMsg", "일정 추가 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.sch")
	public String deleteSchedule(int no, Model m, HttpSession session) {
		int result = cService.deleteSchedule(no);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 일정 삭제 되었습니다.");
			return "redirect:schedule.bo";
		}else {
			m.addAttribute("errorMsg", "일정 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("update.sch")
	public String updateSchedule(Comschedule cs, Model m, HttpSession session) {
		int result = cService.updateSchedule(cs);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 일정 수정 되었습니다.");
			return "redirect:schedule.bo";
		}else {
			m.addAttribute("errorMsg", "일정 수정 실패");
			return "common/errorPage";
		}
	}
	
	/* fullcalendar 회사일정 조회하기 */
	@ResponseBody
	@RequestMapping(value="scheduleCalendar.sch", produces="application/json; charset=utf-8")
	public String ajaxWorkCalendar(Model model) {
		ArrayList<Comschedule> list = cService.scheduleCalendar();
	      
	    HashMap<String,Object> map = new HashMap<String,Object>();
	    map.put("list", list);
	      
	    return new Gson().toJson(map);
	}
}
