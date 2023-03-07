package com.ppicachu.ppic.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("list.bo")
	public String selectNoticeList() {
		return "board/boardListView";
	}
	
	@RequestMapping("myList.bo")
	public String selectmyPostList() {
		return "board/myPostListView";
	}
	
	@RequestMapping("manage.bo")
	public String selectBoardManageList() {
		return "board/boardManage";
	}

}
