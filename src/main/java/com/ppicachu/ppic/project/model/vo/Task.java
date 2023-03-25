package com.ppicachu.ppic.project.model.vo;

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
public class Task {
	
	private int taskNo;
	private int projectNo;
	private String assignUser;
	private String taskName;
	private String taskContent;
	private String filePath;
	private String originName;
	private String taskStatus;
	private String createDate;
	private String modifyDate;
	private String deleteStatus;
	
	private ArrayList<ProjectParticipant> projectParticipants;
	private String positionName;
	private String userNo;
	private String userImg;
	private int refPeopleCnt;
	private String assignUserName;
	private String departmentNo;
	
}
