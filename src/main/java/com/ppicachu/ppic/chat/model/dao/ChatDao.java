package com.ppicachu.ppic.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.member.model.vo.Member;

@Repository
public class ChatDao {

	public int updateConn(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("chatMapper.updateConn", m);
	}
}
