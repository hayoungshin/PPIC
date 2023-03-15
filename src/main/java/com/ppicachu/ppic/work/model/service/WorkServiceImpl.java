package com.ppicachu.ppic.work.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.work.model.dao.WorkDao;
import com.ppicachu.ppic.work.model.vo.Holiday;
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

}
