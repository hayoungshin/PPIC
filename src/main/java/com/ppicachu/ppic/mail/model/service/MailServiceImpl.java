package com.ppicachu.ppic.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.mail.model.dao.MailDao;
import com.ppicachu.ppic.mail.model.vo.Mail;
import com.ppicachu.ppic.mail.model.vo.MailAttachment;


@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mDao;

	@Override
	public int sendMail(Mail m, ArrayList<MailAttachment> list) {
		int result1 = mDao.sendMail(sqlSession, m);
		int result2 = mDao.sendAttachment(sqlSession, list);
		int result3 = mDao.insertStatus(sqlSession, m);
		return result1 * result2 * result3;
	}
	
}
