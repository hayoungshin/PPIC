package com.ppicachu.ppic.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppicachu.ppic.board.model.service.BoardService;
import com.ppicachu.ppic.board.model.vo.Board;
import com.ppicachu.ppic.board.model.vo.Report;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public String selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = bService.selectListCount("");
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectList("", pi);
		
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
	public String selectBoard(int no, int userNo, Model m) {
		int result = bService.increaseCount(no);
		
		if(result > 0) {
			HashMap<String, Integer> map = new HashMap<>();
			map.put("boardNo", no);
			map.put("userNo", userNo);
			Board b = bService.selectBoard(map);
			m.addAttribute("b", b);
			return "board/boardDetailView";
		}else {
			m.addAttribute("errorMsg", "게시글 조회 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int no, int type, Model m, HttpSession session) {
		int result = bService.deleteBoard(no);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글 삭제 되었습니다.");
			if(type == 0) {
				return "redirect:list.bo";
			} else {
				return "redirect:myList.bo";
			}
		}else {
			m.addAttribute("errorMsg", "익명게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateForm.bo")
	public String updateForm(int no, int type, int userNo, Model model) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("boardNo", no);
		map.put("userNo", userNo);
		model.addAttribute("b", bService.selectBoard(map));
		model.addAttribute("type", type);
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, int type, HttpSession session, Model model) {
		int result = bService.updateBoard(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글 수정 되었습니다.");
			if(type == 0) {
				return "redirect:detail.bo?no=" + b.getBoardNo() + "&userNo=" + b.getBoardWriter();
			} else{
				return "redirect:detailMy.bo?no=" + b.getBoardNo() + "&userNo=" + b.getBoardWriter();
			}
			
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
		map.put("userNo", "");
		
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
	public String selectmyPostList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String userNo, Model m) {
		int listCount = bService.selectListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectList(userNo, pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "board/myPostListView";
	}
	
	@RequestMapping("searchMy.bo")
	public String searchMyBoard(String condition, String keyword, int cpage, String userNo, Model m) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("userNo", userNo);
		
		int searchCount = bService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cpage, 5, 10);
		ArrayList<Board> list = bService.selectSearchList(map, pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		m.addAttribute("condition", condition);
		m.addAttribute("keyword", keyword);
		
		return "board/myPostListView";
	}
	
	@RequestMapping("detailMy.bo")
	public String selectMyBoard(int no, int userNo, Model m) {
		int result = bService.increaseCount(no);
		
		if(result > 0) {
			HashMap<String, Integer> map = new HashMap<>();
			map.put("boardNo", no);
			map.put("userNo", userNo);
			Board b = bService.selectBoard(map);
			m.addAttribute("b", b);
			return "board/myPostDetailView";
		}else {
			m.addAttribute("errorMsg", "게시글 조회 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("report.bo")
	public String insertReport(Report r, Model m, HttpSession session) {
		int result = bService.insertReport(r);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 신고 완료되었습니다.");
			return "redirect:list.bo";
		} else {
			m.addAttribute("errorMsg", "게시글 신고 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("manage.bo")
	public String selectBoardManageList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		int listCount = bService.selectReportCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Report> list = bService.selectReportList(pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "board/boardManage";
	}
	
	@RequestMapping("blind.bo")
	public String blindBoard(Report r, HttpSession session, Model m) {
		int result1 = bService.blindReportUpdate(r);
		int result2 = bService.blindBoardUpdate(r);
		
		if(result1 > 0 && result2 > 0) {
			if(r.getReportSta().equals("1")) {
				session.setAttribute("alertMsg", "블라인드 처리 취소되었습니다.");
			} else {
				session.setAttribute("alertMsg", "성공적으로 블라인드 처리되었습니다.");
			}
			return "redirect:manage.bo";
		} else {
			m.addAttribute("errorMsg", "게시글 신고 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteReport.bo")
	public String deleteReport(int reportNo, HttpSession session, Model m) {
		int result = bService.deleteReport(reportNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 신고 삭제 되었습니다.");
			return "redirect:manage.bo";
		} else {
			m.addAttribute("errorMsg", "신고 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="deleteLike.bo", produces="application/json; charset=utf-8")
	public String ajaxDeleteLike(Board b) {
		int result = bService.deleteLike(b);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("boardNo", b.getBoardNo());
		map.put("userNo", b.getUserNo());
		Board board = bService.selectBoard(map);
		return new Gson().toJson(board);
	}
	
	@ResponseBody
	@RequestMapping(value="insertLike.bo", produces="application/json; charset=utf-8")
	public String ajaxInsertLike(Board b) {
		int result = bService.insertLike(b);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("boardNo", b.getBoardNo());
		map.put("userNo", b.getUserNo());
		Board board = bService.selectBoard(map);
		return new Gson().toJson(board);
	}
	

}
