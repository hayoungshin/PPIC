package com.ppicachu.ppic.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.approval.model.dao.ApprovalDao;
import com.ppicachu.ppic.approval.model.vo.AppChange;
import com.ppicachu.ppic.approval.model.vo.AppProcess;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.FormDraft;
import com.ppicachu.ppic.approval.model.vo.FormTransfer;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.member.model.vo.Member;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao aDao;
	
	@Override
	public int selectListCount(MyDept md) {
		return aDao.selectListCount(sqlSession, md);
	}

	@Override
	public ArrayList<Approval> selectList(MyDept md, PageInfo pi) {
		return aDao.selectList(sqlSession, md, pi);
	}

	@Override
	public ArrayList<Approval> selectEdList(MyDept md, PageInfo pi) {
		return aDao.selectEdList(sqlSession, md, pi);
	}

	@Override
	public int selectTemListCount(MyDept md) {
		return aDao.selectTemListCount(sqlSession, md);
	}

	@Override
	public ArrayList<Approval> selectTemList(MyDept md, PageInfo pi) {
		return aDao.selectTemList(sqlSession, md, pi);
	}

}
