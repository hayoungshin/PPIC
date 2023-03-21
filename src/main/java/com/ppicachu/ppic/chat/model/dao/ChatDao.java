package com.ppicachu.ppic.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.chat.model.vo.Chat;
import com.ppicachu.ppic.member.model.vo.Member;

@Repository
public class ChatDao {

	public int updateConn(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("chatMapper.updateConn", m);
	}
	
	public ArrayList<Member> selectListMember(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("chatMapper.selectListMember", userNo);
	}
	
	public int insertChatLike(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("chatMapper.insertChatLike", m);
	}
	
	public int deleteChatLike(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.delete("chatMapper.deleteChatLike", m);
	}
	
	public ArrayList<Member> searchName(SqlSessionTemplate sqlSession, Member m){
		return (ArrayList)sqlSession.selectList("chatMapper.searchName", m);
	}
	
	public ArrayList<Chat> selectChatRoomList(SqlSessionTemplate sqlSession, Chat c){
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatRoomList", c);
	}
	
	public int insertChatRoom(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		sqlSession.insert("chatMapper.insertChatRoom", map);
		return Integer.valueOf(String.valueOf(map.get("roomNo")));
	}
	
	public int insertParticipant(SqlSessionTemplate sqlSession, ArrayList<Integer> checkNo) { 
		return sqlSession.insert("chatMapper.insertParticipant", checkNo); 
	}
	 
	public ArrayList<Chat> selectChat(SqlSessionTemplate sqlSession, int roomNo){
		return (ArrayList)sqlSession.selectList("chatMapper.selectChat", roomNo); 
	}
	
	public int insertChat(SqlSessionTemplate sqlSession, HashMap<String, Object> map) { 
		sqlSession.insert("chatMapper.insertChat", map); 
		return Integer.valueOf(String.valueOf(map.get("chatNo")));
	}
	
	public int updateChatRoom(SqlSessionTemplate sqlSession, int roomNo) { 
		return sqlSession.update("chatMapper.updateChatRoom", roomNo); 
	}
	
	public int updateNotreadChat(SqlSessionTemplate sqlSession, HashMap<String, Object> hm) {
		return sqlSession.update("chatMapper.updateNotreadChat", hm); 
	}
	
    public int updateLastreadChat(SqlSessionTemplate sqlSession, HashMap<String, Object> hm) {
    	return sqlSession.update("chatMapper.updateLastreadChat", hm); 
    }
	
	public Chat selectChatRoom(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.selectOne("chatMapper.selectChatRoom", roomNo); 
	}
	
	public int deleteParticipant(SqlSessionTemplate sqlSession, int roomNo) { 
		return sqlSession.delete("chatMapper.deleteParticipant", roomNo); 
	}
	
	public int deleteChatRoom(SqlSessionTemplate sqlSession, int roomNo) { 
		return sqlSession.delete("chatMapper.deleteChatRoom", roomNo); 
	}
	
	public int selectLastReadChat(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.selectOne("chatMapper.selectLastReadChat", c);
	}
	
	public int selectMaxChat(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.selectOne("chatMapper.selectMaxChat", c);
	}
	
	public int updateParticipant(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.update("chatMapper.updateParticipant", c); 
	}
	
	public int updateChat(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.update("chatMapper.updateChat", c); 
	}
	 
}
