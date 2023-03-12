package com.ppicachu.ppic.comschedule.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.comschedule.model.vo.Comschedule;

public interface ComscheduleService {
	
	// 1. 일정 리스트
	ArrayList<Comschedule> selectComscheduleList(int schKind);
	
	// 2. 일정 추가
	int insertSchedule(Comschedule cs);
	
	// 3. 일정 삭제
	int deleteSchedule(int schNo);
	
	// 4. 일정 수정
	int updateSchedule(Comschedule cs);

}
