package com.ppicachu.ppic.chat.controller;

import java.util.ArrayList;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ppicachu.ppic.member.model.vo.Member;

public class ChatEchoHandler extends TextWebSocketHandler{
	
	// 웹소켓 세션 객체(클라이언트==사용자)들을 저장해두는 리스트
	private ArrayList<WebSocketSession> sessionList = new ArrayList<>();  
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session);
		sessionList.add(session);
	}
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception { 
		System.out.println("handleTextMessage : " + session + " : " + message);
		
		for(WebSocketSession sss : sessionList) {
			String msg = "채팅|" + message.getPayload() + "|" + ((Member)session.getAttributes().get("loginUser")).getUserName() + "|" + ((Member)session.getAttributes().get("loginUser")).getUserId();
			sss.sendMessage(new TextMessage(msg)); // 채팅방jsp에서 onMessage함수가 실행됨
		}
	}

	// 클라이언트와 연결이 끊어졌을 때 실행할 내용 정의
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		System.out.println("afterConnectionClosed : " + session + " : " + status);
		
		
	}
}
