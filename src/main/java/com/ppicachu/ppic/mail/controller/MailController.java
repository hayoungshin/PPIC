package com.ppicachu.ppic.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ppicachu.ppic.common.template.FileUpload;
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
	
	@RequestMapping("recieveList.ml")
	public String recieveMailList() {
		return "mail/recieveMailListView";
	}
	
	@RequestMapping("recieveDetail.ml")
	public String selectRecieveMail() {
		return "mail/recieveMailDetailView";
	}
	
	@RequestMapping("sendForm.ml")
	public String sendMailForm(Model model) {
		return "mail/sendMailForm";
	}
	
	@RequestMapping("sendList.ml")
	public String sendMailList() {
		return "mail/sendMailListView";
	}
	
	@RequestMapping("sendDetail.ml")
	public String selectsendMail() {
		return "mail/sendMailDetailView";
	}
	
	@RequestMapping("importantList.ml")
	public String importantMailList() {
		return "mail/importantMailListView";
	}
	
	@RequestMapping("importantDetail.ml")
	public String selectImportantMail() {
		return "mail/importantMailDetailView";
	}
	
	@RequestMapping("tempList.ml")
	public String tempMailList() {
		return "mail/tempMailListView";
	}
	
	@RequestMapping("tempForm.ml")
	public String tempMailForm() {
		return "mail/tempMailForm";
	}
	
	@RequestMapping("binList.ml")
	public String binMailList() {
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
