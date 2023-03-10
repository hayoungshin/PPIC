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
			return "redirect:/commonList.doc";
		}else {
			model.addAttribute("errorMsg", "문서 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	@ResponseBody
	@RequestMapping("updateCommon.doc")
	public String updateCommonDocs(MultipartFile reUpfile, String originalFile, String originSavePath,
								 Document doc, HttpSession session) {
		
		// 새 파일 있을 때
		if(!reUpfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(reUpfile, session, "resources/uploadFiles/commonDocs/");
			doc.setSavePath(saveFilePath);
		}
		
		int result = dService.updateCommonDocs(doc);
		
		if(result > 0) {
			if(originalFile != null) {
				new File(session.getServletContext().getRealPath(originSavePath)).delete();
			}
			
			return "success";
		}else {
			return "failed";
		}
		
	}
	
	@RequestMapping("myList.doc")
	public String selectMyDocs() {
		return "document/myDocs";
	}
}
