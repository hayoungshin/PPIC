package com.ppicachu.ppic.reservation.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ReservationRoom {

	private int roomResNo;
	private String startDate;
	private String endDate;
	private String subject;
	private String roomNo;
	private String resUser;
	private String createDate;
	private String modifyDate;
	
	private String resUserName;
	private String resDeptNo;
	private String resDeptName;
	private String resPosition;
	
	private ArrayList<ResParticipant> rParticipants;
	private ArrayList<Room> rooms;
	
}
