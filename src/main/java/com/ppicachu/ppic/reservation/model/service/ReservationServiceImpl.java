package com.ppicachu.ppic.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.reservation.model.dao.ReservationDao;
import com.ppicachu.ppic.reservation.model.vo.ReservationRoom;
import com.ppicachu.ppic.reservation.model.vo.Room;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservationDao rDao;

	@Override
	public ArrayList<Room> selectRoomList() {
		return rDao.selectRoomList(sqlSession);
	}

	@Override
	public ArrayList<ReservationRoom> selectReservationRoomListAll() {
		return rDao.selectReservationRoomListAll(sqlSession);
	}
	
}
