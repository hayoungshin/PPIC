package com.ppicachu.ppic.comschedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.comschedule.model.vo.Comschedule;

@Repository
public class ComscheduleDao {

	public ArrayList<Comschedule> selectComscheduleList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("comscheduleMapper.selectComscheduleList");
	}
}
