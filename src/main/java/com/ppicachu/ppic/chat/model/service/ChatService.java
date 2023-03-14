package com.ppicachu.ppic.chat.model.service;

import java.util.ArrayList;

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
}
