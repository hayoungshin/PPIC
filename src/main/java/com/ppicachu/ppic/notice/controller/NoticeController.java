package com.ppicachu.ppic.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ppicachu.ppic.common.model.vo.Attachment;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.common.template.FileUpload;
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
		
		return "notice/noticeListView";
	}
	
	@RequestMapping("detail.no")
	public String selectNotice(int no, Model m) {
		int result = nService.increaseCount(no);
		
		if(result > 0) {
			Notice n = nService.selectNotice(no);
			m.addAttribute("n", n);
			return "notice/noticeDetailView";
		} else {
			m.addAttribute("errorMsg", "공지사항 조회 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("search.no")
	public String searchBoard(String condition, String keyword, int cpage, Model m) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int searchCount = nService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cpage, 5, 10);
		ArrayList<Notice> list = nService.selectSearchList(map, pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		m.addAttribute("condition", condition);
		m.addAttribute("keyword", keyword);
		
		return "notice/noticeListView";
	}
	
	@RequestMapping("enrollForm.no")
	public String selectNotice() {
		return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(Notice b, ArrayList<MultipartFile> upfile, HttpSession session, Model m) {
		ArrayList<Attachment> list = new ArrayList<>();
		if(!upfile.get(0).getOriginalFilename().equals("")) {
			for(int i=0; i<upfile.size(); i++) {
				String saveFilePath = FileUpload.saveFile(upfile.get(i), session, "resources/uploadFiles/noticeFile/");
				Attachment a = new Attachment();
				a.setOriginName(upfile.get(i).getOriginalFilename());
				a.setChangeName(saveFilePath);
				list.add(a);
			}
		}
		int result = nService.insertNotice(b, list);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			return "redirect:list.no";
		}else {
			m.addAttribute("errorMsg", "공지사항 등록 실패");
			return "common/errorPage";
		}
	}
	
	
}
