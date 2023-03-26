package com.ppicachu.ppic.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.project.model.dao.ProjectDao;
import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.ProjectParticipant;
import com.ppicachu.ppic.project.model.vo.Task;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectDao pDao;
	
	@Override
	public ArrayList<Project> selectProjectList(int userNo) {
		return pDao.selectProjectList(sqlSession, userNo);
	}

	@Override
	public ArrayList<ProjectParticipant> selectProjectParticipants(int projectNo) {
		return pDao.selectProjectParticipants(sqlSession, projectNo);
	}
	
	@Override
	public ArrayList<Task> selectTaskList(int projectNo) {
		return pDao.selectTaskList(sqlSession, projectNo); 
	}

	@Override
	public ArrayList<ArrayList<ProjectParticipant>> selectTaskParticipants(ArrayList<Task> tList) {
		return pDao.selectTaskParticipants(sqlSession, tList);
	}

	@Override
	public int selectCountTaskParticipants(int taskNo) {
		return pDao.selectCountTaskParticipants(sqlSession, taskNo);
	}

	@Override
	public int updateTaskStatus(Task t) {
		return pDao.updateTaskStatus(sqlSession, t);
	}

	@Override
	public ArrayList<ProjectParticipant> selectDeptList(HashMap<String, Integer> map) {
		return pDao.selectDeptList(sqlSession, map);
	}
	
	@Override
	public ArrayList<ProjectParticipant> selectEmployeesList(HashMap<String, Integer> map) {
		return pDao.selectEmployeesList(sqlSession, map);
	}

	@Override
	public int insertTask(Task t) {
		return pDao.insertTask(sqlSession, t);
	}

	@Override
	public int insertTaskParticipants(ArrayList<ProjectParticipant> taskRefUser) {
		return pDao.insertTaskParticipants(sqlSession, taskRefUser);
	}

	@Override
	public Task selectTaskDetail(int taskNo) {
		return pDao.selectTaskDetail(sqlSession, taskNo);
	}

	@Override
	public int updateTask(Task t) {
		return pDao.updateTask(sqlSession, t);
	}

	@Override
	public int deleteTaskParticipant(int taskNo) {
		return pDao.deleteTaskParticipant(sqlSession, taskNo);
	}

	@Override
	public int addTaskParticipant(ArrayList<ProjectParticipant> updateList) {
		return pDao.addTaskParticipant(sqlSession, updateList);
	}

	@Override
	public int deleteTask(int taskNo) {
		return pDao.deleteTask(sqlSession, taskNo);
	}

	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p);
	}

	@Override
	public int insertProjectParticipants(ArrayList<ProjectParticipant> ppList) {
		return pDao.insertProjectParticipants(sqlSession, ppList);
	}

	@Override
	public int updateProject(Project p) {
		return pDao.updateProject(sqlSession, p);
	}

	@Override
	public int deleteProjectParticipants(int projectNo) {
		return pDao.deleteProjectParticipants(sqlSession, projectNo);
	}
	

	


}
