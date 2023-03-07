package com.ppicachu.ppic.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("myPage.me")
	public String selectNoticeList() {
		return "member/myPage";
	}
}
