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

}
