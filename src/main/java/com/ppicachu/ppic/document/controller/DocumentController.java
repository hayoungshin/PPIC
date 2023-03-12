package com.ppicachu.ppic.document.controller;

import java.util.ArrayList;
import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.FileUpload;
import com.ppicachu.ppic.common.template.Pagination;
import com.ppicachu.ppic.document.model.service.DocumentService;
import com.ppicachu.ppic.document.model.vo.Document;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class DocumentController {

	@Autowired
	private DocumentService dService; 
	
	// ------------------- 회사문서
	/**
	 * 회사문서 리스트 조회
	 * @author koo
	 * @param currentPage
	 * @param currentPage, mv
	 * @return mv
	 */
	@RequestMapping("commonList.doc")
	public ModelAndView selectCommonDocs(@RequestParam(value="cpage", defaultValue="1") int currentPage,
										 ModelAndView mv) {
		
		int listCount = dService.selectCommonDocsCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = dService.selectCommonDocs(pi);
		
		mv.addObject("list", list).addObject("pi", pi).setViewName("document/commonDocs");
		
		return mv;
	}
	
	/**
	 * 회사문서 추가
	 * @author koo
	 * @param doc
	 * @param upfile
	 * @param session
	 * @param model
	 * @return 성공여부
	 */
	@RequestMapping("insertCommon.doc")
	public String insertCommonDocs(Document doc, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/commonDocs/");
			doc.setSavePath(saveFilePath);
			doc.setOriginName(upfile.getOriginalFilename());
		}
		
		int result = dService.insertCommonDocs(doc);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문서가 추가되었습니다.");
			return "redirect:commonList.doc";
		}else {
			model.addAttribute("errorMsg", "문서 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	/**
	 * 회사문서 수정
	 * @author koo
	 * @param reUpfile
	 * @param doc
	 * @param session
	 * @return 성공여부
	 */
	@RequestMapping("updateCommon.doc")
	public String updateCommonDocs(MultipartFile reUpfile, Document doc, HttpSession session) {
		
		// 새 파일 있을 때
		if(!reUpfile.getOriginalFilename().equals("")) {

			// 원본파일 있었으면 삭제
			if(doc.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(doc.getSavePath())).delete();
			}
			
			String saveFilePath = FileUpload.saveFile(reUpfile, session, "resources/uploadFiles/commonDocs/");
			doc.setSavePath(saveFilePath);
			doc.setOriginName(reUpfile.getOriginalFilename());

		}
		
		
		int result = dService.updateCommonDocs(doc);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문서가 수정되었습니다.");
			return "redirect:commonList.doc";
		}else {
			session.setAttribute("errorMsg", "문서 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	
	/**
	 * 회사문서 삭제
	 * @author koo
	 * @param no
	 * @param savePath
	 * @param session
	 * @return 성공여부
	 */
	@RequestMapping("deleteCommon.doc")
	public String deleteCommonDocs(int no, String savePath, HttpSession session) {
		
		int result = dService.deleteCommonDocs(no);
		
		if(result > 0) {
			// 기존파일 삭제
			new File(session.getServletContext().getRealPath(savePath)).delete();
			
			session.setAttribute("alertMsg", "문서가 삭제되었습니다.");
			return "redirect:commonList.doc";
		}else {
			session.setAttribute("errorMsg", "문서 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
	// ------------------- 내 문서
	@RequestMapping("myList.doc")
	public ModelAndView selectMyDocs(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									 HttpSession session, ModelAndView mv) {
		// 로그인 구현 이후 수정
		// String createUser = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		String createUser = "1";
		int listCount = dService.selectMyDocsCount(createUser);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = dService.selectMyDocs(createUser, pi);
		
		mv.addObject("list", list).addObject("pi", pi).setViewName("document/myDocs");
		
		return mv;
	}
	
	@RequestMapping("insertMy.doc")
	public String insertMyDocs(Document doc, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/myDocs/");
			doc.setSavePath(saveFilePath);
			doc.setOriginName(upfile.getOriginalFilename());
		}
		
		int result = dService.insertMyDocs(doc);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문서가 추가되었습니다.");
			return "redirect:myList.doc";
		}else {
			model.addAttribute("errorMsg", "문서 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("updateMy.doc")
	public String updateMyDocs(MultipartFile reUpfile, Document doc, HttpSession session) {
		
		// 새 파일 있을 때
		if(!reUpfile.getOriginalFilename().equals("")) {

			// 원본파일 있었으면 삭제
			if(doc.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(doc.getSavePath())).delete();
			}
			
			String saveFilePath = FileUpload.saveFile(reUpfile, session, "resources/uploadFiles/myDocs/");
			doc.setSavePath(saveFilePath);
			doc.setOriginName(reUpfile.getOriginalFilename());

		}
		
		
		int result = dService.updateMyDocs(doc);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문서가 수정되었습니다.");
			return "redirect:myList.doc";
		}else {
			session.setAttribute("errorMsg", "문서 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("deleteMy.doc")
	public String deleteMyDocs(int no, String savePath, HttpSession session) {
		
		int result = dService.deleteMyDocs(no);
		
		if(result > 0) {
			// 기존파일 삭제
			new File(session.getServletContext().getRealPath(savePath)).delete();
			
			session.setAttribute("alertMsg", "문서가 삭제되었습니다.");
			return "redirect:myList.doc";
		}else {
			session.setAttribute("errorMsg", "문서 삭제 실패");
			return "common/errorPage";
		}
	}
	
}
