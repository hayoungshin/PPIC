package com.ppicachu.ppic.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ppicachu.ppic.chat.model.service.ChatService;
import com.ppicachu.ppic.chat.model.vo.Chat;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class ChatEchoHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatService cService;
	
	private ArrayList<WebSocketSession> sessionList = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session);
		sessionList.add(session);
	}
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception { 
		String msg = (String)message.getPayload();
		// roomNo,sendNo,chatContent,notRead
		String[] strs = msg.split(",");
		if(strs != null) {
			String roomNo = strs[0];
			String sendNo = strs[1];
			String chatContent = strs[2];
			String notRead = strs[3];
			
			// roomNo,sendNo,chatContent,notRead,sendName,sendProfileImg
			msg += "," + ((Member)session.getAttributes().get("loginUser")).getUserName() + "," + ((Member)session.getAttributes().get("loginUser")).getProfileImg();

			for(WebSocketSession sss : sessionList) {
				sss.sendMessage(new TextMessage(msg));
			}
			
			Chat c = new Chat();
			c.setRoomNo(Integer.parseInt(roomNo));
			c.setSendNo(Integer.parseInt(sendNo));
			c.setChatContent(chatContent);
			c.setNotRead(notRead);
			cService.insertChat(c);
			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		System.out.println("afterConnectionClosed : " + session + " : " + status);
		
		sessionList.remove(session);
	}
}
