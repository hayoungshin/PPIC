package com.ppicachu.ppic.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.ppicachu.ppic.chat.model.vo.Chat;
import com.ppicachu.ppic.member.model.vo.Member;

public interface ChatService {
	
	// 1. 내 접속상태 변경
	int updateConn(Member m);
	
	// 2. 주소록 불러오기
	ArrayList<Member> selectListMember(int userNo);

	// 3. 멤버 즐겨찾기
	int insertChatLike(Member m);
	int deleteChatLike(Member m);
	
	// 4. 주소록 이름 찾기
	ArrayList<Member> searchName(Member m);
	
	// 5. 채팅목록
	ArrayList<Chat> selectChatRoomList(Chat c);
	
	// 6. 채팅생성
	int insertChatRoom(HashMap<String, Integer> map);
	int insertParticipant(ArrayList<Integer> checkNo);
	
	// 7. 채팅방 화면
	ArrayList<Chat> selectChat(int roomNo);
}
