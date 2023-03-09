package com.ppicachu.ppic.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	/* 단순 페이지 불러오기*/
	
	/* 마이페이지 */
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	/* 구성원_사용자 */
	@RequestMapping("memberList.me")
	public String memberList() {
		return "member/memberListView";
	}
}
