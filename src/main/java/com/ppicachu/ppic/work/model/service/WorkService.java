package com.ppicachu.ppic.work.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.vo.Holiday;
import com.ppicachu.ppic.work.model.vo.HolidayApply;
import com.ppicachu.ppic.work.model.vo.Work;


public interface WorkService {
	
	// 1. 전사원 휴가보유 목록 조회 서비스
		ArrayList<Member> selectHolidayList();

	// 2. 전사원 휴가사용 내역 조회 서비스
		ArrayList<Holiday> selectHolidayUseList();
		
	// 3. 사원 휴가 미승인 내역 조회 서비스 
		ArrayList<Holiday> selectBeforeUseList();
	
	// 4. 매일 12시 전 사원 출근 insert 서비스 
		int completeWorkInsert();
		
	// 5. 출퇴근기록 조회 서비스 (home.jsp)
		Work selectWorkRecord(int userNo);
	
	// 6. 출근등록 서비스 
		int updateWorkIn(int userNo);
		int updateWorkInLate(int userNo);
		
	// 7. 퇴근등록 서비스 
		int updateWorkOut(int userNo);
		int updateWorkOutEarly(int userNo);
		
		// 출퇴근시 채팅 접속상태 변경
		int updateConnSta(Work w);
		
	// 8. 사원의 휴가 정보 조회 서비스 
		Member selectMemberHoliday(int userNo);
		ArrayList<Holiday> selectMemberHolidayList(int userNo);
	
	// 9. 사원의 휴가 신청 서비스
		int holiApplyEnroll(Holiday h);
	
	// 10. 사원의 휴가예정 리스트 조회 서비스 
		ArrayList<Holiday> selectHoliList(int userNo);
	
	// 11. 승인 전 휴가신청 목록 삭제 서비스
		int holidayApplyDelete(Holiday h);
	
	// 12. 관리자의 휴가 승인 서비스 
		int holidayApprove(Holiday h);
		int holidayInsert(Holiday h);
	
	// 13. 관리자의 휴가 지급 서비스 
		int holidayGive(Holiday h);
	
	// 14. 사원의 출퇴근 기록 조회 서비스
		ArrayList<Work> selectMemberWorkList(int userNo);
		
	// 15. 사원의 지각 조퇴 결근 횟수 조회 서비스 
		Work countWorkStatus(int userNo);

	// 16. 캘린더 조회 서비스 
		ArrayList<Work> workCalendar(int userNo);
}
