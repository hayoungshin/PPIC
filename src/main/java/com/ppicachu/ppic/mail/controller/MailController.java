package com.ppicachu.ppic.mail.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppicachu.ppic.mail.model.service.MailService;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.service.MemberServiceImpl;
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
		ArrayList<Member> memList = memService.selectListMember();
		model.addAttribute("memList", memList);
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
	
	
	//**************** 주소록 ****************
	@RequestMapping("address.ml")
	public String selectAddress() {
		return "mail/addressList";
	}
	
}
