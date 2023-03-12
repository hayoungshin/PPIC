package com.ppicachu.ppic.document.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.document.model.vo.Document;

@Repository
public class DocumentDao {

	// ------ 회사 문서
	public int selectCommonDocsCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("documentMapper.selectCommonDocsCount");
	}
	
	public ArrayList<Document> selectCommonDocs(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
				
		RowBounds rbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("documentMapper.selectCommonDocs", null, rbounds);
	}

	public int insertCommonDocs(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.insert("documentMapper.insertCommonDocs", doc);
	}
	
	public int updateCommonDocs(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.update("documentMapper.updateCommonDocs", doc);
	}
	
	public int deleteCommonDocs(SqlSessionTemplate sqlSession, int docNo) {
		return sqlSession.update("documentMapper.deleteCommonDocs", docNo);
	}
	
	// ------ 내 문서
	public int selectMyDocsCount(SqlSessionTemplate sqlSession, String createUser) {
		return sqlSession.selectOne("documentMapper.selectMyDocsCount", createUser);
	}
	
	public ArrayList<Document> selectMyDocs(SqlSessionTemplate sqlSession, String createUser, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
				
		RowBounds rbounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("documentMapper.selectMyDocs", createUser, rbounds);
	}
	
	public int insertMyDocs(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.insert("documentMapper.insertMyDocs", doc);
	}
	
	public int updateMyDocs(SqlSessionTemplate sqlSession, Document doc) {
		return sqlSession.update("documentMapper.updateMyDocs", doc);
	}
	
	public int deleteMyDocs(SqlSessionTemplate sqlSession, int docNo) {
		return sqlSession.update("documentMapper.deleteMyDocs", docNo);
	}
	
}
