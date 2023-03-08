package com.ppicachu.ppic.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.ppicachu.ppic.board.model.vo.Board;
import com.ppicachu.ppic.common.model.vo.PageInfo;

public interface BoardService {

	// 1. 게시판 리스트 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertBoard(Board b);
	
	// 3. 게시글 상세조회
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int boardNo);
	
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b);
	
	// 6. 게시글 검색용 서비스
	int selectSearchCount(HashMap<String, String> map);
	ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);
}
