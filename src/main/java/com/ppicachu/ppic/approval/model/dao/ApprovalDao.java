package com.ppicachu.ppic.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class ApprovalDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, MyDept md) {
		return sqlSession.selectOne("approvalMapper.selectListCount", md);
	}
	
	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession, MyDept md, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList", md, rowBounds);
	}

	public ArrayList<Approval> selectEdList(SqlSessionTemplate sqlSession, MyDept md, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectEdList", md, rowBounds);
	}

	public int selectTemListCount(SqlSessionTemplate sqlSession, MyDept md) {
		return sqlSession.selectOne("approvalMapper.selectTemListCount", md);
	}

	public ArrayList<Approval> selectTemList(SqlSessionTemplate sqlSession, MyDept md, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTemList", md, rowBounds);
	}

	public int selectMaListCount(SqlSessionTemplate sqlSession, MyDept md) {
		return sqlSession.selectOne("approvalMapper.selectMaListCount", md);
	}

	public ArrayList<Approval> selectMaList(SqlSessionTemplate sqlSession, MyDept md, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMaList", md, rowBounds);
	}

	public int updateBook(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.update("approvalMapper.updateBook", a);
	}

	public int deleteApproval(SqlSessionTemplate sqlSession, String[] noArr) {
		return sqlSession.update("approvalMapper.deleteApproval", noArr);
	}
	
	public int removeProcess(SqlSessionTemplate sqlSession, ArrayList<Approval> aList) {
		int result = 0;
		for(int i=0; i<aList.size(); i++) {
			result = sqlSession.delete("approvalMapper.removeProcess", aList.get(i));
		}
		return result;
	}

	public int removeChange(SqlSessionTemplate sqlSession, ArrayList<Approval> aList) {
		int result = 0;
		for(int i=0; i<aList.size(); i++) {
			result = sqlSession.delete("approvalMapper.removeChange", aList.get(i));
		}
		return result;
	}

	public void removeAppAttachment(SqlSessionTemplate sqlSession, ArrayList<Approval> aList) {
		for(int i=0; i<aList.size(); i++) {
			sqlSession.delete("approvalMapper.removeAppAttachment", aList.get(i));
		}
	}

	public void removeDraft(SqlSessionTemplate sqlSession, int approvalNo) {
		sqlSession.delete("approvalMapper.removeDraft", approvalNo);
	}

	public void removeTransfer(SqlSessionTemplate sqlSession, int approvalNo) {
		sqlSession.delete("approvalMapper.removeTransfer", approvalNo);
	}

	public void removeConsume(SqlSessionTemplate sqlSession, int approvalNo) {
		sqlSession.delete("approvalMapper.removeConsume", approvalNo);
	}

	public void removeCash(SqlSessionTemplate sqlSession, int approvalNo) {
		sqlSession.delete("approvalMapper.removeCash", approvalNo);
	}

	public int removeApproval(SqlSessionTemplate sqlSession, ArrayList<Approval> aList) {
		int result = 0;
		for(int i=0; i<aList.size(); i++) {
			result = sqlSession.delete("approvalMapper.removeApproval", aList.get(i));
		}
		return result;
	}

	public int recoverApproval(SqlSessionTemplate sqlSession, String[] noArr) {
		return sqlSession.update("approvalMapper.recoverApproval", noArr);
	}

	public AppDetail selectDraftApp(SqlSessionTemplate sqlSession, int approvalNo) {
		return sqlSession.selectOne("approvalMapper.selectDraftApp", approvalNo);
	}

	public AppDetail selectTransferApp(SqlSessionTemplate sqlSession, int approvalNo) {
		return sqlSession.selectOne("approvalMapper.selectTransferApp", approvalNo);
	}

	public AppDetail selectConsumeApp(SqlSessionTemplate sqlSession, int approvalNo) {
		return sqlSession.selectOne("approvalMapper.selectConsumeApp", approvalNo);
	}

	public AppDetail selectCashApp(SqlSessionTemplate sqlSession, int approvalNo) {
		return sqlSession.selectOne("approvalMapper.selectCashApp", approvalNo);
	}

	public ArrayList<AppChange> selectChange(SqlSessionTemplate sqlSession, int approvalNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectChange", approvalNo);
	}

	public int updateProcess(SqlSessionTemplate sqlSession, AppProcess ap) {
		return sqlSession.update("approvalMapper.updateProcess", ap);
	}

	public int updateCurrentOrder(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.update("approvalMapper.updateCurrentOrder", a);
	}

	public int insertChange(SqlSessionTemplate sqlSession, AppChange ac) {
		return sqlSession.insert("approvalMapper.insertChange", ac);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList");
	}

	public int insertApproval(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.insert("approvalMapper.insertApproval", a);
	}

	public int insertProcess(SqlSessionTemplate sqlSession, ArrayList<AppProcess> apList) {
		int result = 0;
		for(int i=0; i<apList.size(); i++) {
			result = sqlSession.insert("approvalMapper.insertProcess", apList.get(i));
		}
		return result;
	}

	public void insertAppAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> atList) {
		for(int i=0; i<atList.size(); i++) {
			sqlSession.insert("approvalMapper.insertAppAttachment", atList.get(i));
		}
	}

	public int insertDraft(SqlSessionTemplate sqlSession, FormDraft fdr) {
		return sqlSession.insert("approvalMapper.insertDraft", fdr);
	}

	public int insertTransfer(SqlSessionTemplate sqlSession, ArrayList<FormTransfer> ftrList) {
		int result = 0;
		for(int i=0; i<ftrList.size(); i++) {
			result = sqlSession.insert("approvalMapper.insertTransfer", ftrList.get(i));
		}
		return result;
	}

	public int insertConsume(SqlSessionTemplate sqlSession, ArrayList<FormConsume> fcoList) {
		int result = 0;
		for(int i=0; i<fcoList.size(); i++) {
			result = sqlSession.insert("approvalMapper.insertConsume", fcoList.get(i));
		}
		return result;
	}

	public int insertCash(SqlSessionTemplate sqlSession, ArrayList<FormCash> fcaList) {
		int result = 0;
		for(int i=0; i<fcaList.size(); i++) {
			result = sqlSession.insert("approvalMapper.insertCash", fcaList.get(i));
		}
		return result;
	}
}
