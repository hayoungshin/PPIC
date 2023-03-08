package com.ppicachu.ppic.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.ppicachu.ppic.board.model.vo.Board;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.notice.model.vo.Notice;

public interface NoticeService {
	
	// 1. 공지사항 리스트 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	// 2. 공지사항 작성하기 서비스
	int insertNotice(Notice b);
	
	// 3. 공지사항 상세조회
	int increaseCount(int noticeNo);
	Notice selectNotice(int noticeNo);
	
	// 4. 공지사항 삭제용 서비스
	int deleteNotice(int noticeNo);
	
	// 5. 공지사항 수정용 서비스
	int updateNotice(Notice n);
	
	// 6. 공지사항 검색용 서비스
	int selectSearchCount(HashMap<String, String> map);
	ArrayList<Notice> selectSearchList(HashMap<String, String> map, PageInfo pi);

}
