package com.ppicachu.ppic.alarm.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.alarm.model.dao.AlarmDao;
import com.ppicachu.ppic.alarm.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AlarmDao aDao;

	@Override
	public int insertAlarm(Alarm a) {
		return aDao.insertAlarm(sqlSession, a);
	}

	@Override
	public ArrayList<Alarm> selectNoti(int userNo) {
		return aDao.selectNoti(sqlSession, userNo);
	}

	@Override
	public int updateNoti(ArrayList<Integer> nfNo) {
		return aDao.updateNoti(sqlSession, nfNo);
	}

	@Override
	public ArrayList<Alarm> selectNotiList(Alarm a) {
		return aDao.selectNotiList(sqlSession, a);
	}
}
