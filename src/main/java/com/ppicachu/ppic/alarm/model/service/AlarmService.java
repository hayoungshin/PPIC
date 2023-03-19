package com.ppicachu.ppic.alarm.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.alarm.model.vo.Alarm;

public interface AlarmService {

	int insertAlarm(Alarm a);
	
	ArrayList<Alarm> selectNoti(int userNo);
	
	int updateNoti(ArrayList<Integer> nfNo);
	
	ArrayList<Alarm> selectNotiList(Alarm a);
	
	int deleteNoti(ArrayList<Integer> nfNo);
}
