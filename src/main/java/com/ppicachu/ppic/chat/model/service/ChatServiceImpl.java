package com.ppicachu.ppic.chat.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.chat.model.dao.ChatDao;
import com.ppicachu.ppic.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao cDao;

	@Override
	public int updateConn(Member m) {
		return cDao.updateConn(sqlSession, m);
	}
}
