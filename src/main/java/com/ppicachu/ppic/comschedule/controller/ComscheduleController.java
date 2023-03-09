package com.ppicachu.ppic.comschedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value="restDayScheduleList.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectRestDayComscheduleList(){
		ArrayList<Comschedule> list = cService.selectComscheduleList();
		return new Gson().toJson(list);
	}
	
}
