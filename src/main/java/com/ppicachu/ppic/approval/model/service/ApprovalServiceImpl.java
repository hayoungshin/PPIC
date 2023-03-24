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
import com.ppicachu.ppic.approval.model.vo.FormCash;
import com.ppicachu.ppic.approval.model.vo.FormConsume;
import com.ppicachu.ppic.approval.model.vo.FormDraft;
import com.ppicachu.ppic.approval.model.vo.FormTransfer;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.Attachment;
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

	@Override
	public ArrayList<AppChange> selectChange(int approvalNo) {
		return aDao.selectChange(sqlSession, approvalNo);
	}

	@Override
	public int updateProcess(AppProcess ap) {
		return aDao.updateProcess(sqlSession, ap);
	}

	@Override
	public int updateCurrentOrder(Approval a) {
		return aDao.updateCurrentOrder(sqlSession, a);
	}

	@Override
	public int insertChange(AppChange ac) {
		return aDao.insertChange(sqlSession, ac);
	}

	@Override
	public ArrayList<Member> selectMemberList() {
		return aDao.selectMemberList(sqlSession);
	}

	@Override
	public int insertApproval(Approval a, ArrayList<AppProcess> apList, AppChange ac, ArrayList<Attachment> atList) {
		int result1 = aDao.insertApproval(sqlSession, a);
		int result2 = aDao.insertProcess(sqlSession, apList);
		int result3 = aDao.insertChange(sqlSession, ac);
		int result4 = 0;
		if(atList.isEmpty()) {
			result4 = 1;
		} else {
			result4 = aDao.insertAppAttachment(sqlSession, atList);
		}
		
		return result1 * result2 * result3 * result4;
	}

	@Override
	public int insertDraft(FormDraft fdr) {
		return aDao.insertDraft(sqlSession, fdr);
	}

	@Override
	public int insertTransfer(ArrayList<FormTransfer> ftrList) {
		return aDao.insertTransfer(sqlSession, ftrList);
	}

	@Override
	public int insertConsume(ArrayList<FormConsume> fcoList) {
		return aDao.insertConsume(sqlSession, fcoList);
	}

	@Override
	public int insertCash(ArrayList<FormCash> fcaList) {
		return aDao.insertCash(sqlSession, fcaList);
	}

}
