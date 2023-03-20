package com.ppicachu.ppic.alarm.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.alarm.model.vo.Alarm;

@Repository
public class AlarmDao {
	
	public int insertAlarm(SqlSessionTemplate sqlSession, Alarm a) {
		return sqlSession.insert("notificationMapper.insertAlarm", a);
	}
	
	public ArrayList<Alarm> selectNoti(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("notificationMapper.selectNoti", userNo);
	}
	
	public int updateNoti(SqlSessionTemplate sqlSession, ArrayList<Integer> nfNo) {
		return sqlSession.update("notificationMapper.updateNoti", nfNo);
	}

	public ArrayList<Alarm> selectNotiList(SqlSessionTemplate sqlSession, Alarm a) {
		return (ArrayList)sqlSession.selectList("notificationMapper.selectNotiList", a);
	}
	
	public int deleteNoti(SqlSessionTemplate sqlSession, ArrayList<Integer> nfNo) {
		return sqlSession.update("notificationMapper.deleteNoti", nfNo);
	}
}
