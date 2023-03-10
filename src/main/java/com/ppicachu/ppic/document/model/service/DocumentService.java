package com.ppicachu.ppic.document.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.document.model.vo.Document;

public interface DocumentService {

	// 회사문서 리스트 조회
	int selectCommonDocsCount();
	ArrayList<Document> selectCommonDocs(PageInfo pi);
	
	// 회사문서 추가
	int insertCommonDocs(Document doc);
	
	// 회사문서 수정
	int updateCommonDocs(Document doc);
}
