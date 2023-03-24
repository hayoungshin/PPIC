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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.ppicachu.ppic.approval.model.service.ApprovalService;
import com.ppicachu.ppic.approval.model.vo.AppChange;
import com.ppicachu.ppic.approval.model.vo.AppDetail;
import com.ppicachu.ppic.approval.model.vo.AppProcess;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.FormCash;
import com.ppicachu.ppic.approval.model.vo.FormConsume;
import com.ppicachu.ppic.approval.model.vo.FormDraft;
import com.ppicachu.ppic.approval.model.vo.FormTransfer;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.Attachment;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.FileUpload;
import com.ppicachu.ppic.common.template.Pagination;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.member.model.vo.Position;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@Autowired
	private MemberService mService;
	
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
	 * 중요 update (=)
	 */
	@ResponseBody
	@RequestMapping("updateBook.ap")
	public int AjaxUpdateBook(Approval a){
		int result = aService.updateBook(a);
		
		return result;
	}
	
	/**
	 * 삭제 update (in)
	 */
	@ResponseBody
	@RequestMapping("deleteApproval.ap")
	public int AjaxDeleteApproval(String no) {
		String[] noArr = {no};
		if(no.contains(",")) {
			noArr = no.split(",");
		}
		
		int result = aService.deleteApproval(noArr);
		
		return result;
	}
	
	/**
	 * 삭제 delete (in)
	 */
	/*@ResponseBody
	@RequestMapping("recoverApproval.ap")
	public int AjaxRemoveApproval(String no) {
		String[] noArr = {no};
		if(no.contains(",")) {
			noArr = no.split(",");
		}
		
		int result = aService.removeApproval(noArr);
		
		return result;
	}*/
	
	/**
	 * 복원 update (in)
	 */
	@ResponseBody
	@RequestMapping("recoverApproval.ap")
	public int AjaxRecoverApproval(String no) {
		String[] noArr = {no};
		if(no.contains(",")) {
			noArr = no.split(",");
		}
		
		int result = aService.recoverApproval(noArr);
		
		return result;
	}
	
	/**
	 * 상세폼으로 이동
	 */
	@RequestMapping("detail.ap")
	public String selectApproval(int no, String form, Model m) {
		AppDetail ad = null;
		
		switch(form) {
		case "업무기안" : ad = aService.selectDraftApp(no); break;
		case "인사발령품의서" : ad = aService.selectTransferApp(no); break;
		case "비품신청서" : ad = aService.selectConsumeApp(no); break;
		case "지출결의서" : ad = aService.selectCashApp(no); break;
		}
		m.addAttribute("ad", ad);
		
		return "approval/appDetailView";
	}
	
	/**
	 * 상세-변경사항 select (=)
	 */
	@ResponseBody
	@RequestMapping(value="selectChange.ap", produces="application/json; charset=utf-8")
	public String AjaxSelectChange(int no) {
		ArrayList<AppChange> changeList = aService.selectChange(no);
		
		return new Gson().toJson(changeList);
	}
	
	/**
	 * 상세-결재선 update (=)
	 */
	@ResponseBody
	@RequestMapping("updateProcess.ap")
	public int AjaxUpdateProcess(AppProcess ap, int currentOrder, int finalOrder) {
		int result = aService.updateProcess(ap);
		
		if(result > 0) {
			Approval a = new Approval();
			a.setApprovalNo(ap.getApprovalNo());
			a.setApprovalStatus(ap.getStatus());
			a.setCurrentOrder(currentOrder);
			a.setFinalOrder(finalOrder);
			int result1 = aService.updateCurrentOrder(a);
			
			AppChange ac = new AppChange();
			ac.setApprovalNo(ap.getApprovalNo());
			ac.setUserName(ap.getUserName());
			if(ap.getStatus().equals("승인")) {
				ac.setContent("님이 승인했어요.");
			} else {
				ac.setContent("님이 <span style=\'color:red;\'>반려</span>했어요.");
			}
			ac.setRole("변경");
			int result2 = aService.insertChange(ac);
		}
		return result;
	}
	
	/**
	 * 상세-변경사항 insert
	 */
	@ResponseBody
	@RequestMapping("insertChange.ap")
	public int AjaxInsertChange(AppChange ac) {
		int result = aService.insertChange(ac);
		
		return result;
	}
	
	/**
	 * 작성폼으로 이동
	 */
	@RequestMapping("enrollForm.ap")
	public String enrollForm(int form, Model m) {
		if(form != 0) {
			ArrayList<Member> memberList = aService.selectMemberList();
			ArrayList<Department> deptList = mService.selectDeptList();
			m.addAttribute("mList", memberList);
			m.addAttribute("dList", deptList);
		}
		if(form == 2) {
			ArrayList<Position> positionList = mService.selectPositionList();
			m.addAttribute("pList", positionList);
		}
		
		String page = "";
		switch(form) {
		case 0 : page = "approval/appEnrollForm"; break;
		case 1 : page = "approval/appEnrollDraftForm"; break;
		case 2 : page = "approval/appEnrollTransferForm"; break;
		case 3 : page = "approval/appEnrollConsumeForm"; break;
		case 4 : page = "approval/appEnrollCashForm"; break;
		}
		return page;
	}
	
	/**
	 *  작성
	 */
	@RequestMapping("insert.ap")
	public String insertApproval(Approval a
			, FormDraft fdr, FormTransfer ftr, FormConsume fco, FormCash fca
			, String agrUserNo, String refUserNo
			, MultipartFile[] upfile
			, HttpSession session, Model m) {
		
		// AppProcess 생성
		ArrayList<AppProcess> apList = new ArrayList<>();
		AppProcess ap = new AppProcess(); // 기안자 등록
		ap.setUserName(a.getUserNo() + "");
		ap.setProcessOrder(0);
		ap.setApprovalRole("결재");
		ap.setStatus("승인");
		apList.add(ap);
		String[] agrNoArr = {agrUserNo}; // 결재자 등록
		if(agrUserNo.contains(",")) {
			agrNoArr = agrUserNo.split(",");
		}
		for(int i=0; i<agrNoArr.length; i++) {
			AppProcess ap1 = new AppProcess();
			ap1.setUserName(agrNoArr[i]);
			ap1.setProcessOrder(i + 1);
			ap1.setApprovalRole("결재");
			apList.add(ap1);
		}
		if(refUserNo != null) {
			String[] refNoArr = {refUserNo}; // 참조자 등록
			if(refUserNo.contains(",")) {
				refNoArr = refUserNo.split(",");
			}
			for(int j=0; j<refNoArr.length; j++) {
				AppProcess ap2 = new AppProcess();
				ap2.setUserName(refNoArr[j]);
				ap2.setProcessOrder(0);
				ap2.setApprovalRole("참조");
				apList.add(ap2);
			}
		}
		
		// Approval 추가
		a.setFinalOrder(agrNoArr.length);
						
		// AppChange 생성
		AppChange ac = new AppChange();
		ac.setUserName(a.getUserNo() + "");
		ac.setContent("님이 글을 작성했어요.");
		ac.setRole("변경");

		// Attachment 생성
		ArrayList<Attachment> atList = new ArrayList<>();
		if(!upfile[0].getOriginalFilename().equals("")) {
			String[] saveFilePathArr = new String[upfile.length];
			for(int i=0; i<upfile.length; i++) {
				saveFilePathArr[i] = FileUpload.saveFile(upfile[i], session, "resources/uploadFiles/approvalFile/");
			
				Attachment at = new Attachment();
				at.setOriginName(upfile[i].getOriginalFilename());
				at.setChangeName(saveFilePathArr[i]);
				atList.add(at);
			}
		}
		
		// Approval insert
		int result1 = aService.insertApproval(a, apList, ac, atList);
		
		// Form insert
		int result2 = 0;
		switch(a.getForm()) {
		case "업무기안" : result2 = aService.insertDraft(fdr); break;
		case "인사발령품의서" : 
			ArrayList<FormTransfer> ftrList = ftr.getFtrList();
			for(int i=0; i<ftrList.size(); i++) {
				ftrList.get(i).setEffectiveDate(ftr.getEffectiveDate());
			}result2 = aService.insertTransfer(ftrList);
			break;
		case "비품신청서" : result2 = aService.insertConsume(fco.getFcoList()); break;
		case "지출결의서" : result2 = aService.insertCash(fca.getFcaList()); break;
		}
		
		if(result1 * result2 > 0) {
			if(a.getTem() != null) {
				session.setAttribute("alertMsg", "성공적으로 기안이 임시저장되었습니다.");
			} else {
				session.setAttribute("alertMsg", "성공적으로 기안이 등록되었습니다.");
			}
			return "redirect:list.ap?myi=1";
		} else {
			m.addAttribute("errorMsg", "기안 등록 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 수정폼으로 이동
	 */
	@RequestMapping("updateForm.ap")
	public String updateForm(int no, String form, Model m) {
		AppDetail ad = null;
		
		switch(form) {
		case "업무기안" : ad = aService.selectDraftApp(no); break;
		case "인사발령품의서" : ad = aService.selectTransferApp(no); break;
		case "비품신청서" : ad = aService.selectConsumeApp(no); break;
		case "지출결의서" : ad = aService.selectCashApp(no); break;
		}
		m.addAttribute("ad", ad);
		
		return "approval/appUpdateForm";
	}
	
	/* 수정 */
	@RequestMapping("update.ap")
	public String updateApproval() {
		return "";
	}
	
	/* 검색? */
}
