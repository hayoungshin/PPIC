package com.ppicachu.ppic.reservation.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.reservation.model.vo.ReservationRoom;
import com.ppicachu.ppic.reservation.model.vo.Room;

public interface ReservationService {

	// 회의실 리스트 조회
	ArrayList<Room>	selectRoomList();
	
	// 전체 예약일정 조회
	ArrayList<ReservationRoom> selectReservationRoomListAll();
}
