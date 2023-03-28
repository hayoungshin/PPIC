package com.ppicachu.ppic.work.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.dao.WorkDao;
import com.ppicachu.ppic.work.model.vo.Holiday;
import com.ppicachu.ppic.work.model.vo.HolidayApply;
import com.ppicachu.ppic.work.model.vo.Work;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WorkDao wDao;
	
	@Override
	public ArrayList<Member> selectHolidayList() {
		return wDao.selectHolidayList(sqlSession);
	}

	@Override
	public ArrayList<Holiday> selectHolidayUseList() {
		return wDao.selectHolidayUseList(sqlSession);
	}

	@Override
	public ArrayList<Holiday> selectBeforeUseList() {
		return wDao.selectBeforeUseList(sqlSession);
	}

	@Override
	public int completeWorkInsert() {
		return wDao.completeWorkInsert(sqlSession);
	}

	@Override
	public Work selectWorkRecord(int userNo) {
		return wDao.selectWorkRecord(sqlSession, userNo);
	}

	@Override
	public int updateWorkIn(int userNo) {
		return wDao.updateWorkIn(sqlSession, userNo);
	}
	
	@Override
	public int updateWorkInLate(int userNo) {
		return wDao.updateWorkInLate(sqlSession, userNo);
	}

	@Override
	public int updateWorkOut(int userNo) {
		return wDao.updateWorkOut(sqlSession, userNo);
	}
	
	@Override
	public int updateWorkOutEarly(int userNo) {
		return wDao.updateWorkOutEarly(sqlSession, userNo);
	}
	
	@Override
	public int updateConnSta(Work w) {
		return wDao.updateConnSta(sqlSession, w);
	}

	@Override
	public int holiApplyEnroll(Holiday h) {
		return wDao.holiApplyEnroll(sqlSession, h);
	}

	@Override
	public ArrayList<Holiday> selectHoliList(int userNo) {
		return wDao.selectHoliList(sqlSession, userNo);
	}

	@Override
	public int holidayApplyDelete(Holiday h) {
		return wDao.holidayApplyDelete(sqlSession, h);
	}

	@Override
	public Member selectMemberHoliday(int userNo) {
		return wDao.selectMemberHoliday(sqlSession, userNo);
	}

	@Override
	public ArrayList<Holiday> selectMemberHolidayList(int userNo) {
		return wDao.selectMemberHolidayList(sqlSession,userNo);
	}

	@Override
	public int holidayApprove(Holiday h) {
		return wDao.holidayApprove(sqlSession, h);
	}

	@Override
	public int holidayInsert(Holiday h) {
		return wDao.holidayInsert(sqlSession, h);
	}

	@Override
	public int holidayGive(Holiday h) {
		return wDao.holidayGive(sqlSession, h);
	}

	@Override
	public ArrayList<Work> selectMemberWorkList(int userNo) {
		return wDao.selectMemberWorkList(sqlSession, userNo);
	}

	@Override
	public Work countWorkStatus(int userNo) {
		return wDao.countWorkStatus(sqlSession, userNo);
	}

	@Override
	public ArrayList<Work> workCalendar(int userNo) {
		return wDao.workCalendar(sqlSession, userNo);
	}

	@Override
	public int updateWorkTime(int userNo) {
		return wDao.updateWorkTime(sqlSession, userNo);
	}

	@Override
	public ArrayList<Member> selectAllMember() {
		return wDao.selectAllMember(sqlSession);
	}

	@Override
	public ArrayList<Member> selectWorkCountList() {
		return wDao.selectWorkCountList(sqlSession);
	}

	@Override
	public ArrayList<Member> selectTimeCountList() {
		return wDao.selectTimeCountList(sqlSession);
	}

	@Override
	public ArrayList<Work> workCalendarOut(int userNo) {
		return wDao.workCalendarOut(sqlSession, userNo);
	}
	
	
	
}
