package com.ppicachu.ppic.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.chat.model.dao.ChatDao;
import com.ppicachu.ppic.chat.model.vo.Chat;
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

	@Override
	public ArrayList<Member> searchName(Member m) {
		return cDao.searchName(sqlSession, m);
	}

	@Override
	public ArrayList<Chat> selectChatRoomList(Chat c) {
		return cDao.selectChatRoomList(sqlSession, c);
	}

	@Override
	public int insertChatRoom(HashMap<String, Integer> map) {
		return cDao.insertChatRoom(sqlSession, map);
	}

	@Override
	public int insertParticipant(ArrayList<Integer> checkNo) {
		return cDao.insertParticipant(sqlSession, checkNo);
	}

	@Override
	public ArrayList<Chat> selectChat(int roomNo) {
		return cDao.selectChat(sqlSession, roomNo);
	}

	@Override
	public int insertChat(Chat c) {
		return cDao.insertChat(sqlSession, c);
	}

}
