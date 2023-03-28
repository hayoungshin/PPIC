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
	public ModelAndView selectRecieveList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String filter, HttpSession session, ModelAndView mv) {

		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		
		PageInfo pi;
		ArrayList<MailStatus> list = new ArrayList<>();
		int listCount = 0;
		if(filter == null) {					// 전체 조회
			listCount = mService.selectRecieveListCount(userMail);	// 전체 받은메일 개수
			pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			list = mService.selectRecieveList(pi, userMail);
		} else if(filter.equals("unread")) {	// 읽지 않은 받은 메일
			listCount = mService.selectUnreadRecieveListCount(userMail);
			pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			list = mService.selectUnreadRecieveList(pi, userMail);
		} else if(filter.equals("important")) {	// 중요한 받은 메일
			listCount = mService.selectImportantRecieveListCount(userMail);
			pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			list = mService.selectImportantRecieveList(pi, userMail);
		} else if(filter.equals("toMe")) {		// 나에게 온 받은 메일
			listCount = mService.selectToMeRecieveListCount(userMail);
			pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			list = mService.selectRecieveList(pi, userMail);
		} else {								// 첨부파일 있는 받은 메일
			listCount = mService.selectAtcRecieveListCount(userMail);
			pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			list = mService.selectAtcRecieveList(pi, userMail);
		}
		
		mv.addObject("pi", pi).addObject("list", list).addObject("filter", filter).setViewName("mail/recieveMailListView");
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
	
	/**
	 * 답장 페이지
	 * @param no 메일번호
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("replyForm.ml")
	public ModelAndView replayMail(int no, HttpSession session, ModelAndView mv) {
		MailStatus status = new MailStatus();
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		status.setMailNo(no);
		Mail m = mService.selectRecieve(status);
		
		mv.addObject("m", m).setViewName("mail/replyMailForm");
		return mv;
	}
	
	/**
	 * 전달 페이지
	 * @param no 메일번호
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("deliverForm.ml")
	public ModelAndView deliverMail(int no, HttpSession session, ModelAndView mv) {
		MailStatus status = new MailStatus();
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		status.setMailNo(no);
		Mail m = mService.selectRecieve(status);
		
		mv.addObject("m", m).setViewName("mail/deliverMailForm");
		return mv;
	}
	
	@RequestMapping("sendList.ml")
	public ModelAndView selectSendList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String filter, HttpSession session, ModelAndView mv) {
		
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		
		PageInfo pi;
		ArrayList<MailStatus> list = new ArrayList<>();
		int listCount = 0;
		if(filter == null) {					// 전체 조회
			listCount = mService.selectSendListCount(userMail);	// 전체 보낸메일 개수
			pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			list = mService.selectSendList(pi, userMail);
		} else if(filter.equals("important")) {	// 중요한 보낸메일
			listCount = mService.selectImportantSendListCount(userMail);
			pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			list = mService.selectImportantSendList(pi, userMail);
		} else {								// 첨부파일 있는 보낸메일
			listCount = mService.selectAtcSendListCount(userMail);
			pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			list = mService.selectAtcSendList(pi, userMail);
		}
		
		for(MailStatus m : list) {
			m.setRecipientArr(m.getRecipientMail().split(","));
		}
		
		mv.addObject("pi", pi).addObject("list", list).addObject("filter", filter).setViewName("mail/sendMailListView");
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
	public ModelAndView selectImportantList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String sort, HttpSession session, ModelAndView mv) {
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		int listCount = mService.selectImportantListCount(userMail);	// 전체 중요메일 개수
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<MailStatus> list = new ArrayList<>();
		if(sort == null) {
			list = mService.selectImportantList(pi, userMail);			
		} else {
			list = mService.selectImportantListOlder(pi, userMail);
		}
		
		for(MailStatus m : list) {
			m.setRecipientArr(m.getRecipientMail().split(","));
		}
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/importantMailListView");
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
	public ModelAndView selectTempList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		int listCount = mService.selectTempListCount(userMail);	// 전체 휴지통 메일 개수

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Mail> list = mService.selectTempList(pi, userMail);
		
		for(Mail m : list) {
			if(m.getRecipientMail() != null) {
				m.setRecipientArr(m.getRecipientMail().split(","));				
			}
		}
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/tempMailListView");
		return mv;
	}
	
	@RequestMapping("tempForm.ml")
	public ModelAndView tempMailForm(HttpSession session, int no, ModelAndView mv) {
		
		Mail m = mService.selectTemp(no);
		
		mv.addObject("m", m).setViewName("mail/tempMailForm");
		return mv;
	}
	
	@RequestMapping("binList.ml")
	public ModelAndView selectBinList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		String userMail = ((Member)session.getAttribute("loginUser")).getMail();
		int listCount = mService.selectBinListCount(userMail);	// 전체 휴지통 메일 개수

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailStatus> list = mService.selectBinList(pi, userMail);
		
		for(MailStatus m : list) {
			m.setRecipientArr(m.getRecipientMail().split(","));
		}
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/binMailListView");
		return mv;
	}
	
	@RequestMapping("binDetail.ml")
	public ModelAndView selectBinMail(int no, int type, HttpSession session, ModelAndView mv) {
		if(type == 4) {	// 보낸 메일일 때
			// 메일기본정보
			Mail m = mService.selectSend(no);
			m.setMailType("4");
			// 메일 첨부파일
			ArrayList<MailAttachment> list = mService.selectAttachmentList(no);
			mv.addObject("m", m).addObject("list", list).setViewName("mail/binMailDetailView");
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
				mv.addObject("m", m).addObject("list", list).setViewName("mail/binMailDetailView");
			} else {				// 안읽었던 메일
				result = mService.updateReadDate(status);
				//읽은 시간 먼저 업데이트
				if(result > 0) {
					Mail m = mService.selectRecieve(status);
					ArrayList<MailAttachment> list = mService.selectAttachmentList(no);
					mv.addObject("m", m).addObject("list", list).setViewName("mail/binMailDetailView");
				} else {
					mv.addObject("errorMsg", "받은메일 상세조회 실패").setViewName("common/errorPage");
				}
			}
		}
		return mv;
	}
	
	@RequestMapping("send.ml")																				// 중요메일일 경우 "on"
	public String sendMail(Mail m, @RequestParam(value="mailTitle", defaultValue="(제목없음)") String mailTitle, String important, ArrayList<MultipartFile> upfiles, HttpSession session, Model model) {
		
		m.setMailTitle(mailTitle);
		// 내 정보 Mail에
		m.setSenderMail(((Member)session.getAttribute("loginUser")).getMail());
		m.setSender(((Member)session.getAttribute("loginUser")).getUserNo());
		m.setTempStatus("N");
		
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
			return "redirect:sendList.ml";
		} else {
			model.addAttribute("errorMsg", "메일 전송 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("tempSave.ml")																				// 중요메일일 경우 "on"
	public String tempSaveMail(Mail m,@RequestParam(value="recipientMail", defaultValue="(받는이없음)") String recipientMail, @RequestParam(value="mailTitle", defaultValue="(제목없음)") String mailTitle, String important, HttpSession session, Model model) {
		
		m.setMailTitle(mailTitle);
		// 내 정보 Mail에
		m.setSenderMail(((Member)session.getAttribute("loginUser")).getMail());
		m.setSender(((Member)session.getAttribute("loginUser")).getUserNo());
		m.setTempStatus("Y");
		
		int result = mService.tempSaveMail(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 메일이 임시저장되었습니다.");
			return "redirect:recieveList.ml";
		} else {
			model.addAttribute("errorMsg", "메일 임시저장 실패");
			return "common/errorPage";
		}
		
	}
	
	
	
	
	/**
	 * 별 눌렀을 때 중요표시 설정, 해제
	 * @param status mailNo, mailType 넘어옴
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteImportant.ml")
	public int ajaxDeleteImportantStatus(MailStatus status, HttpSession session) {
		status.setSenderMail(((Member)session.getAttribute("loginUser")).getMail());
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		return mService.deleteImportantStatus(status);
	}
	@ResponseBody
	@RequestMapping("updateImportant.ml")
	public int ajaxUpdateImportantStatus(MailStatus status, HttpSession session) {
		status.setSenderMail(((Member)session.getAttribute("loginUser")).getMail());
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		return mService.updateImportantStatus(status);
	}
	
	@ResponseBody
	@RequestMapping("read.ml")
	public boolean ajaxreadMail(MailStatus status, HttpSession session) {
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		int length = status.getMailNoArr().length;
		int result = 0;
		for(int mailNo : status.getMailNoArr()) {
			status.setMailNo(mailNo);
			mService.updateReadDate(status);
			result++;
		}
		return result == length;
	}
	@ResponseBody
	@RequestMapping("unread.ml")
	public boolean ajaxUnreadMail(MailStatus status, HttpSession session) {
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		int length = status.getMailNoArr().length;
		int result = 0;
		for(int mailNo : status.getMailNoArr()) {
			status.setMailNo(mailNo);
			mService.updateReadNull(status);
			result++;
		}
		return result == length;
	}
	
	/**
	 * 상세페이지에서 삭제할 때 실행됨
	 * @param no
	 * @param type
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.ml")
	public String deleteMail(int no, int type, HttpSession session, Model model) {
		MailStatus status = new MailStatus();
		status.setMailNo(no);
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		status.setMailType(type);
		
		int result = mService.deleteMail(status);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "선택된 메일을 휴지통으로 이동하며 10일 보관 후 영구삭제됩니다.");
			return "redirect:recieveList.ml";
		} else {
			model.addAttribute("errorMsg", "메일 삭제 실패");
			return "common/errorPage";
		}
	}
	/**
	 * 리스트에서 삭제할 때 실행되는 메소드
	 * @param status mailNo배열 들어있음 (체크박스 체크된 값들)
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("listDelete.ml")
	public boolean ajaxDeleteMail(MailStatus status, HttpSession session, Model model) {
		int length = status.getMailNoArr().length;
		int result = 0;
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		
		for(int mailNo : status.getMailNoArr()) {
			status.setMailNo(mailNo);
			mService.deleteMail(status);
			result++;
		}
		
		return result == length;
	}
	
	@RequestMapping("readNull.ml")
	public int deleteReadStatus(MailStatus status, HttpSession session) {
		status.setSenderMail(((Member)session.getAttribute("loginUser")).getMail());
		status.setRecipientMail(((Member)session.getAttribute("loginUser")).getMail());
		return mService.updateReadNull(status);
	}
	
	/**
	 * 임시저장메일 영구삭제
	 * @param status
	 * @return
	 */
	@ResponseBody
	@RequestMapping("tempDelete.ml")
	public boolean ajaxDeleteTemp(MailStatus status) {
		int length = status.getMailNoArr().length;
		int result = 0;
		for(int mailNo : status.getMailNoArr()) {
			status.setMailNo(mailNo);
			mService.deleteTemp(status);
			result++;
		}
		return result == length;
	}
	
	
	
	
	//**************** 주소록 ****************
	@RequestMapping("address.ml")
	public String selectAddress() {
		return "mail/addressList";
	}
	
}
