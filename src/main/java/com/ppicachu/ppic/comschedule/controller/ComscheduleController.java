package com.ppicachu.ppic.comschedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComscheduleController {

	@RequestMapping("schedule.bo")
	public String selectComscheduleList() {
		return "comschedule/companySchedule";
	}
}
