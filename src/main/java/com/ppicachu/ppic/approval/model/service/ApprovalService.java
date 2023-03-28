package com.ppicachu.ppic.approval.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.approval.model.vo.AppChange;
import com.ppicachu.ppic.approval.model.vo.AppDetail;
import com.ppicachu.ppic.approval.model.vo.AppProcess;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.FormCash;
import com.ppicachu.ppic.approval.model.vo.FormConsume;
import com.ppicachu.ppic.approval.model.vo.FormDraft;
import com.ppicachu.ppic.approval.model.vo.FormTransfer;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.Attachment;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.member.model.vo.Member;

public interface ApprovalService {

	/* insert */
	
	// <작성,수정,상세> 변경사항 insert
	int insertChange(AppChange ac);
	
	// <작성,수정> Approval insert
	int insertApproval(Approval a, ArrayList<AppProcess> apList, AppChange ac, ArrayList<Attachment> atList);
	
	// <작성,수정> FormDraft insert
	int insertDraft(FormDraft fdr);
	
	// <작성,수정> FormTransfer insert
	int insertTransfer(ArrayList<FormTransfer> ftrList);
	
	// <작성,수정> FormConsume insert
	int insertConsume(ArrayList<FormConsume> fcoList);
	
	// <작성,수정> FormCash insert
	int insertCash(ArrayList<FormCash> fcaList);
	
	
	
	/* select */
	
	// <조회> 개인-기안-진행중 / 개인-참조 / 개인-중요 / 부서-진행중 목록 페이지 조회 서비스 (페이징)
	int selectListCount(MyDept md); // + 개인-기안-완료 / 부서-완료
	ArrayList<Approval> selectList(MyDept md, PageInfo pi);
	
	// <조회> 개인-기안-임시저장 목록 페이지 조회 서비스 (페이징)
	int selectTemListCount(MyDept md);
	ArrayList<Approval> selectTemList(MyDept md, PageInfo pi);
	
	// <조회> 전체관리 / 삭제관리 목록 페이지 조회 서비스 (페이징)
	int selectMaListCount(MyDept md);
	ArrayList<Approval> selectMaList(MyDept md, PageInfo pi);
	
	// <검색> 검색 목록 페이지 조회 서비스 (페이징)
	int selectSearchListCount(Approval a);
	ArrayList<Approval> selectSearchList(Approval a, PageInfo pi);
	
	// <수정,상세> 업무기안 select
	AppDetail selectDraftApp(int approvalNo);
	
	// <수정,상세> 인사발령품의서 select
	AppDetail selectTransferApp(int approvalNo);
	
	// <수정,상세> 비품신청서 select
	AppDetail selectConsumeApp(int approvalNo);
	
	// <수정,상세> 지출결의서 select
	AppDetail selectCashApp(int approvalNo);
	
	// <상세> 변경사항 select
	ArrayList<AppChange> selectChange(int approvalNo);
	
	// <작성,수정> 회원 리스트 select
	ArrayList<Member> selectMemberList();
	
	
	
	/* update */
	
	// <조회> 중요 update
	int updateBook(Approval a);
	
	// <조회> 삭제 update
	int deleteApproval(String[] noArr);
	
	// <조회> 복원 update
	int recoverApproval(String[] noArr);
	
	// <상세> 결재선 update
	int updateProcess(AppProcess ap);
	int updateCurrentOrder(Approval a);
	
	// <상세> 결재상태 update
	int updateApprovalStatus(Approval a);
	
	
	
	/* delete */
	
	// <조회,수정> 영구삭제 delete (임시저장, 삭제관리)
	int removeApproval(ArrayList<Approval> aList);
	
	
	
	
	
	
	/*
	// <상세> 변경사항 update
	int updateAppChange(int changeNo);
	*/
}
