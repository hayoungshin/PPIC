package com.ppicachu.ppic.notice.controller;

import java.io.File;
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
	public String insertNotice(Notice n, ArrayList<MultipartFile> upfile, HttpSession session, Model m) {
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
		int result = nService.insertNotice(n, list);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			return "redirect:list.no";
		}else {
			m.addAttribute("errorMsg", "공지사항 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateForm.no")
	public String updateForm(int no, String origin, String change, Model m) {
		m.addAttribute("n", nService.selectNotice(no));
		m.addAttribute("origin", origin);
		m.addAttribute("change", change);
		return "notice/noticeUpdateForm";
	}
	
	@RequestMapping("update.no")
	public String updateNotice(Notice n, String origin, String change, ArrayList<MultipartFile> upfile, HttpSession session, Model m) {
		ArrayList<Attachment> list = new ArrayList<>();
		int result1 = 1;
		if(!upfile.get(0).getOriginalFilename().equals("")) {
			
			if(origin != "") {
				result1 += nService.deleteAttachment(n.getNoticeNo());
				String[] changeArr = change.split(",");
				for(int i=0; i<changeArr.length; i++) {
					new File(session.getServletContext().getRealPath(changeArr[i])).delete();
				}
			}
			
			for(int i=0; i<upfile.size(); i++) {
				String saveFilePath = FileUpload.saveFile(upfile.get(i), session, "resources/uploadFiles/noticeFile/");
				Attachment a = new Attachment();
				a.setOriginName(upfile.get(i).getOriginalFilename());
				a.setChangeName(saveFilePath);
				a.setRefNo(n.getNoticeNo());
				list.add(a);
			}
		}
		int result2 = nService.updateNotice(n, list);
		System.out.println(result1);
		System.out.println(result2);
		if(result1 > 0 && result2 > 0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항 수정 되었습니다.");
			return "redirect:detail.no?no=" + n.getNoticeNo();
		} else {
			m.addAttribute("errorMsg", "공지사항 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.no")
	public String deleteNotice(int no, String origin, String change, HttpSession session, Model m) {
		int result1 = 1;
		if(origin != "") {
			result1 += nService.deleteAttachment(no);
			String[] changeArr = change.split(",");
			for(int i=0; i<changeArr.length; i++) {
				new File(session.getServletContext().getRealPath(changeArr[i])).delete();
			}
		}
		int result2 = nService.deleteNotice(no);
		
		if(result1 > 0 && result2 > 0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 삭제되었습니다.");
			return "redirect:list.no";
		}else {
			m.addAttribute("errorMsg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="notice.main", produces="application/json; charset=UTF-8")
	public String selectNoticeMain() {
		ArrayList<Notice> list = nService.selectNoticeMain();
		return new Gson().toJson(list);
	}
	
}
