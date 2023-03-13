package com.ppicachu.ppic.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.board.model.vo.Board;
import com.ppicachu.ppic.common.model.vo.Attachment;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.notice.model.dao.NoticeDao;
import com.ppicachu.ppic.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao nDao;
	
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDao.selectList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int noticeNo) {
		return nDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return nDao.selectNotice(sqlSession, noticeNo);
	}
	
	@Override
	public int insertNotice(Notice n, ArrayList<Attachment> list) {
		int result1 = nDao.insertNotice(sqlSession, n);
		int result2 = 1;
		if(!list.isEmpty()) {
			result2 = nDao.insertAttachment(sqlSession, list);
		}
		return result1 * result2;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return 0;
	}

	@Override
	public int updateNotice(Notice n, ArrayList<Attachment> list) {
		int result1 = nDao.updateNotice(sqlSession, n);
		int result2 = 1;
		if(!list.isEmpty()) {
			result2 = nDao.updateAttachment(sqlSession, list);
		}
		return result1 * result2;
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return nDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Notice> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return nDao.selectSearchList(sqlSession, map, pi);
	}

	
	
}
