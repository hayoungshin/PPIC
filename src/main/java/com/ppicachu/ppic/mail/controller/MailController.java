package com.ppicachu.ppic.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppicachu.ppic.mail.model.service.MailService;
import com.ppicachu.ppic.mail.model.vo.Mail;

@Controller
public class MailController {
	
	
	@RequestMapping("recieveList.ml")
	public String recieveMailList() {
		return "mail/recieveMailListView";
	}
	
	@RequestMapping("recieveDetail.ml")
	public String selectRecieveMail() {
		return "mail/recieveMailDetailView";
	}
	
	@RequestMapping("sendForm.ml")
	public String sendMailForm() {
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
	public String selectimportantMail() {
		return "mail/importantMailDetailView";
	}
	
}
