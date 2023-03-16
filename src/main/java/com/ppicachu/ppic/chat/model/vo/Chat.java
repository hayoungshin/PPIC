package com.ppicachu.ppic.chat.model.vo;

import java.util.ArrayList;

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
	private ArrayList<Member> memList;
}
