package com.ppicachu.ppic.approval.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.approval.model.vo.AppDetail;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.PageInfo;

public interface ApprovalService {
	
	// 1. 개인-기안-진행중 / 개인-참조 / 개인-중요 / 부서-진행중 목록 페이지 조회 서비스 (페이징)
	int selectListCount(MyDept md); // + 개인-기안-완료 / 부서-완료
	ArrayList<Approval> selectList(MyDept md, PageInfo pi);
	
	// 2. 개인-기안-완료 / 부서-완료 목록 페이지 조회 서비스 (페이징)
	ArrayList<Approval> selectEdList(MyDept md, PageInfo pi);
	
	// 3. 개인-기안-임시저장 목록 페이지 조회 서비스 (페이징)
	int selectTemListCount(MyDept md);
	ArrayList<Approval> selectTemList(MyDept md, PageInfo pi);
	
	// 4. 전체관리 / 삭제관리 목록 페이지 조회 서비스 (페이징)
	int selectMaListCount(MyDept md);
	ArrayList<Approval> selectMaList(MyDept md, PageInfo pi);
	
	// 5. 중요 update
	int updateBook(Approval a);
	
	// 6. 삭제 update
	int deleteApproval(String[] noArr);
	
	// 7. 영구삭제 delete (임시저장, 삭제관리)
	/*int removeApproval(String[] noArr);*/
	
	// 8. 복원 update
	int recoverApproval(String[] noArr);
	
	// 9. 업무기안 select
	AppDetail selectDraftApp(int approvalNo);
	
	// 10. 인사발령품의서 select
	AppDetail selectTransferApp(int approvalNo);
	
	// 11. 비품신청서 select
	AppDetail selectConsumeApp(int approvalNo);
	
	// 12. 지출결의서 select
	AppDetail selectCashApp(int approvalNo);
	
	
	/*
	// 9.작성_회원 리스트 select (+회원명, 부서명, 직급명)
	// 15.수정_회원 리스트 select (+회원명, 부서명, 직급명)
	ArrayList<Member> selectMemberList();
	
	// 10.작성_전자결재 insert (전자결재, 양식, 결재선, 첨부파일, 변경사항)
	// 18.수정_전자결재 insert (전자결재, 양식, 결재선, 첨부파일, 변경사항)
	int insertApproval(Approval a);
	int insertFormDraft(FormDraft fdr);
	int insertFormTransfer(ArrayList<FormTransfer> ftrList);
	int insertFormConsume(ArrayList<FormDraft> fcoList);
	int insertFormCash(ArrayList<FormDraft> fcaList);
	int insertAppProcess(ArrayList<AppProcess> apList);
	int insertAppChange(ArrayList<AppChange> acList);
	
	// 11.상세_전자결재 select (전자결재, 양식, 결재선, 첨부파일, 변경사항)
	// 16.수정_전자결재 select (전자결재, 양식, 결재선, 첨부파일)
	Approval selectApproval(int approvalNo);
	
	// 12.상세_변경사항 insert
	int insertAppChange(AppChange ac);
	
	// 13.상세_변경사항삭제 update
	int updateAppChange(int changeNo);
	
	// 14.상세_변경사항영구삭제 delete - 이걸 안할수도??
	// 17.수정_전자결재 delete (전자/결재, 양/식, 결재/선, 첨부/파일, 변경사항)
	int deleteAppChange(int changeNo); // 단, 17.수정일 경우 int approvalNo 임 (sql문 where절 다름..)
	
	// 17.수정_전자결재 delete (전자결재, 양식, 결재선, 첨부파일, 변경/사항)
	int deleteApproval(int approvalNo);
	int deleteFormDraft(int approvalNo);
	int deleteFormTransfer(int approvalNo);
	int deleteFormConsume(int approvalNo);
	int deleteFormCash(int approvalNo);
	int deleteAppProcess(int approvalNo);
	
	// 19.검색_검색결과 select (+count) 제일 후순위 (시간 남으면 다중조건 검색)
	int selectSearchListCount(); // 매개변수 검색조건
	ArrayList<Approval> selectSearchList(PageInfo pi); // 매개변수 검색조건 추가
	*/
}
