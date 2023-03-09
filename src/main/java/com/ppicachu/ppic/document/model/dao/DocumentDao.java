package com.ppicachu.ppic.document.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.document.model.vo.Document;

@Repository
public class DocumentDao {

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
}
