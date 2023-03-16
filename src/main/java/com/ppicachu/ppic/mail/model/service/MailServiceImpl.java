package com.ppicachu.ppic.mail.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppicachu.ppic.mail.model.dao.MailDao;


@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mDao;
	
}
