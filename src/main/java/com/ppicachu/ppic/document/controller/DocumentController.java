package com.ppicachu.ppic.document.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.Pagination;
import com.ppicachu.ppic.document.model.service.DocumentService;
import com.ppicachu.ppic.document.model.vo.Document;

@Controller
public class DocumentController {

	@Autowired
	private DocumentService dService; 
	
	@RequestMapping("commonList.doc")
	public ModelAndView selectCommonDocs(@RequestParam(value="cpage", defaultValue="1") int currentPage,
								   ModelAndView mv) {
		
		int listCount = dService.selectCommonDocsCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Document> list = dService.selectCommonDocs(pi);
		
		mv.addObject("list", list).addObject("pi", pi).setViewName("document/commonDocs");
		
		return mv;
	}
	
	@RequestMapping("myList.doc")
	public String selectMyDocs() {
		return "document/myDocs";
	}
}
