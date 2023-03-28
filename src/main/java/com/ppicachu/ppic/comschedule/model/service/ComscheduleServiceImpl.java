package com.ppicachu.ppic.comschedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.comschedule.model.dao.ComscheduleDao;
import com.ppicachu.ppic.comschedule.model.vo.Comschedule;

@Service
public class ComscheduleServiceImpl implements ComscheduleService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ComscheduleDao cDao;

	@Override
	public ArrayList<Comschedule> selectComscheduleList(int schKind) {
		return cDao.selectComscheduleList(sqlSession, schKind);
	}

	@Override
	public int insertSchedule(Comschedule cs) {
		return cDao.insertSchedule(sqlSession, cs);
	}

	@Override
	public int deleteSchedule(int schNo) {
		return cDao.deleteSchedule(sqlSession, schNo);
	}

	@Override
	public int updateSchedule(Comschedule cs) {
		return cDao.updateSchedule(sqlSession, cs);
	}

	@Override
	public ArrayList<Comschedule> scheduleCalendar() {
		return cDao.scheduleCalendar(sqlSession);
	}

}
