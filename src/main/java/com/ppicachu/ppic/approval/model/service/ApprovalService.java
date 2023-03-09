package com.ppicachu.ppic.approval.model.service;

import java.util.ArrayList;

import com.ppicachu.ppic.approval.model.vo.AppChange;
import com.ppicachu.ppic.approval.model.vo.AppProcess;
import com.ppicachu.ppic.approval.model.vo.Approval;
import com.ppicachu.ppic.approval.model.vo.FormDraft;
import com.ppicachu.ppic.approval.model.vo.FormTransfer;
import com.ppicachu.ppic.approval.model.vo.MyDept;
import com.ppicachu.ppic.common.model.vo.PageInfo;
import com.ppicachu.ppic.member.model.vo.Member;

public interface ApprovalService {
	
	// 1. 전자결재 리스트 페이지 조회 서비스 (페이징)
	int selectListCount(MyDept md);
	ArrayList<Approval> selectList(MyDept md, PageInfo pi);
	/*
	// 1. 개인_기안_진행중 select (/승인필요) (+count)
	int selectMyIngListCount(String userNo);
	ArrayList<Approval> selectMyIngList(String userNo, PageInfo pi);
	
	// 2. 개인_기안_완료 select (+count)
	int selectMyEdListCount(String userNo);
	ArrayList<Approval> selectMyEdList(String userNo, PageInfo pi);
	
	// 3. 개인_기안_임시저장 select (+count)
	int selectMyTemListCount(String userNo);
	ArrayList<Approval> selectMyTemList(String userNo, PageInfo pi);
	
	// 4. 개인_참조 select (+count)
	int selectMyRefListCount(String userNo);
	ArrayList<Approval> selectMyRefList(String userNo, PageInfo pi);
	
	// 5. 개인_중요 select (+count)
	int selectMyBookListCount(String userNo);
	ArrayList<Approval> selectMyBookList(String userNo, PageInfo pi);
	
	// 6. 중요 update
	int updateBook(Approval a);
	
	// 7.부서_진행중 select (+count)
	int selectDeptIngCount(String deptNo);
	ArrayList<Approval> selectDeptIngList(String deptNo, PageInfo pi);
	
	// 8.부서_완료 select (+count)
	int selectDeptEdCount(String deptNo);
	ArrayList<Approval> selectDeptEdList(String deptNo, PageInfo pi);
	
	// 20.전체관리_전체문서 select (+count)
	int selectAllListCount(String userNo);
	ArrayList<Approval> selectAllList(PageInfo pi);
	
	// 22.삭제관리_삭제문서 select (+count)
	int selectDelListCount(String userNo);
	ArrayList<Approval> selectDelList(PageInfo pi);
	*/
	
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
	
	// 21.삭제 update
	int updateApproval(int approvalNo); // 고민해보기 삭제인데 update..?
	
	// 23.삭제관리_복원 update
	
	
	// 24.삭제관리_영구삭제 delete

}
