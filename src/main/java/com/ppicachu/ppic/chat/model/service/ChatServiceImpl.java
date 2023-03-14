package com.ppicachu.ppic.chat.model.service;

import java.util.ArrayList;

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

	@Override
	public ArrayList<Member> selectListMember(int userNo) {
		return cDao.selectListMember(sqlSession, userNo);
	}

	@Override
	public int insertChatLike(Member m) {
		return cDao.insertChatLike(sqlSession, m);
	}

	@Override
	public int deleteChatLike(Member m) {
		return cDao.deleteChatLike(sqlSession, m);
	}
}
