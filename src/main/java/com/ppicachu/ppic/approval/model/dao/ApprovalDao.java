package com.ppicachu.ppic.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.PageInfo;

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
}
