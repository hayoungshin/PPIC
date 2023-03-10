package com.ppicachu.ppic.work.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.vo.Holiday;


public interface WorkService {
	
	// 1. 휴가보유 목록 조회 서비스
		ArrayList<Member> selectHolidayList();

}
