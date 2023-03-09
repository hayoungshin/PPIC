package com.ppicachu.ppic.approval.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ppicachu.ppic.approval.model.vo.AppChange;
import com.ppicachu.ppic.approval.model.vo.AppProcess;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.FormDraft;
import com.ppicachu.ppic.approval.model.vo.FormTransfer;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.member.model.vo.Member;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Override
	public int selectListCount(MyDept md) {
		return 0;
	}

	@Override
	public ArrayList<Approval> selectList(MyDept md, PageInfo pi) {
		return null;
	}

	@Override
	public ArrayList<Member> selectMemberList() {
		return null;
	}

	@Override
	public int insertApproval(Approval a) {
		return 0;
	}

	@Override
	public int insertFormDraft(FormDraft fdr) {
		return 0;
	}

	@Override
	public int insertFormTransfer(ArrayList<FormTransfer> ftrList) {
		return 0;
	}

	@Override
	public int insertFormConsume(ArrayList<FormDraft> fcoList) {
		return 0;
	}

	@Override
	public int insertFormCash(ArrayList<FormDraft> fcaList) {
		return 0;
	}

	@Override
	public int insertAppProcess(ArrayList<AppProcess> apList) {
		return 0;
	}

	@Override
	public int insertAppChange(ArrayList<AppChange> acList) {
		return 0;
	}

	@Override
	public Approval selectApproval(int approvalNo) {
		return null;
	}

	@Override
	public int insertAppChange(AppChange ac) {
		return 0;
	}

	@Override
	public int updateAppChange(int changeNo) {
		return 0;
	}

	@Override
	public int deleteAppChange(int changeNo) {
		return 0;
	}

	@Override
	public int deleteApproval(int approvalNo) {
		return 0;
	}

	@Override
	public int deleteFormDraft(int approvalNo) {
		return 0;
	}

	@Override
	public int deleteFormTransfer(int approvalNo) {
		return 0;
	}

	@Override
	public int deleteFormConsume(int approvalNo) {
		return 0;
	}

	@Override
	public int deleteFormCash(int approvalNo) {
		return 0;
	}

	@Override
	public int deleteAppProcess(int approvalNo) {
		return 0;
	}

	@Override
	public int selectSearchListCount() {
		return 0;
	}

	@Override
	public ArrayList<Approval> selectSearchList(PageInfo pi) {
		return null;
	}

	@Override
	public int updateApproval(int approvalNo) {
		return 0;
	}

}
