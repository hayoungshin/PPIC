package com.ppicachu.ppic.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DocumentController {

	@RequestMapping("commonList.doc")
	public String selectCommonDocs() {
		return "document/commonDocs";
	}
	
	@RequestMapping("myList.doc")
	public String selectMyDocs() {
		return "document/myDocs";
	}
}
