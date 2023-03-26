package com.ppicachu.ppic.chat.model.vo;

import java.util.ArrayList;
import java.util.Date;

import com.ppicachu.ppic.member.model.vo.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Chat {

	private int chatNo;
	private int roomNo;
	private String sendUser;
	private String chatContent;
	private String sendDate;
	private Date sendDateD;
	private String notRead;
	private String roomName;
	private String lastChat;
	private String createDate;
	private String modifyDate;
	private String participantName;
	private String notreadChat;
	private String lastreadChat;
	private int participantNo;
	private String profileImg;
	private int groupCount;
	private int groupSta;
	private int sendNo;
	private String sendName;
	private String sendProfile;
	private ArrayList<Member> memList;
	private Date exitDate;
	private int userNo;
	private int outMsg;
}
