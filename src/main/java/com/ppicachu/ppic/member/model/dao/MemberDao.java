package com.ppicachu.ppic.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.member.model.vo.Position;

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
	
	public int detailUpdateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.detailUpdateMeber", m);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public ArrayList<Position> selectPositionList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectPositionList");
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public String findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}
	
	public int resetPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.resetPwd", m);
	}
	
	public ArrayList<Member> selectMemForMail(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemForMail");
	}
	
	public ArrayList<Member> selectAuthorityMemList(SqlSessionTemplate sqlSession, int authoNo){
		return (ArrayList)sqlSession.selectList("memberMapper.selectAuthorityMemList", authoNo);
	}
	
	public ArrayList<Department> selectMemCountForMail(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemCountForMail");
	}
	
	public ArrayList<Member> selectLikeMemForMail(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("memberMapper.selectLikeMemForMail", userNo);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}
	
	public ArrayList<Member> authMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.authMemberList");
	}
	
	public int authUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.authUpdate", m);
	}

}
