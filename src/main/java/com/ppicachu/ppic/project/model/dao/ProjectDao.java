package com.ppicachu.ppic.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.ProjectParticipant;

@Repository
public class ProjectDao {

	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList", userNo); 
	}
	
	public ArrayList<ProjectParticipant> selectProjectParticipants(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectParticipants", projectNo);
	}
}
