package com.ppicachu.ppic.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.member.model.dao.MemberDao;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.member.model.vo.Position;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public ArrayList<Member> selectListMember() {
		return mDao.selectListMember(sqlSession);
	}

	@Override
	public ArrayList<Department> selectDeptList() {
		return mDao.selectDeptList(sqlSession);
	}

	@Override
	public Member selectMember(int userNo) {
		return mDao.selectMember(sqlSession, userNo);
	}

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int updateProfileImg(Member m) {
		return mDao.updateProfileImg(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}
	
	@Override
	public int detailUpdateMember(Member m) {
		return mDao.detailUpdateMember(sqlSession, m);
	}

	@Override
	public int idCheck(String checkId) {
		return mDao.idCheck(sqlSession, checkId);
	}

	@Override
	public ArrayList<Position> selectPositionList() {
		return mDao.selectPositionList(sqlSession);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public String findId(Member m) {
		return mDao.findId(sqlSession, m);
	}

	@Override
	public int resetPwd(Member m) {
		return mDao.resetPwd(sqlSession, m);
	}

	@Override
	public ArrayList<Member> selectMemForMail() {
		return mDao.selectMemForMail(sqlSession);
	}

	@Override
	public ArrayList<Member> selectAuthorityMemList(int authoNo) {
		return mDao.selectAuthorityMemList(sqlSession, authoNo);
	}

	@Override
	public ArrayList<Department> selectMemCountForMail() {
		return mDao.selectMemCountForMail(sqlSession);
	}

	@Override
	public ArrayList<Member> selectLikeMemForMail(int userNo) {
		return mDao.selectLikeMemForMail(sqlSession, userNo);
	}

	@Override
	public int deleteMember(int userNo) {
		return mDao.deleteMember(sqlSession, userNo);
	}

	


}
