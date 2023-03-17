package com.ppicachu.ppic.project.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.ProjectParticipant;
import com.ppicachu.ppic.project.model.vo.Task;

public interface ProjectService {
	// 프로젝트 조회
	ArrayList<Project> selectProjectList(int userNo);
	
	// 프로젝트 참여자정보 조회
	ArrayList<ProjectParticipant> selectProjectParticipants(int projectNo);
	
	// 프로젝트 하위 작업 조회
	ArrayList<Task> selectTaskList(int projectNo);
}
