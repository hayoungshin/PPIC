package com.ppicachu.ppic.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.approval.model.vo.AppChange;
import com.ppicachu.ppic.approval.model.vo.AppDetail;
import com.ppicachu.ppic.approval.model.vo.AppProcess;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.MyDept;
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

	/*public int removeApproval(SqlSessionTemplate sqlSession, String[] noArr) {
		return 0;
	}*/

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

	public int insertChange(SqlSessionTemplate sqlSession, AppChange ac) {
		return sqlSession.insert("approvalMapper.insertChange", ac);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList");
	}

	public int updateProcess(SqlSessionTemplate sqlSession, AppProcess ap) {
		return sqlSession.update("approvalMapper.updateProcess", ap);
	}

	public int updateCurrentOrder(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.update("approvalMapper.updateCurrentOrder", a);
	}
}
