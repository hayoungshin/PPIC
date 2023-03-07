package com.ppicachu.ppic.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.Pagination;
import com.ppicachu.ppic.notice.model.service.NoticeService;
import com.ppicachu.ppic.notice.model.vo.Notice;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Notice> list = nService.selectNoticeList(pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		System.out.println(list);
		return "notice/noticeListView";
	}
}
