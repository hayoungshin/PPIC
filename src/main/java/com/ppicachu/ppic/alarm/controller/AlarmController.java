package com.ppicachu.ppic.alarm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppicachu.ppic.alarm.model.service.AlarmService;
import com.ppicachu.ppic.alarm.model.vo.Alarm;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService aService;
	
	@ResponseBody
	@RequestMapping(value="select.noti", produces="application/json; charset=UTF-8")
	public String ajaxSelectNoti(int userNo) {
		ArrayList<Alarm> list = aService.selectNoti(userNo);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("update.noti")
	public String ajaxUpdateNoti(@RequestParam(value="nfArr[]") ArrayList<Integer> nfArr) {
		int result = aService.updateNoti(nfArr);
		return result != 0 ? "success" : "fail";
	}
	
	@RequestMapping("list.noti")
	public String notiList() {
		return "alarm/alarmListView";
	}
	
	@ResponseBody
	@RequestMapping(value="selectList.noti", produces="application/json; charset=UTF-8")
	public String ajaxNotiList(Alarm a) {
		ArrayList<Alarm> list = aService.selectNotiList(a);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("delete.noti")
	public String ajaxDeleteNoti(@RequestParam(value="nfArr[]") ArrayList<Integer> nfArr) {
		int result = aService.deleteNoti(nfArr);
		return result != 0 ? "success" : "fail";
	}
}
