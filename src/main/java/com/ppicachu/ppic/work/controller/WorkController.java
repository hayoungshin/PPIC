package com.ppicachu.ppic.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkController {
	
	@RequestMapping("workMain.wo")
	public String workMain() {
		return "work/work_main";
	}

}
