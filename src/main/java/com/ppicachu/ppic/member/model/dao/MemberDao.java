package com.ppicachu.ppic.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectMember");
	}
	
	

}
