package com.ppicachu.ppic.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.ppicachu.ppic.board.model.vo.Board;
import com.ppicachu.ppic.board.model.vo.Report;
import com.ppicachu.ppic.common.model.vo.PageInfo;

public interface BoardService {

	// 1. 게시판 리스트 조회 서비스 (페이징)
	int selectListCount(String userNo);
	ArrayList<Board> selectList(String userNo, PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertBoard(Board b);
	
	// 3. 게시글 상세조회
	int increaseCount(int boardNo);
	Board selectBoard(HashMap<String, Integer> map);
	
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int boardNo);
	
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b);
	
	// 6. 게시글 검색용 서비스 (페이징)
	int selectSearchCount(HashMap<String, String> map);
	ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	// 7. 게시글 신고용 서비스
	int insertReport(Report r);
	
	// 8. 익명게시판 관리 리스트 조회 서비스 (페이징)
	int selectReportCount();
	ArrayList<Report> selectReportList(PageInfo pi);
	
	// 9. 블라인드 처리 서비스
	int blindReportUpdate(Report r);
	int blindBoardUpdate(Report r);
	
	// 10. 신고 삭제 서비스
	int deleteReport(String[] reportNo);
	
	// 11. 좋아요 삭제
	int deleteLike(Board b);
	
	// 12. 좋아요 추가
	int insertLike(Board b);
}
