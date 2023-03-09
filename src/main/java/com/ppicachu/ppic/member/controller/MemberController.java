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
	
	/* 구성원_메인 */
	@RequestMapping("memberMain.me")
	public String memberMain() {
		return "member/memberMainView";
	}
	
	/* 구성원_관리자 */
	@RequestMapping("memberList.me")
	public String memberList() {
		return "member/memberListView";
	}
	
	/* 구성원_권한설정 */
	@RequestMapping("memberAuth.me")
	public String memberAuth() {
		return "member/memberAuthView";
	}
}
