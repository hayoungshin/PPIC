package com.ppicachu.ppic.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

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
	
	// 8. 채팅 입력
	int insertChat(HashMap<String, Object> map);
	
	// 9. 채팅방 변경
	int updateChatRoom(int roomNo);
	
	// 10. 참여자 변경
	int updateNotreadChat(HashMap<String, Object> hm);
    int updateLastreadChat(HashMap<String, Object> hm);
	
	// 11. websocket 연결된 방번호 찾기
	Chat selectChatRoom(int roomNo);
	
	// 12. 채팅방 삭제
	int deleteParticipant(int roomNo);
	int deleteChatRoom(int roomNo);
	
	// 13. 채팅 입장시 읽음 처리
	int selectLastReadChat(Chat c);
	int selectMaxChat(Chat c);
	int updateParticipant(Chat c);
	int updateChat(Chat c);
	
	// 14. 대화상대 리스트
	ArrayList<Chat> selectPartiList(Chat c);
}
