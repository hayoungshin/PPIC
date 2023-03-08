package com.ppicachu.ppic.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ppicachu.ppic.approval.model.service.ApprovalService;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.Pagination;

@Controller
public class ApprovalController {
	/*
	@Autowired
	private ApprovalService aService;
	*/
	/* 개인_기안_진행중
	@RequestMapping("list.myi")
	public String selectMyIngList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyIngListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectMyIngList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appMyIngListView";
	} */
	
	/* 개인_기안_완료
	@RequestMapping("list.mye")
	public String selectMyEdList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyEdListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectMyEdList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appMyEdListView";
	} */
	
	/* 개인_기안_임시저장
	@RequestMapping("list.myt")
	public String selectMyTemList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyTemListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectMyTemList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appMyTemListView";
	} */
	
	/* 개인_참조 
	@RequestMapping("list.myr")
	public String selectMyRefList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyRefListCount("");
	}*/
	
	/* 개인_중요 */
	
	/* 부서_진행중 */
	
	/* 부서_완료 */
	
	/* 작성폼으로 이동 */
	
	/* 작성 */
	
	/* 상세폼으로 이동 */
	
	/* 수정폼으로 이동 */
	
	/* 수정 */
	
	/* 검색? */
	
	/* 전체관리 */
	
	/* 삭제관리 */
}
