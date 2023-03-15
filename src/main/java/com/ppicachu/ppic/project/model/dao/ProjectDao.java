package com.ppicachu.ppic.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.project.model.vo.Project;

@Repository
public class ProjectDao {

	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProjectList", userNo);
	}
}
