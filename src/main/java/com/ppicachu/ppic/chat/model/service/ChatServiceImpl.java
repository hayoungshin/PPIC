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
	public int insertChat(HashMap<String, Object> map) {
		return cDao.insertChat(sqlSession, map);
	}
	
	@Override
	public int updateChatRoom(int roomNo) {
		return cDao.updateChatRoom(sqlSession, roomNo);
	}
	
	@Override
	public int updateNotreadChat(HashMap<String, Object> hm) {
		return cDao.updateNotreadChat(sqlSession, hm);
	}

	@Override
	public int updateLastreadChat(HashMap<String, Object> hm) {
		return cDao.updateLastreadChat(sqlSession, hm);
	}

	@Override
	public Chat selectChatRoom(int roomNo) {
		return cDao.selectChatRoom(sqlSession, roomNo);
	}

	@Override
	public int deleteParticipant(int roomNo) {
		return cDao.deleteParticipant(sqlSession, roomNo);
	}

	@Override
	public int deleteChatRoom(int roomNo) {
		return cDao.deleteChatRoom(sqlSession, roomNo);
	}

	@Override
	public int selectLastReadChat(Chat c) {
		return cDao.selectLastReadChat(sqlSession, c);
	}
	
	@Override
	public int selectMaxChat(Chat c) {
		return cDao.selectMaxChat(sqlSession, c);
	}
	
	@Override
	public int updateParticipant(Chat c) {
		return cDao.updateParticipant(sqlSession, c);
	}
	
	@Override
	public int updateChat(Chat c) {
		return cDao.updateChat(sqlSession, c);
	}

	
}
