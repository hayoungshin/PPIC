package com.ppicachu.ppic.work.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.vo.Holiday;
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

}
