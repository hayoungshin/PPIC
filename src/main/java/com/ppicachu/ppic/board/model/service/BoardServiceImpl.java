package com.ppicachu.ppic.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.board.model.dao.BoardDao;
import com.ppicachu.ppic.board.model.vo.Board;
import com.ppicachu.ppic.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao bDao;
	
	@Override
	public int selectListCount(String userNo) {
		return bDao.selectListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Board> selectList(String userNo, PageInfo pi) {
		return bDao.selectList(sqlSession, userNo, pi);
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(sqlSession, b);
	}

	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return bDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return bDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(sqlSession, b);
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return bDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return bDao.selectSearchList(sqlSession, map, pi);
	}

}
