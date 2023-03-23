package com.ppicachu.ppic.member.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.member.model.vo.Position;

public interface MemberService {
	
	// 1. 구성원 리스트 조회 서비스
	ArrayList<Member> selectListMember();
	
	// 2. 조직도 목록 조회 서비스
	ArrayList<Department> selectDeptList();
	
	// 3. 구성원 상세조회 서비스(사용자)
	Member selectMember(int userNo);
	
	// 4. 회원정보 변경 서비스
	// - 마이페이지
	int updateMember(Member m);
	// - 관리자
	int detailUpdateMember(Member m);
	
	// 로그인
	Member loginMember(Member m);
	
	// 5. 프로필이미지 변경용 서비스
	int updateProfileImg(Member m);
	
	/* 회원가입 */
	// 6. 아이디 중복확인 서비스
	int idCheck(String checkId);
	// 7. 직급 리스트 조회 서비스
	ArrayList<Position> selectPositionList();
	// 8. 회원가입 서비스
	int insertMember(Member m);
	
	// 9. 아이디 찾기 서비스
	String findId(Member m);
	// 10. 비밀번호 변경 서비스
	int resetPwd(Member m);

	// 11. ajax 멤버조회 서비스(이름, 메일, 부서명만 - 메일자동완성용)
	ArrayList<Member> selectMemForMail();
	// 13. ajax 부서별 멤버수 조회 서비스
	ArrayList<Department> selectMemCountForMail();
	// 14. ajax 즐겨찾는 멤버 조회 서비스
	ArrayList<Member> selectLikeMemForMail(int userNo);
	
	// 12. ajax 권한 있는 멤저 리스트 조회
	ArrayList<Member> selectAuthorityMemList(int authoNo);
	
	// 13. 멤버 퇴사 서비스
	int deleteMember(int userNo);
	
}
