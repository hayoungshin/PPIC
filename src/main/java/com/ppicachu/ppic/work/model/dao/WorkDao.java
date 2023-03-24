package com.ppicachu.ppic.work.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.vo.Holiday;
import com.ppicachu.ppic.work.model.vo.HolidayApply;
import com.ppicachu.ppic.work.model.vo.Work;

@Repository
public class WorkDao {
	
	public ArrayList<Member> selectHolidayList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("workMapper.selectHolidayList");
	}
	
	public ArrayList<Holiday> selectHolidayUseList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("workMapper.selectHolidayUseList");
	}
	
	public ArrayList<Holiday> selectBeforeUseList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("workMapper.selectBeforeUseList");
	}
	
	public int completeWorkInsert(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("workMapper.completeWorkInsert");
	}
	
	public Work selectWorkRecord(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("workMapper.selectWorkRecor", userNo);
	}
	
	public int updateWorkIn(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("workMapper.updateWorkIn", userNo);
	}
	
	public int updateWorkInLate(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("workMapper.updateWorkInLate", userNo);
	}
	
	public int updateWorkOut(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("workMapper.updateWorkOut", userNo);
	}
	
	public int updateWorkOutEarly(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("workMapper.updateWorkOutEarly", userNo);
	}
	
	public int updateConnSta(SqlSessionTemplate sqlSession, Work w) {
		return sqlSession.update("workMapper.updateConnSta", w);
	}
	
	public Member selectMemberHoliday(SqlSessionTemplate sqlSession, int userNo ) {
		return sqlSession.selectOne("workMapper.selectMemberHoliday", userNo);
	}
	
	public int holiApplyEnroll(SqlSessionTemplate sqlSession, Holiday h) {
		return sqlSession.insert("workMapper.holiApplyEnroll", h);
	}
	
	public ArrayList<Holiday> selectHoliList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("workMapper.selectHoliList", userNo);
	}
	
	public int holidayApplyDelete(SqlSessionTemplate sqlSession, Holiday h) {
		return sqlSession.delete("workMapper.holidayApplyDelete",h);
	}
	
	public ArrayList<Holiday> selectMemberHolidayList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("workMapper.selectMemberHolidayList", userNo);
	}
	
	public int holidayApprove(SqlSessionTemplate sqlSession, Holiday h) {
		return sqlSession.update("workMapper.holidayApprove", h);
	}
	
	public int holidayInsert(SqlSessionTemplate sqlSession, Holiday h) {
		return sqlSession.insert("workMapper.holidayInsert", h);
	}
	
	public int holidayGive(SqlSessionTemplate sqlSession, Holiday h) {
		return sqlSession.insert("workMapper.holidayGive", h);
	}
	
	public ArrayList<Work> selectMemberWorkList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("workMapper.selectMemberWorkList", userNo);
	}
	
	public Work countWorkStatus(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("workMapper.countWorkStatus", userNo);
	}
	
	public ArrayList<Work> workCalendar(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("workMapper.workCalendar", userNo);
	}
	
	public int updateWorkTime(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("workMapper.updateWorkTime", userNo);
	}
	
	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("workMapper.selectAllMember");
	}
	
	public ArrayList<Member> selectWorkCountList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("workMapper.selectWorkCountList");
	}
	
	public ArrayList<Member> selectTimeCountList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("workMapper.selectTimeCountList");
	}
}
