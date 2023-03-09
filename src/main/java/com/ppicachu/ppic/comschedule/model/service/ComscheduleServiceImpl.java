package com.ppicachu.ppic.comschedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.comschedule.model.dao.ComscheduleDao;
import com.ppicachu.ppic.comschedule.model.vo.Comschedule;

@Service
public class ComscheduleServiceImpl implements ComscheduleService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ComscheduleDao cDao;

	@Override
	public ArrayList<Comschedule> selectComscheduleList() {
		return cDao.selectComscheduleList(sqlSession);
	}

}
