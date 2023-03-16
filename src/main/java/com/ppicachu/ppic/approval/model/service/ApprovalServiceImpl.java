package com.ppicachu.ppic.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.approval.model.dao.ApprovalDao;
import com.ppicachu.ppic.approval.model.vo.AppChange;
import com.ppicachu.ppic.approval.model.vo.AppDetail;
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

	@Override
	public int selectMaListCount(MyDept md) {
		return aDao.selectMaListCount(sqlSession, md);
	}

	@Override
	public ArrayList<Approval> selectMaList(MyDept md, PageInfo pi) {
		return aDao.selectMaList(sqlSession, md, pi);
	}

	@Override
	public int updateBook(Approval a) {
		return aDao.updateBook(sqlSession, a);
	}

	@Override
	public int deleteApproval(String[] noArr) {
		return aDao.deleteApproval(sqlSession, noArr);
	}

	/*@Override
	public int removeApproval(String[] noArr) {
		return aDao.removeApproval(sqlSession, noArr);
	}*/

	@Override
	public int recoverApproval(String[] noArr) {
		return aDao.recoverApproval(sqlSession, noArr);
	}

	@Override
	public AppDetail selectDraftApp(int approvalNo) {
		return aDao.selectDraftApp(sqlSession, approvalNo);
	}

	@Override
	public AppDetail selectTransferApp(int approvalNo) {
		return aDao.selectTransferApp(sqlSession, approvalNo);
	}

	@Override
	public AppDetail selectConsumeApp(int approvalNo) {
		return aDao.selectConsumeApp(sqlSession, approvalNo);
	}

	@Override
	public AppDetail selectCashApp(int approvalNo) {
		return aDao.selectCashApp(sqlSession, approvalNo);
	}

}
