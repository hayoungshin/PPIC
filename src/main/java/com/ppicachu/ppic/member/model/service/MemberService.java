package com.ppicachu.ppic.member.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.member.model.vo.Member;

public interface MemberService {
	
	// 1. 구성원 리스트 조회 서비스
	ArrayList<Member> selectMember();

}
