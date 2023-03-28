package com.ppicachu.ppic.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.ppicachu.ppic.common.model.vo.Attachment;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.notice.model.vo.Notice;

public interface NoticeService {
	
	// 1. 공지사항 리스트 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	// 2. 공지사항 작성하기 서비스
	int insertNotice(Notice n, ArrayList<Attachment> list);
	
	// 3. 공지사항 상세조회
	int increaseCount(int noticeNo);
	Notice selectNotice(int noticeNo);
	
	// 4. 공지사항 삭제용 서비스
	int deleteNotice(int noticeNo);
	
	// 5. 공지사항 수정용 서비스
	int deleteAttachment(int refNo);
	int updateNotice(Notice n, ArrayList<Attachment> list);
	
	// 6. 공지사항 검색용 서비스
	int selectSearchCount(HashMap<String, String> map);
	ArrayList<Notice> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	// 7. 메인 화면용 조회
	ArrayList<Notice> selectNoticeMain();
}
