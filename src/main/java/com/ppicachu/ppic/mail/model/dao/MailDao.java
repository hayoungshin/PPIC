package com.ppicachu.ppic.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ppicachu.ppic.mail.model.vo.Mail;
import com.ppicachu.ppic.mail.model.vo.MailAttachment;

@Repository
public class MailDao {	
	
	public int sendMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.sendMail", m);
	}

	public int sendAttachment(SqlSessionTemplate sqlSession, ArrayList<MailAttachment> list) {
		int result = 0;
		for(MailAttachment at : list) {
			result = sqlSession.insert("mailMapper.sendAttachment", at);			
		}
		return result;
	}
	
	public int insertStatus(SqlSessionTemplate sqlSession, Mail m) {
		int result = 0;
		for(String s : m.getRecipientArr()) {
			m.setSenderMail(s);
			m.setMailType("1");
			result = sqlSession.insert("mailMapper.insertStatus", m);
		}
		for(String s : m.getRefArr()) {
			m.setRefMail(s);
			m.setMailType("2");
			result = sqlSession.insert("mailMapper.insertStatus", m);
		}
		for(String s : m.getHidRefArr()) {
			m.setHidRefMail(s);
			m.setMailType("3");
			result = sqlSession.insert("mailMapper.insertStatus", m);
		}
		return result;
	}
}
