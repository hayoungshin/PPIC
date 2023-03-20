package com.ppicachu.ppic.alarm.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ppicachu.ppic.alarm.model.service.AlarmService;
import com.ppicachu.ppic.alarm.model.vo.Alarm;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class AlarmEchoHandler extends TextWebSocketHandler{
	
	@Autowired
	private AlarmService aService;

	private ArrayList<WebSocketSession> sessionList = new ArrayList<>();  
	HashMap<String, WebSocketSession> userSessions = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		userSessions.put(String.valueOf(((Member)session.getAttributes().get("loginUser")).getUserNo()), session);
	}
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception { 
		String msg =  (String) message.getPayload();
		String[] strs = msg.split(",");
		if(strs != null) {
			String dcatNo = strs[0];
			String sendNo = strs[1];
			String sendName = strs[2];
			String receiveNo = strs[3];
			String catNo = strs[4];
			String title = strs[5];
			
			TextMessage tmpMsg = null;
			WebSocketSession receiveSession = userSessions.get(receiveNo);
			
			switch(dcatNo) {
			case "0": tmpMsg = new TextMessage(sendName + "님이 \"" + title + "\"을(를) 승인했어요."); break;
			case "1": tmpMsg = new TextMessage(sendName + "님이 \"" + title + "\"을(를) 반려했어요."); break;
			case "9": tmpMsg = new TextMessage(sendName + "님이 \"" + title + "\"을(를) 승인했어요."); break;
			case "10": tmpMsg = new TextMessage(sendName + "님이 \"" + title + "\"을(를) 거절했어요."); break;
			}
			
			if(receiveSession != null) {
				receiveSession.sendMessage(tmpMsg);
			}
			
			Alarm a = new Alarm(); 
			a.setDcatNo(dcatNo); 
			a.setSendNo(sendNo);
			a.setReceiveNo(receiveNo); 
			a.setCatNo(catNo);
			a.setNfContent(tmpMsg.getPayload()); aService.insertAlarm(a);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
}
