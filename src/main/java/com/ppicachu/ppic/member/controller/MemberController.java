package com.ppicachu.ppic.member.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ppicachu.ppic.common.template.FileUpload;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.member.model.vo.Position;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/Home");
		} else {
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
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
	
	
	
	
	
	
}
