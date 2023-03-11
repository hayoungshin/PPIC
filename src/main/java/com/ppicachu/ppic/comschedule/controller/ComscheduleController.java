package com.ppicachu.ppic.comschedule.controller;

import java.util.ArrayList;

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
	
}
