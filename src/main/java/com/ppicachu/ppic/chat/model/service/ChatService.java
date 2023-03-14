package com.ppicachu.ppic.chat.model.service;

import com.ppicachu.ppic.member.model.vo.Member;

public interface ChatService {
	
	// 1. 내 접속상태 변경
	int updateConn(Member m);

}
