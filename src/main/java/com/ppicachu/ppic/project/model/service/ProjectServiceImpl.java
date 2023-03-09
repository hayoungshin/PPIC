package com.ppicachu.ppic.project.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.Task;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Override
	public ArrayList<Project> selectProjectList(Member m) {
		return null;
	}

	@Override
	public ArrayList<Task> selectTaskList(Project p) {
		return null;
	}

}
