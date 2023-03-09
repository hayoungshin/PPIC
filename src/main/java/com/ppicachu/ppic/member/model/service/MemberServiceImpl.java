package com.ppicachu.ppic.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.member.model.dao.MemberDao;
import com.ppicachu.ppic.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public ArrayList<Member> selectMember() {
		return mDao.selectMember(sqlSession);
	}
	

}
