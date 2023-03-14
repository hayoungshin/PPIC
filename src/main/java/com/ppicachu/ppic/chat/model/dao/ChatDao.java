package com.ppicachu.ppic.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
