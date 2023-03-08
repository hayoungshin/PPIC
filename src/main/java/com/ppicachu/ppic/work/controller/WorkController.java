package com.ppicachu.ppic.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkController {
	
	/* 단순 페이지 오픈 */
	/* 근무 메인 */
	@RequestMapping("workMain.wo")
	public String workMain() {
		return "work/work_main";
	}
	
	/* 근무_출퇴근기록 */
	@RequestMapping("workList.wo")
	public String workList() {
		return "work/workList";
	}

}
