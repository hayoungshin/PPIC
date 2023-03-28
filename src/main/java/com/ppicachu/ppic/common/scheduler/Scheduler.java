package com.ppicachu.ppic.common.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ppicachu.ppic.work.model.service.WorkService;

@Component
public class Scheduler {

	/*
	 * * cron 표현식
	 * 
	 * 초 분 시 일 월 요일 연도
	 * 
	 * 초 : 0~59
	 * 분 : 0~59
	 * 시 : 0~23
	 * 일 : 1~31
	 * 월 : 1~12
	 * 요일: 0~6(일~토) | SUN~SAT
	 * 연도: 생략가능
	 * 
	 * ? : 설정값 없을 때 (일|요일에서만 사용가능)
	 * * : 모든조건
	 * 시작값/단위 : 시작값에서부터 해당 단위때마다
	 * 
	 * L : 마지막 (일|요일에서만 사용가능)
	 * W : 가장가까운평일 (일 에서만 사용가능)
	 * # : 몇주째 (요일 에서만 사용가능)
	 */
	
	/*
	@Scheduled(cron="0 0 0 * * MON-FRI")	// MON,WED ,로 지정도 가능
	public void completeDeleteReply () {
		// 평일 00시 정각마다 현재 댓글들 중에 status가 'N'인 삭제된 댓글들을 일괄적으로 DELETE시키는 (영구삭제)
		int result = bService.completeDeleteReply();
		System.out.println(result + "행 삭제");
	}
	*/
	
	@Autowired
	private WorkService wService;
		
	@Scheduled(cron="0 0 9 * * MON-FRI") // 월~금 (평일) 00시 정각마다
	public void MemberWorkInsert() {
		// 평일 00시 정각마다 모든 회원의 출근 기록을 insert 하는 서비스..
		int result = wService.completeWorkInsert();
		//결과값 return x 
		
	}
}
