package com.ppicachu.ppic.work.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.vo.Holiday;

@Repository
public class WorkDao {
	
	public ArrayList<Member> selectHolidayList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("workMapper.selectHolidayList");
	}
	
	

}
