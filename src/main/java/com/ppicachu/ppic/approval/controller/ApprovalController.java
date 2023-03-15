package com.ppicachu.ppic.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppicachu.ppic.approval.model.service.ApprovalService;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.Pagination;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	/**
	 * 개인-기안-(진행중, 완료, 임시저장) / 개인-참조 / 개인-중요 / 부서-(진행중,완료) / 전체관리 / 삭제관리 목록
	 * @return pi, list
	 */
	@RequestMapping("list.ap")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, MyDept md, Model m, HttpSession session) {
		md.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		md.setDepartment(((Member)session.getAttribute("loginUser")).getDepartment());
		
		if(md.getA() != 0 || md.getD() != 0) { // 전체관리, 삭제관리
			int listCount = aService.selectMaListCount(md);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Approval> list = aService.selectMaList(md, pi);
			m.addAttribute("pi", pi);
			m.addAttribute("list", list);
		} else if(md.getMye() != 0 || md.getDpe() != 0) { // 개인-기안-완료, 부서-완료
			int listCount = aService.selectListCount(md);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Approval> list = aService.selectEdList(md, pi);
			m.addAttribute("pi", pi);
			m.addAttribute("list", list);
		} else if(md.getMyt() != 0) { // 개인-기안-임시저장
			int listCount = aService.selectTemListCount(md);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Approval> list = aService.selectTemList(md, pi);
			m.addAttribute("pi", pi);
			m.addAttribute("list", list);
		} else {
			int listCount = aService.selectListCount(md);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Approval> list = aService.selectList(md, pi);
			m.addAttribute("pi", pi);
			m.addAttribute("list", list);
		}
		
		String page = "";
		if(md.getMyi() != 0) { // 개인-기안-진행중
			page = "approval/appMyIngListView";
		} else if(md.getMye() != 0) { // 개인-기안-완료
			page = "approval/appMyEdListView";
		} else if(md.getMyt() != 0) { // 개인-기안-임시저장
			page = "approval/appMyTemListView";
		} else if(md.getMyr() != 0) { // 개인-참조
			page = "approval/appMyRefListView";
		} else if(md.getMyb() != 0) { // 개인-중요
			page = "approval/appMyBookListView";
		} else if(md.getDpi() != 0) { // 부서-진행중
			page = "approval/appDeptIngListView";
		} else if(md.getDpe() != 0) { // 부서-완료
			page = "approval/appDeptEdListView";
		} else if(md.getA() != 0) { // 전체관리
			page = "approval/managerAppAllListView";
		} else if(md.getD() != 0) { // 삭제관리
			page = "approval/managerAppDelListView";
		}
		return page;
	}
	
	/**
	 * 개인-기안-진행중의 승인필요 목록
	 * @return pi, list
	 */
	@ResponseBody
	@RequestMapping(value="agreeList.ap", produces="application/json; charset=utf-8")
	public String AjaxAgreeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, MyDept md, HttpSession session) {
		md.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		int listCount = aService.selectListCount(md);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> list = aService.selectList(md, pi);

		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("agreePi", pi);
		map.put("agreeList", list);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * 중요 update
	 * @return result
	 */
	@ResponseBody
	@RequestMapping("updateBook.ap")
	public int AjaxUpdateBook(Approval a, HttpSession session){
		a.setUserName(((Member)session.getAttribute("loginUser")).getUserNo() + "");
		
		int result = aService.updateBook(a);
		
		return result;
	}
	
	/**
	 * 작성폼으로 이동
	 */
	@RequestMapping("enrollForm.ap")
	public String enrollForm() {
		return "approval/appEnrollForm";
	}
	
	/**
	 * 업무기안폼으로 이동
	 */
	@RequestMapping("enrollDraftForm.ap")
	public String enrollDraftForm() {
		return "approval/appEnrollDraftForm";
	}
	
	/**
	 * 인사발령품의서폼으로 이동 
	 */
	@RequestMapping("enrollTransferForm.ap")
	public String enrollTransferForm() {
		return "approval/appEnrollTransferForm";
	}
	
	/** 
	 * 비품신청서폼으로 이동
	 */
	@RequestMapping("enrollConsumeForm.ap")
	public String enrollConsumeForm() {
		return "approval/appEnrollConsumeForm";
	}
	
	/**
	 * 지출결의서폼으로 이동
	 */
	@RequestMapping("enrollCashForm.ap")
	public String enrollCashForm() {
		return "approval/appEnrollCashForm";
	}
	
	/* 작성 */
	@RequestMapping("insert.ap")
	public String insertApproval() {
		return "";
	}
	
	/**
	 * 상세폼으로 이동
	 */
	@RequestMapping("detail.ap")
	public String selectApproval() {
		return "";
	}
	
	/**
	 * 수정폼으로 이동
	 */
	@RequestMapping("updateForm.ap")
	public String updateForm() {
		return "approval/appUpdateForm";
	}
	
	/* 수정 */
	@RequestMapping("update.ap")
	public String updateApproval() {
		return "";
	}
	
	/* 검색? */
}
