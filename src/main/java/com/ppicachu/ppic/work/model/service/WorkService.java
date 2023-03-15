package com.ppicachu.ppic.work.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.vo.Holiday;
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
}
