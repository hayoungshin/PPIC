package com.ppicachu.ppic.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.ProjectParticipant;
import com.ppicachu.ppic.project.model.vo.Task;

@Repository
public class ProjectDao {

	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList", userNo); 
	}
	
	public ArrayList<ProjectParticipant> selectProjectParticipants(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectParticipants", projectNo);
	}
	
	public ArrayList<Task> selectTaskList(SqlSessionTemplate sqlSession, int projectNo)	{
		return (ArrayList)sqlSession.selectList("projectMapper.selectTaskList", projectNo);
	}
	
	public ArrayList<ArrayList<ProjectParticipant>> selectTaskParticipants(SqlSessionTemplate sqlSession, ArrayList<Task> tList) {
		ArrayList<ArrayList<ProjectParticipant>> tpList = new ArrayList<>();
		for(int i=0; i<tList.size(); i++) {
			tpList.add((ArrayList)sqlSession.selectList("projectMapper.selectTaskParticipants", tList.get(i).getTaskNo()));
		}
		return tpList;
	}
	
	public int selectCountTaskParticipants(SqlSessionTemplate sqlSession, int taskNo) {
		return sqlSession.selectOne("projectMapper.selectCountTaskParticipants", taskNo);
	}
	
	public int updateTaskStatus(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.update("projectMapper.updateTaskStatus", t);
	}
	
	public ArrayList<ProjectParticipant> selectDeptList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectDeptList", map);
	}
	
	public ArrayList<ProjectParticipant> selectEmployeesList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectEmployeesList", map);
	}
	
	public int insertTask(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.insert("projectMapper.insertTask", t);
	}
	
	public int insertTaskParticipants(SqlSessionTemplate sqlSession, ArrayList<ProjectParticipant> taskRefUser) {
		int result = 0;
		for(int i=0; i<taskRefUser.size(); i++) {
			result += sqlSession.insert("projectMapper.insertTaskParticipants", taskRefUser.get(i));
		}
		return result;
	}
	
	public Task selectTaskDetail(SqlSessionTemplate sqlSession, int taskNo) {
		return sqlSession.selectOne("projectMapper.selectTaskDetail", taskNo);
	}
	
	public int updateTask(SqlSessionTemplate sqlSession, Task t) {
		return sqlSession.update("projectMapper.updateTask", t);
	}
	
	public int deleteTaskParticipant(SqlSessionTemplate sqlSession, int taskNo) {
		return sqlSession.delete("projectMapper.deleteTaskParticipant", taskNo);
	}
	
	public int addTaskParticipant(SqlSessionTemplate sqlSession, ArrayList<ProjectParticipant> updateList) {
		int result = 0;
		for(int i=0; i<updateList.size(); i++) {
			result += sqlSession.insert("projectMapper.addTaskParticipant", updateList.get(i));
		}
		return result;
	}
	
	public int deleteTask(SqlSessionTemplate sqlSession, int taskNo) {
		return sqlSession.delete("projectMapper.deleteTask", taskNo);
	}
	
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	public int insertProjectParticipants(SqlSessionTemplate sqlSession, ArrayList<ProjectParticipant> ppList) {
		int result = 0;
		for(int i=0; i<ppList.size(); i++) {
			result += sqlSession.insert("projectMapper.insertProjectParticipants", ppList.get(i));
		}
		
		return result;
	}
}
