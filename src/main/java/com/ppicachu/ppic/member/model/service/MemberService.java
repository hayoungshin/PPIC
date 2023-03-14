package com.ppicachu.ppic.member.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;

public interface MemberService {
	
	// 1. 구성원 리스트 조회 서비스
	ArrayList<Member> selectListMember();
	
	// 2. 조직도 목록 조회 서비스
	ArrayList<Department> selectDeptList();
	
	// 3. 구성원 상세조회 서비스(사용자)
	Member selectMember(int userNo);
	
	// 4. 마이페이지 회원정보 변경 서비스
	int updateMember(Member m);
	
	// 로그인 대충
	Member loginMember(Member m);
	
	// 5. 프로필이미지 변경용 서비스
	int updateProfileImg(Member m);

}
