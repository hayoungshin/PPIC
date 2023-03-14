package com.ppicachu.ppic.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public ArrayList<Member> selectListMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectListMember");
	}
	
	public ArrayList<Department> selectDeptList (SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectDeptList");
	}
	
	public Member selectMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.selectMember", userNo);
	}
	
	// 로그인 대충
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int updateProfileImg(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateProfileImg", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

}
