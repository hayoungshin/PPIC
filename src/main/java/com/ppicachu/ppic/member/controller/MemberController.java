package com.ppicachu.ppic.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	/* 단순 페이지 불러오기*/
	
	/* 마이페이지 */
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	/* 구성원_메인 */
	@RequestMapping("memberMain.me")
	public String memberMain(Model model) {
		ArrayList<Member> list1 = mService.selectListMember();
		ArrayList<Department> list2 = mService.selectDeptList();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
		return "member/memberMainView";
	}
	
	/* 구성원_detail */
	@RequestMapping("memberDetail.me")
	public String memberDetail(int no, Model model) {
		
		Member m = mService.selectMember(no);
		model.addAttribute("m", m);
		
		return "member/memberDetailView";
	}
	
	/* 구성원_관리자 */
	@RequestMapping("memberList.me")
	public String memberList(Model model) {
		ArrayList<Member> list1 = mService.selectListMember();
		ArrayList<Department> list2 = mService.selectDeptList();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		return "member/memberListView";
	}
	
	/* 구성원_권한설정 */
	@RequestMapping("memberAuth.me")
	public String memberAuth() {
		return "member/memberAuthView";
	}
	
	// 로그인 대충
	@RequestMapping("login.me")
	public String loginMember(Member m, Model model, HttpSession session) {
		Member loginUser = mService.loginMember(m);
		if(loginUser == null) { 
			model.addAttribute("errorMsg", "로그인 실패");
			return "common/errorPage";
		} else { 
			session.setAttribute("loginUser", loginUser);
			return "common/menubar"; 
		}
		
	}
}
