package com.ppicachu.ppic.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

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

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("list.ap")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, MyDept md, Model m) {
		int listCount = aService.selectListCount(md);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectList(md, pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		String page = "";
		if(md.getMyi() != 0) {
			page = "approval/appMyIngListView";
		} else if(md.getAgr() != 0) {
			page = "approval/appMyIngAgreeView";
		} else if(md.getMye() != 0) {
			page = "approval/appMyEdListView";
		} else if(md.getMyt() != 0) {
			page = "approval/appMyTemListView";
		} else if(md.getMyr() != 0) {
			page = "approval/appMyRefListView";
		} else if(md.getMyb() != 0) {
			page = "approval/appMyBookListView";
			
		} else if(md.getDpi() != 0) {
			page = "approval/appDeptIngListView";
		} else if(md.getDpe() != 0) {
			page = "approval/appDeptEdListView";
			
		} else if(md.getA() != 0) {
			page = "approval/managerAppAllListView";
		} else if(md.getD() != 0) {
			page = "approval/managerAppDelListView";
		}
		return page;
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="agreeListCount.ap",
	 * produces="application/json; charset=utf-8") public String
	 * AjaxAgreeListCount(@RequestParam(value="cpage", defaultValue="1") int
	 * currentPage, MyDept md) { int listCount = aService.selectListCount(md);
	 * PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
	 * 
	 * return new Gson().toJson(pi); }
	 */
	
	@ResponseBody
	@RequestMapping(value="agreeList.ap", produces="application/json; charset=utf-8")
	public String AjaxAgreeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, MyDept md) {
		int listCount = aService.selectListCount(md);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectList(md, pi);

		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("agreePi", pi);
		map.put("agreeList", list);
		
		return new Gson().toJson(map);
	}
	/*
	// 개인_기안_진행중
	@RequestMapping("list.myi")
	public String selectMyIngList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyIngListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectMyIngList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appMyIngListView";
	}
	
	// 개인_기안_완료
	@RequestMapping("list.mye")
	public String selectMyEdList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyEdListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectMyEdList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appMyEdListView";
	}
	
	// 개인_기안_임시저장
	@RequestMapping("list.myt")
	public String selectMyTemList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyTemListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectMyTemList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appMyTemListView";
	}
	
	// 개인_참조
	@RequestMapping("list.myr")
	public String selectMyRefList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyRefListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selctMyRefList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appMyRefListView";
	}
	
	// 개인_중요
	@RequestMapping("list.myb")
	public String selectMyBookList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectMyBookListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectMyBookList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appMyBookListView";
	}
	
	// 부서_진행중
	@RequestMapping("list.dpi")
	public String selectDeptIngList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectDeptIngListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectDeptIngList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appDeptIngListView";
	}
	
	// 부서_완료
	@RequestMapping("list.dpe")
	public String selectDeptEdList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectDeptEdListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectDeptEdList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/appDeptEdListView";
	}
	
	// 전체관리
	@RequestMapping("list.a")
	public String selectAllList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectAllListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectAllList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/managerAppAllListView";
	}
	
	// 삭제관리
	@RequestMapping("list.d")
	public String selectDelList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = aService.selectDelListCount("");
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Approval> list = aService.selectDelList("", pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		return "approval/managerAppDelListView";
	}
	*/
	
	/* 작성폼으로 이동 */
	@RequestMapping("enrollForm.ap")
	public String enrollForm() {
		return "approval/appEnrollForm";
	}
	
	/* 업무기안폼으로 이동 */
	@RequestMapping("enrollDraftForm.ap")
	public String enrollDraftForm() {
		return "approval/appEnrollDraftForm";
	}
	
	/* 인사발령품의서폼으로 이동 */
	@RequestMapping("enrollTransferForm.ap")
	public String enrollTransferForm() {
		return "approval/appEnrollTransferForm";
	}
	
	/* 비품신청서폼으로 이동 */
	@RequestMapping("enrollConsumeForm.ap")
	public String enrollConsumeForm() {
		return "approval/appEnrollConsumeForm";
	}
	
	/* 지출결의서폼으로 이동 */
	@RequestMapping("enrollCashForm.ap")
	public String enrollCashForm() {
		return "approval/appEnrollCashForm";
	}
	
	/* 작성 */
	@RequestMapping("insert.ap")
	public String insertApproval() {
		return "";
	}
	
	/* 상세폼으로 이동 */
	@RequestMapping("detail.ap")
	public String selectApproval() {
		return "";
	}
	
	/* 수정폼으로 이동 */
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
