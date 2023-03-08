package com.ppicachu.ppic.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ppicachu.ppic.board.model.service.BoardService;
import com.ppicachu.ppic.board.model.vo.Board;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public String selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "board/boardListView";
	}
	
	@RequestMapping("enrollForm.bo")
	public String selectBoard() {
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, Model m, HttpSession session) {
		int result = bService.insertBoard(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글 등록 되었습니다.");
			return "redirect:list.bo";
		} else {
			m.addAttribute("errorMsg", "익명게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.bo")
	public String selectBoard(int no, Model m) {
		int result = bService.increaseCount(no);
		
		if(result > 0) {
			Board b = bService.selectBoard(no);
			m.addAttribute("b", b);
			return "board/boardDetailView";
		}else {
			m.addAttribute("errorMsg", "게시글 조회 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int no, Model m, HttpSession session) {
		int result = bService.deleteBoard(no);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글 삭제 되었습니다.");
			return "redirect:list.bo";
		}else {
			m.addAttribute("errorMsg", "익명게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateForm.bo")
	public String updateForm(int no, Model model) {
		model.addAttribute("b", bService.selectBoard(no));
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, HttpSession session, Model model) {
		int result = bService.updateBoard(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글 수정 되었습니다.");
			return "redirect:detail.bo?no=" + b.getBoardNo();
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("search.bo")
	public String searchBoard(String condition, String keyword, int cpage, Model m) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int searchCount = bService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cpage, 5, 10);
		ArrayList<Board> list = bService.selectSearchList(map, pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		m.addAttribute("condition", condition);
		m.addAttribute("keyword", keyword);
		
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
