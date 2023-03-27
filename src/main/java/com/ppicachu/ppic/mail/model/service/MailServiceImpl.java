package com.ppicachu.ppic.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.mail.model.dao.MailDao;
import com.ppicachu.ppic.mail.model.vo.Mail;
import com.ppicachu.ppic.mail.model.vo.MailAttachment;
import com.ppicachu.ppic.mail.model.vo.MailStatus;


@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mDao;

	@Override
	public int sendMail(Mail m, ArrayList<MailAttachment> list, MailStatus status) {
		int result1 = mDao.sendMail(sqlSession, m);
		int result2 = 1;
		if(list.size() != 0) {	// 첨부파일이 넘어왔으면
			result2 = mDao.sendAttachment(sqlSession, list);			
		}
		int result3 = mDao.insertSender(sqlSession, status);
		int result4 = mDao.insertStatus(sqlSession, status, m);
		
		return result1 * result2 * result3 * result4;
	}

	@Override
	public int selectRecieveListCount(String userMail) {
		return mDao.selectRecieveListCount(sqlSession, userMail);
	}

	@Override
	public ArrayList<MailStatus> selectRecieveList(PageInfo pi, String userMail) {
		return mDao.selectRecieveList(sqlSession, userMail, pi);
	}

	@Override
	public int selectReadStatus(MailStatus status) {
		return mDao.selectReadStatus(sqlSession, status);
	}
	
	@Override
	public int updateReadDate(MailStatus status) {
		return mDao.updateReadDate(sqlSession, status);
	}

	@Override
	public Mail selectRecieve(MailStatus status) {
		return mDao.selectRecieve(sqlSession, status);
	}

	@Override
	public ArrayList<MailAttachment> selectAttachmentList(int mailNo) {
		return mDao.selectAttachmentList(sqlSession, mailNo);
	}

	@Override
	public int selectSendListCount(String userMail) {
		return mDao.selectSendListCount(sqlSession, userMail);
	}

	@Override
	public ArrayList<MailStatus> selectSendList(PageInfo pi, String userMail) {
		return mDao.selectSendList(sqlSession, pi, userMail);
	}

	@Override
	public Mail selectSend(int mailNo) {
		return mDao.selectSend(sqlSession, mailNo);
	}

	@Override
	public int selectImportantListCount(String userMail) {
		return mDao.selectImportantListCount(sqlSession, userMail);
	}

	@Override
	public ArrayList<MailStatus> selectImportantList(PageInfo pi, String userMail) {
		return mDao.selectImportantList(sqlSession, pi, userMail);
	}

	
}
