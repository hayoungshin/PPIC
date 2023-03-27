package com.ppicachu.ppic.mail.controller;

import java.util.ArrayList;

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
import com.ppicachu.ppic.mail.model.service.MailService;
import com.ppicachu.ppic.mail.model.vo.Mail;
import com.ppicachu.ppic.mail.model.vo.MailAttachment;
import com.ppicachu.ppic.mail.model.vo.MailStatus;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	@Autowired
	private MemberService memService;
	
	@ResponseBody
	@RequestMapping("countRecieve.ml")
	public int ajaxSelectReceiveCount(HttpSession session) {
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		int count = mService.selectRecieveListCount(userMail);
		return count;
	}
	
	/**
	 * @param currentPage 페이징처리
	 * @param session 로그인한 유저 정보 불러오기 위해
	 * @param mv
	 * @return 메일 메뉴 초기화면 : 받은 메일 목록
	 */
	@RequestMapping("recieveList.ml")
	public ModelAndView selectRecieveList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		int listCount = mService.selectRecieveListCount(userMail);	// 전체 받은메일 개수

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailStatus> list = mService.selectRecieveList(pi, userMail);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/recieveMailListView");
		return mv;
	}
	
	@RequestMapping("recieveDetail.ml")
	public ModelAndView selectRecieveMail(int no, HttpSession session, ModelAndView mv) {
		
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		
		MailStatus status = new MailStatus();
		status.setMailNo(no);
		status.setRecipientMail(userMail);
		
		int readStatus = mService.selectReadStatus(status);	// 1읽음|0안읽음
		int result = 0;
		if(readStatus == 1) {	// 읽었던 메일
			// 메일기본정보
			Mail m = mService.selectRecieve(status);
			// 메일 첨부파일
			ArrayList<MailAttachment> list = mService.selectAttachmentList(no);
			mv.addObject("m", m).addObject("list", list).setViewName("mail/recieveMailDetailView");
		} else {				// 안읽었던 메일
			result = mService.updateReadDate(status);
			//읽은 시간 먼저 업데이트
			if(result > 0) {
				Mail m = mService.selectRecieve(status);
				ArrayList<MailAttachment> list = mService.selectAttachmentList(no);
				mv.addObject("m", m).addObject("list", list).setViewName("mail/recieveMailDetailView");
			} else {
				mv.addObject("errorMsg", "받은메일 상세조회 실패").setViewName("common/errorPage");
			}
		}
		
		return mv;
	}
	
	@RequestMapping("sendForm.ml")
	public String sendMailForm(Model model) {
		return "mail/sendMailForm";
	}
	
	@RequestMapping("sendList.ml")
	public ModelAndView selectSendList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		int listCount = mService.selectSendListCount(userMail);	// 전체 보낸메일 개수

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailStatus> list = mService.selectSendList(pi, userMail);
		
		for(MailStatus m : list) {
			m.setRecipientArr(m.getRecipientMail().split(","));
		}
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/sendMailListView");
		
		return mv;
	}
	
	@RequestMapping("sendDetail.ml")
	public ModelAndView selectsendMail(int no, HttpSession session, ModelAndView mv) {
		
		// 메일기본정보
		Mail m = mService.selectSend(no);
		// 메일 첨부파일
		ArrayList<MailAttachment> list = mService.selectAttachmentList(no);
		mv.addObject("m", m).addObject("list", list).setViewName("mail/sendMailDetailView");
		
		return mv;
	}
	
	@RequestMapping("importantList.ml")
	public ModelAndView selectImportantList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		int listCount = mService.selectImportantListCount(userMail);	// 전체 보낸메일 개수

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailStatus> list = mService.selectImportantList(pi, userMail);
		
		for(MailStatus m : list) {
			m.setRecipientArr(m.getRecipientMail().split(","));
		}
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/importantMailListView");
		System.out.println(list);
		return mv;
	}
	
	@RequestMapping("importantDetail.ml")
	public ModelAndView selectImportantMail(int no, int type, HttpSession session, ModelAndView mv) {
		if(type == 4) {	// 보낸 메일일 때
			// 메일기본정보
			Mail m = mService.selectSend(no);
			// 메일 첨부파일
			ArrayList<MailAttachment> list = mService.selectAttachmentList(no);
			mv.addObject("m", m).addObject("list", list).setViewName("mail/sendMailDetailView");
		} else {
			
			String userMail = ((Member)session.getAttribute("loginUser")).getMail();
			
			MailStatus status = new MailStatus();
			status.setMailNo(no);
			status.setRecipientMail(userMail);
			
			int readStatus = mService.selectReadStatus(status);	// 1읽음|0안읽음
			int result = 0;
			if(readStatus == 1) {	// 읽었던 메일
				// 메일기본정보
				Mail m = mService.selectRecieve(status);
				// 메일 첨부파일
				ArrayList<MailAttachment> list = mService.selectAttachmentList(no);
				mv.addObject("m", m).addObject("list", list).setViewName("mail/recieveMailDetailView");
			} else {				// 안읽었던 메일
				result = mService.updateReadDate(status);
				//읽은 시간 먼저 업데이트
				if(result > 0) {
					Mail m = mService.selectRecieve(status);
					ArrayList<MailAttachment> list = mService.selectAttachmentList(no);
					mv.addObject("m", m).addObject("list", list).setViewName("mail/recieveMailDetailView");
				} else {
					mv.addObject("errorMsg", "받은메일 상세조회 실패").setViewName("common/errorPage");
				}
			}
		}
		return mv;
	}
	
	@RequestMapping("tempList.ml")
	public String selectTempList() {
		return "mail/tempMailListView";
	}
	
	@RequestMapping("tempForm.ml")
	public String tempMailForm() {
		return "mail/tempMailForm";
	}
	
	@RequestMapping("binList.ml")
	public String selectBinList() {
		return "mail/binMailListView";
	}
	
	@RequestMapping("binDetail.ml")
	public String selectBinMail() {
		return "mail/binMailDetailView";
	}
	
	@RequestMapping("send.ml")	// 중요메일일 경우 "on"
	public String sendMail(Mail m, @RequestParam(value="mailTitle", defaultValue="(제목없음)") String mailTitle, String important, ArrayList<MultipartFile> upfiles, HttpSession session, Model model) {
		
		m.setMailTitle(mailTitle);
		// 내 정보 Mail에
		m.setSenderMail(((Member)session.getAttribute("loginUser")).getMail());
		m.setSender(((Member)session.getAttribute("loginUser")).getUserNo());
		
		// 중요표시 했는지 MailStatus에
		MailStatus status = new MailStatus();
		if(important == null) {
			status.setImportantStatus("N");
		} else {
			status.setImportantStatus("Y");
		}
		status.setSenderMail(m.getSenderMail());
		
		// 받은,참조,숨은참조 문자열 배열로 저장
		m.setRecipientArr(m.getRecipientMail().split(","));
		m.setRefArr(m.getRefMail().split(","));
		m.setHidRefArr(m.getHidRefMail().split(","));
		
		
		/* 첨부파일 리스트로 추가 */
		ArrayList<MailAttachment> list = new ArrayList<>();
		
		for(int i=0; i<upfiles.size(); i++) {
			if(!upfiles.get(i).getOriginalFilename().equals("")) {	// n번째 파일이 정상적으로 들어왔을 경우
				String saveFilePath = FileUpload.saveFile(upfiles.get(i), session, "resources/mail_uploadFiles/");
				
				MailAttachment at = new MailAttachment();
				at.setOriginName(upfiles.get(i).getOriginalFilename());
				at.setChangeName(saveFilePath);
				
				list.add(at);
			}
		}
		
		int result = mService.sendMail(m, list, status);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 메일이 전송되었습니다.");
			return "redirect:recieveList.ml";
		} else {
			model.addAttribute("errorMsg", "메일 전송 실패");
			return "common/errorPage";
		}
		
	}
	
	
	//**************** 주소록 ****************
	@RequestMapping("address.ml")
	public String selectAddress() {
		return "mail/addressList";
	}
	
}
