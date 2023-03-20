package com.ppicachu.ppic.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ppicachu.ppic.chat.model.service.ChatService;
import com.ppicachu.ppic.chat.model.vo.Chat;
import com.ppicachu.ppic.member.model.vo.Member;

@Controller
public class ChatEchoHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatService cService;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
    
    // 채팅방 목록 <방 번호, ArrayList<session> >이 들어간다.
    private HashMap<Integer, ArrayList<WebSocketSession>> RoomList = new HashMap<>();
    // session, 방 번호가 들어간다.
    private HashMap<WebSocketSession, Integer> sessionList = new HashMap<>();
    
    private static int i;
    
    /**
     * websocket 연결 성공 시
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        i++;
        System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
    }
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
 
        // 전달받은 메세지
    	// roomNo,sendNo,chatContent,notRead
        String msg = message.getPayload();
        String[] strs = msg.split(",");
        String roomNo = strs[0];
		String sendNo = strs[1];
		String chatContent = strs[2];
		String notRead = strs[3];
		
        // 받은 메세지에 담긴 roomId로 해당 채팅방을 찾아온다.
        Chat chatRoom = cService.selectChatRoom(Integer.parseInt(strs[0]));
        // 채팅 세션 목록에 채팅방이 존재하지 않고, 처음 들어왔고, DB에서의 채팅방이 있을 때
        // 채팅방 생성
        if(RoomList.get(chatRoom.getRoomNo()) == null && strs[2].equals("ENTER-CHAT") && chatRoom != null) {
            
            // 채팅방에 들어갈 session들
            ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
            // session 추가
            sessionTwo.add(session);
            // sessionList에 추가
            sessionList.put(session, chatRoom.getRoomNo());
            // RoomList에 추가
            RoomList.put(chatRoom.getRoomNo(), sessionTwo);
            // 확인용
            System.out.println("채팅방 생성");
        }
        
        // 채팅방이 존재 할 때
        else if(RoomList.get(chatRoom.getRoomNo()) != null && strs[2].equals("ENTER-CHAT") && chatRoom != null) {
            
            // RoomList에서 해당 방번호를 가진 방이 있는지 확인.
            RoomList.get(chatRoom.getRoomNo()).add(session);
            // sessionList에 추가
            sessionList.put(session, chatRoom.getRoomNo());
            // 확인용
            System.out.println("생성된 채팅방으로 입장");
        }
        
        // 채팅 메세지 입력 시
        else if(RoomList.get(chatRoom.getRoomNo()) != null && !strs[2].equals("ENTER-CHAT") && chatRoom != null) {
            
            // 현재 session 수
            int sessionCount = 0;
            for(int i=0; i<RoomList.get(chatRoom.getRoomNo()).size(); i++) {
            	sessionCount++;
            }
            
            // roomNo,sendNo,chatContent,notRead,sendName,sendProfile,realnotread
            msg += "," + ((Member)session.getAttributes().get("loginUser")).getUserName() + "," + ((Member)session.getAttributes().get("loginUser")).getProfileImg() + "," + (Integer.parseInt(notRead) - sessionCount + 1);
            TextMessage textMessage = new TextMessage(msg);
            
            // 해당 채팅방의 session에 뿌려준다.
            for(WebSocketSession sess : RoomList.get(chatRoom.getRoomNo())) {
                sess.sendMessage(textMessage);
            }
            
            Chat c = new Chat();
			c.setRoomNo(Integer.parseInt(roomNo));
			c.setSendNo(Integer.parseInt(sendNo));
			c.setChatContent(chatContent);
			c.setNotRead(String.valueOf(Integer.parseInt(notRead) - sessionCount + 1));
            
            // DB에 저장한다.
            int a = cService.insertChat(c);
            
            if(a == 1) {
                System.out.println("메세지 전송 및 DB 저장 성공");
            }else {
                System.out.println("메세지 전송 실패!!! & DB 저장 실패!!");
            }
            
            int b = cService.updateChatRoom(Integer.parseInt(roomNo));
            
        }
    }
    
    /**
     * websocket 연결 종료 시
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        i--;
        System.out.println(session.getId() + " 연결 종료 => 총 접속 인원 : " + i + "명");
        // sessionList에 session이 있다면
        if(sessionList.get(session) != null) {
            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
        	RoomList.get(sessionList.get(session)).remove(session);
            sessionList.remove(session);
        }
    }
    
}
