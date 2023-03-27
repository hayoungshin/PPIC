package com.ppicachu.ppic.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.reservation.model.vo.ReservationRoom;
import com.ppicachu.ppic.reservation.model.vo.Room;

@Repository
public class ReservationDao {

	public ArrayList<Room> selectRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomList");
	}
	
	public ArrayList<ReservationRoom> selectReservationRoomListAll(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationRoomListAll");
	}
}
