package com.ppicachu.ppic.reservation.model.vo;


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
public class Room {

	private int roomNo;
	private String roomName;
	private String createDate;
	private String modifyDate;
	private String createUser;
	private String deleteStatus;
	
}
