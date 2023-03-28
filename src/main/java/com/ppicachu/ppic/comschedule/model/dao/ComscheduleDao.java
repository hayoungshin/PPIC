package com.ppicachu.ppic.comschedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.comschedule.model.vo.Comschedule;

@Repository
public class ComscheduleDao {

	public ArrayList<Comschedule> selectComscheduleList(SqlSessionTemplate sqlSession, int schKind){
		return (ArrayList)sqlSession.selectList("comscheduleMapper.selectComscheduleList", schKind);
	}
	
	public int insertSchedule(SqlSessionTemplate sqlSession, Comschedule cs) {
		return sqlSession.insert("comscheduleMapper.insertSchedule", cs);
	}
	
	public int deleteSchedule(SqlSessionTemplate sqlSession, int schNo) {
		return sqlSession.delete("comscheduleMapper.deleteSchedule", schNo);
	}
	
	public int updateSchedule(SqlSessionTemplate sqlSession, Comschedule cs) {
		return sqlSession.update("comscheduleMapper.updateSchedule", cs);
	}
	
	public ArrayList<Comschedule> scheduleCalendar(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("comscheduleMapper.scheduleCalendar");
	}
}
