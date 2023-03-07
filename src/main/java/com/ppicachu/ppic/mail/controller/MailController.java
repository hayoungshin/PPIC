package com.ppicachu.ppic.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	
	@RequestMapping("recieveList.ml")
	public String test() {
		return "mail/recieveMailList";
	}
	
	
}
