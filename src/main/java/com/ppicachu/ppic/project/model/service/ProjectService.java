package com.ppicachu.ppic.project.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.Task;

public interface ProjectService {
	// 페이지 조회
	ArrayList<Project> selectProjectList(int userNo);
	ArrayList<Task> selectTaskList(Project p);
}
