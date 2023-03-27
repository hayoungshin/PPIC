package com.ppicachu.ppic.member.model.vo;

import java.util.ArrayList;

import com.ppicachu.ppic.chat.model.vo.Chat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String mail;
	private String phone;
	private String address;
	private String birthday;
	private String position;
	private String department;
	private String employeeNo;
	private String profileImg;
	private String hireDate;
	private String resignDate;
	private String status;
	private String authorityNo;
	private String memberSign;
	private String connSta;
	private String positionNo;
	private String departmentNo;
	
	private String authority[];
	private String auth;
	
	private String giveDay;
	private String useDay;
	private String addDay;
	
	private String chatLike;
	private int roomNo;
	private int lastreadChat;
	private int groupCount;
	private int groupSta;
	private String exitDate;
	
	private String absenteeism;
	private String leavearly;
	private String behindtime;
	
	private String workTime;
	private String workCount;
}
