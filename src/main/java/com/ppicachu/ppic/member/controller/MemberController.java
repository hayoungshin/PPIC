package com.ppicachu.ppic.member.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ppicachu.ppic.common.template.FileUpload;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.member.model.vo.Position;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/* coolSMS */
	final DefaultMessageService messageService;
    public MemberController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCS2WBT3OJTYP0YK", "LOFXEP8MBXUNG5SPTIXEWK8Q5RREU52D", "https://api.coolsms.co.kr");
    }
	
	/* 단순 페이지 불러오기*/
	
	/* 마이페이지 */
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	/* 구성원_메인 */
	@RequestMapping("memberMain.me")
	public String memberMain(Model model) {
		ArrayList<Member> list1 = mService.selectListMember();
		ArrayList<Department> list2 = mService.selectDeptList();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
		return "member/memberMainView";
	}
	
	/* 구성원_detail */
	@RequestMapping("memberDetail.me")
	public String memberDetail(int no, Model model) {
		
		Member m = mService.selectMember(no);
		model.addAttribute("m", m);
		
		return "member/memberDetailView";
	}
	
	/* 구성원_관리자 */
	@RequestMapping("memberList.me")
	public String memberList(Model model) {
		ArrayList<Member> list1 = mService.selectListMember();
		ArrayList<Department> list2 = mService.selectDeptList();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		return "member/memberListView";
	}
	
	/* 구성원_권한설정 */
	@RequestMapping("memberAuth.me")
	public String memberAuth() {
		return "member/memberAuthView";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			return "common/Home";
		} else {
			session.setAttribute("alertMsg", "로그인에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	/* 회원정보 update(세션 out 됨) */
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session) {
		int result = mService.updateMember(m);
		
		if(result >0) {
			Member updateMem = mService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 변경하였습니다");
			
			return "redirect:myPage.me";
		} else {
			
			return "common/errorPage";
		}
	}
	
	/* 회원프로필 update(세션 out 됨) */
	@ResponseBody 
	@RequestMapping("uploadProfile.me")
	public void uploadProfileImg(MultipartFile uploadFile, Member m, String originalFile, HttpSession session) {
		
		
		if(uploadFile != null) {
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/profile_images/");
			m.setProfileImg(saveFilePath);
			
			int result = mService.updateProfileImg(m);
			
			if(result > 0) {
				if(!originalFile.equals("")) {
					new File(session.getServletContext().getRealPath(originalFile)).delete();
				}
				
				Member loginUser = mService.loginMember(m);
				session.setAttribute("loginUser",loginUser);
				
			}
		}
	}
	
	/* 회원가입 */
	/**
	 * @return ID 생성 페이지
	 */
	@RequestMapping("idCheckForm.me")
	public String idCheckForm() {
		return "member/memberIdCheckForm";
	}
	
	/**
	 * @param checkId 중복확인 할 아이디
	 * @param model : 부서리스트, 직급리스트, 중복확인 완료된 아이디
	 * @return 상세정보 작성 페이지
	 */
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId, HttpSession session, Model model) {
		int count = mService.idCheck(checkId);
		if(count>0) {
			session.setAttribute("alertMsg", "이미 사용중인 아이디거나 탈퇴한 회원의 아이디입니다.");
			return "redirect:idCheckForm.me";
		} else {
			ArrayList<Department> dList = mService.selectDeptList();
			ArrayList<Position> pList = mService.selectPositionList();
			model.addAttribute("dList", dList);
			model.addAttribute("pList", pList);
			model.addAttribute("checkId", checkId);
			return "member/memberEnrollForm";
		}
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		int result = mService.insertMember(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	
	/* 아이디/비밀번호 찾기 */
	/**
	 * @return 아이디 찾기 페이지
	 */
	@RequestMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findIdForm";
	}
	@RequestMapping("findId.me")
	public String findId(Member m, Model model, HttpSession session) {
		String userId = mService.findId(m);
		if(userId != null) {
			model.addAttribute("userId", userId);
			return "member/findIdResultView";			
		} else {
			session.setAttribute("alertMsg", "일치하는 회원정보가 없습니다.");
			return "redirect:findIdForm.me";
		}
	}
	/**
	 * @return 비밀번호 변경 페이지 (아이디 확인)
	 */
	@RequestMapping("resetPwdIdCheckForm.me")
	public String resetPwdIdCheckForm() {
		return "member/resetPwdIdCheckForm";
	}
	@RequestMapping("resetPwdIdCheck.me")
	public String resetPwdIdCheck(String userId, HttpSession session, Model model) {
		Member checkMem = new Member();
		checkMem.setUserId(userId);
		Member m = mService.loginMember(checkMem);
		if(m != null) {
			model.addAttribute("m", m);
			return "member/resetPwdCertificationForm";
		} else {
			session.setAttribute("alertMsg", "일치하는 회원정보가 없습니다.");
			return "redirect:resetPwdIdCheckForm.me";
		}
	}
	// coolSMS 인증번호
	@ResponseBody
	@PostMapping("sendMsg.me")
    public int ajaxSendMessage(String phone, Model model) {
		int ranNum = (int)(Math.random() * 900000 + 100000);
		/*
        Message message = new Message();

        message.setFrom("01043775019");
        message.setTo(phone);
        message.setText("[PPIC] 본인확인 인증번호 [" + ranNum + "]입니다.");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
		*/
		return ranNum;
    }
	@RequestMapping("resetPwdForm.me")
	public String resetPwdForm(int userNo, Model model) {
		model.addAttribute("userNo", userNo);
		return "member/resetPwdForm";
	}
	@RequestMapping("resetPwd.me")
	public String resetPwd(Member m, HttpSession session, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		int result = mService.resetPwd(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "비밀번호 변경 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("select.me")
	public ArrayList<Member> ajaxselectMemForMail(){
		return mService.selectMemForMail();
	}
	
	// 권한 있는 멤버 리스트 조회
	@ResponseBody 
	@RequestMapping("authorityMemList.me")
	public ArrayList<Member> ajaxSelectAuthorityMemList(int authoNo){
		return mService.selectAuthorityMemList(authoNo);
	}
	
	
	
	
}
