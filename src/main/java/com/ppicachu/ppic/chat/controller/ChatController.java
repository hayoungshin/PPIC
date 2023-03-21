package com.ppicachu.ppic.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppicachu.ppic.chat.model.service.ChatService;
import com.ppicachu.ppic.chat.model.vo.Chat;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@Autowired
	private MemberService mService;
	
	@ResponseBody
	@RequestMapping(value="updateConn.chat", produces="application/json; charset=UTF-8")
	public String ajaxUpdateConn(Member m, HttpSession session) {
		int result = cService.updateConn(m);
		
		if(result > 0) {
			Member updateUser = mService.loginMember(m);
		    session.setAttribute("loginUser", updateUser);
		    return new Gson().toJson(updateUser);
		} else {
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="memList.chat", produces="application/json; charset=UTF-8")
	public String ajaxSelectMemList(int userNo) {
		ArrayList<Member> list1 = cService.selectListMember(userNo);
		ArrayList<Department> list2 = mService.selectDeptList();
		HashMap<String, ArrayList> map = new HashMap<>();
		map.put("memList", list1);
		map.put("deptList", list2);
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping("likeMember.chat")
	public String ajaxLikeMember(Member m, String star) {
		int result = 0;
		if(star.equals("n")) {
			result = cService.insertChatLike(m);
		}else {
			result = cService.deleteChatLike(m);
		}
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="searchName.chat", produces="application/json; charset=UTF-8")
	public String ajaxSearchName(Member m) {
		ArrayList<Member> list = cService.searchName(m);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="chatRoomList.chat", produces="application/json; charset=UTF-8")
	public String ajaxChatRoomList(Chat c) {
		ArrayList<Chat> list = cService.selectChatRoomList(c);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value="searchChatRoom.chat", produces="application/json; charset=UTF-8")
	public String ajaxChatRoomSearch(Chat c) {
		ArrayList<Chat> list = cService.selectChatRoomList(c);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("create.chat")
	public int ajaxCreateChat(@RequestParam(value="participant[]") ArrayList<Integer> participant) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("groupCount", participant.size());
		int result1 = cService.insertChatRoom(map);
		int result2 = cService.insertParticipant(participant);
		
		return result1;
	}
	
	@ResponseBody
	@RequestMapping(value="open.chat", produces="application/json; charset=UTF-8")
	public String ajaxOpenChat(int roomNo) {
		ArrayList<Chat> list = cService.selectChat(roomNo);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("delete.chat")
	public String ajaxDeleteChat(int roomNo) {
		int result1 = cService.deleteParticipant(roomNo);
		int result2 = cService.deleteChatRoom(roomNo);
		
		return result1 * result2 > 0 ? "success" : "fail";
	}
}
