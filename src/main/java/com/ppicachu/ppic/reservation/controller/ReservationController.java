package com.ppicachu.ppic.reservation.controller;

import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.reservation.model.service.ReservationService;
import com.ppicachu.ppic.reservation.model.vo.ReservationRoom;
import com.ppicachu.ppic.reservation.model.vo.Room;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService rService;
	
	@Autowired
	private MemberService mService;

	
	@RequestMapping("resRoom.rs")
	public ModelAndView selectListRes(ModelAndView mv) {
		ArrayList<Member> members = mService.selectListMember();
		ArrayList<Room> rooms = rService.selectRoomList();
		
		mv.addObject("members", members).addObject("rooms", rooms).setViewName("reservation/reserveRoom");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="resRoomList.rs", produces="application/json; charset=UTF-8")
	public String selectReservationRoomList() {
		ArrayList<ReservationRoom> list = rService.selectReservationRoomListAll();
		
		JSONObject jobj = new JSONObject();
		jobj.put("list", list);
		
		return new Gson().toJson(jobj);
	}
}
