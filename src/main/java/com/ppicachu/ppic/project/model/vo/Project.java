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
public class Project {

	private int projectNo;
	private String projectManager;
	private String projectName;
	private String startDate;
	private String endDate;
	private String detail;
	private String createDate;
	private String modifyDate;
	private String deleteStatus;
	
	private ArrayList<ProjectParticipant> projectParticipants;
	private ArrayList<Task> tasks;
}
