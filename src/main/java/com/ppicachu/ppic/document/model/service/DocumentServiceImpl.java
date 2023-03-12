package com.ppicachu.ppic.document.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.document.model.dao.DocumentDao;
import com.ppicachu.ppic.document.model.vo.Document;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DocumentDao dDao;
	
	
	@Override
	public int selectCommonDocsCount() {
		return dDao.selectCommonDocsCount(sqlSession);
	}

	@Override
	public ArrayList<Document> selectCommonDocs(PageInfo pi) {
		return dDao.selectCommonDocs(sqlSession, pi);
	}

	@Override
	public int insertCommonDocs(Document doc) {
		return dDao.insertCommonDocs(sqlSession, doc);
	}

	@Override
	public int updateCommonDocs(Document doc) {
		return dDao.updateCommonDocs(sqlSession, doc);
	}

	@Override
	public int deleteCommonDocs(int docNo) {
		return dDao.deleteCommonDocs(sqlSession, docNo);
	}

	// ----- 내 문서
	@Override
	public int selectMyDocsCount(String createUser) {
		return dDao.selectMyDocsCount(sqlSession, createUser);
	}

	@Override
	public ArrayList<Document> selectMyDocs(String createUser, PageInfo pi) {
		return dDao.selectMyDocs(sqlSession, createUser, pi);
	}

	@Override
	public int insertMyDocs(Document doc) {
		return dDao.insertMyDocs(sqlSession, doc);
	}

	@Override
	public int updateMyDocs(Document doc) {
		return dDao.updateMyDocs(sqlSession, doc);
	}

	@Override
	public int deleteMyDocs(int docNo) {
		return dDao.deleteCommonDocs(sqlSession, docNo);
	}

}
