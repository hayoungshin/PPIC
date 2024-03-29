package com.ppicachu.ppic.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ppicachu.ppic.common.template.FileUpload;
import com.ppicachu.ppic.member.model.service.MemberService;
import com.ppicachu.ppic.member.model.vo.Department;
import com.ppicachu.ppic.member.model.vo.Member;
import com.ppicachu.ppic.project.model.service.ProjectService;
import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.ProjectParticipant;
import com.ppicachu.ppic.project.model.vo.Task;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@Autowired
	private MemberService mService;
	
	// 로그인유저의 프로젝트 리스트 조회
	@RequestMapping("list.pr")
	public ModelAndView selectProjectList(@RequestParam(value="no")int userNo, ModelAndView mv) {
		// 프로젝트 리스트
		ArrayList<Project> pList = pService.selectProjectList(userNo);
		// 부서 전체, 직원 전체
		ArrayList<Department> dList = mService.selectDeptList();
		ArrayList<Member> mList = mService.selectListMember();
		
		
		mv.addObject("pList", pList).addObject("dList", dList).addObject("mList", mList).setViewName("project/currentProject");
		return mv;
	}
	
	
	// 프로젝트 상세정보 조회
	@ResponseBody
	@RequestMapping(value="detail.pr", produces="application/json; charset=UTF-8")
	public String selectProjectParticipants(int projectNo) {
		//Project p = pService.selectProjectList(projectNo);
		// 프로젝트 참여자 리스트
		ArrayList<ProjectParticipant> ppList = pService.selectProjectParticipants(projectNo);
		// task 리스트
		ArrayList<Task> tList = pService.selectTaskList(projectNo);
		// task 참조자 리스트
		ArrayList<ArrayList<ProjectParticipant>> tpList = pService.selectTaskParticipants(tList);
		
		// task 참조자 수
//		int tpCount = 0;
//		for(int i=0; i<tList.size(); i++) {
//			tpCount = pService.selectCountTaskParticipants(tList.get(i).getTaskNo());
//			tList.get(i).setRefPeopleCnt(tpCount);
//		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("ppList", ppList);
		jObj.put("tList", tList);
		jObj.put("tpList", tpList);
		
		return new Gson().toJson(jObj);
		
	}
	
	
	// task drag&drop 상태변경
	@ResponseBody
	@RequestMapping("updateStatus.tk")
	public String updateTaskStatus(Task t) {
		switch(t.getTaskStatus()) {
		case "wait-list" : t.setTaskStatus("1"); break;
		case "working-list" : t.setTaskStatus("2"); break;
		case "done-list" : t.setTaskStatus("3"); break;
		case "hold-list" : t.setTaskStatus("4"); break;
		}
		
		int result = pService.updateTaskStatus(t);
		
		return (result > 0) ? "success" : "failed";
	}
	
	
	// 프로젝트 생성
	@RequestMapping("addProject.pr")
	public String addProject(Project p, String projectManagerDept, 
							 String[] selectUserNo, String[] selectUserDept,
							 HttpSession session, Model model) {
		// 프로젝트 추가
		int projectCurrval = pService.insertProject(p);
		// 참여자 추가
		ArrayList<ProjectParticipant> ppList = new ArrayList<>();
		for(int i=0; i<selectUserNo.length; i++) {
			ProjectParticipant pp = new ProjectParticipant();
			pp.setUserNo(selectUserNo[i]);
			pp.setDepartmentNo(selectUserDept[i]);
			pp.setPmStatus("N");
			pp.setProjectNo(projectCurrval);
			ppList.add(pp);
		}
		
		// pm 추가
		ProjectParticipant pm = new ProjectParticipant();
		pm.setUserNo(p.getProjectManager());
		pm.setDepartmentNo(projectManagerDept);
		pm.setPmStatus("Y");
		pm.setProjectNo(projectCurrval);
		ppList.add(pm);
		
		
		int result = pService.insertProjectParticipants(ppList);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "프로젝트가 생성되었습니다.");
			return "redirect:list.pr?no=" + ((Member)session.getAttribute("loginUser")).getUserNo();
		}else {
			model.addAttribute("errorMsg", "프로젝트 생성 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 프로젝트 수정
	@RequestMapping("updateProject.pr")
	public String updateProject(Project p, @RequestParam(name="projectManagerDept")int projectManagerDept,
								@RequestParam(name="selectUserNo")String[] selectUserNo,
								@RequestParam(name="selectUserDept")String[] selectUserDept,
								HttpSession session, Model model) {
		// 프로젝트 업데이트
		int result = pService.updateProject(p);
		System.out.println("프젝정보: " + p);
		System.out.println("선택유저" +Arrays.toString(selectUserNo));
		System.out.println("선택부서:"+Arrays.toString(selectUserDept));
		System.out.println(projectManagerDept);
		
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
			// 현재 task 참조자 조회(작업 담당자 제외)
			ArrayList<ProjectParticipant> currentTaskRefUser = pService.selectTaskRefUser(p.getProjectNo());
			ArrayList<ProjectParticipant> updateTaskRefUser = new ArrayList<>();
			// 업데이트된 유저중 기존에 참조하고 있던 작업이 있는지 확인
			for(int i=0; i<selectUserNo.length; i++) {
				for(int j=0; j<currentTaskRefUser.size(); j++) {
					if(currentTaskRefUser.get(j).getUserNo().equals(selectUserNo[i])) {
						ProjectParticipant tp = new ProjectParticipant();
						tp.setUserNo(selectUserNo[i]);
						tp.setDepartmentNo(selectUserDept[j]);
						tp.setProjectNo(p.getProjectNo());
						updateTaskRefUser.add(tp);
					}
				}
			}
			// 기존 참여자 정보 삭제(작업 담당자 제외)
			result2 = pService.deleteProjectParticipants(p.getProjectNo());
			// task 참조자 추가
			result3 = pService.insertTaskParticipants(updateTaskRefUser);
		
			// 프로젝트 참여자 전체 추가
			ArrayList<ProjectParticipant> ppList = new ArrayList<>();
			for(int i=0; i<selectUserNo.length; i++) {
				ProjectParticipant pp = new ProjectParticipant();
				pp.setProjectNo(p.getProjectNo());
				pp.setUserNo(selectUserNo[i]);
				pp.setDepartmentNo(selectUserDept[i]);
				pp.setPmStatus("N");
				ppList.add(pp);
			}
			
			// pm 추가
			ProjectParticipant pm = new ProjectParticipant();
			pm.setProjectNo(p.getProjectNo());
			pm.setUserNo(p.getProjectManager());
			pm.setDepartmentNo(String.valueOf(projectManagerDept));
			pm.setPmStatus("Y");
			ppList.add(pm);
			System.out.println(ppList);
			result4 = pService.insertProjectParticipants(ppList);
		
		if(result*result4 > 0) {
			session.setAttribute("alertMsg", "프로젝트가 수정되었습니다.");
			return "redirect:list.pr?no=" + ((Member)session.getAttribute("loginUser")).getUserNo();
		}else {
			model.addAttribute("errorMsg", "프로젝트 수정 실패");
			return "common/errorPage";
		}
		
	}
		
	/*
	// task참조자 리스트
	@ResponseBody
	@RequestMapping(value="tpList.tk", produces="application/json; charset=UTF-8")
	public String selectTaskParticipants(int taskNo) {
		// task 참조자 리스트
		ArrayList<ProjectParticipant> tpList = pService.selectTaskParticipants(taskNo);
		
		JSONObject jObj = new JSONObject();
		jObj.put("tpList", tpList);
		
		return new Gson().toJson(jObj);
	}
	
	
	// 프로젝트에 참여중인 부서/멤버 조회
	@ResponseBody
	@RequestMapping(value="selectList.tk", produces="application/json; charset=UTF-8")
	public String selectEmployeesList(int projectNo, int userNo) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("userNo", userNo);
		
		ArrayList<ProjectParticipant> dList = pService.selectDeptList(map);
		ArrayList<ProjectParticipant> eList = pService.selectEmployeesList(map);
		JSONObject jObj = new JSONObject();
		jObj.put("dList", dList);
		jObj.put("eList", eList);
		
		return new Gson().toJson(jObj);
	}*/
	
	
	// task 추가
	@RequestMapping("addTask.tk")
	public String insertTask(Task t, String assignUserDept, 
							 String[] selectUserNo, String[] selectUserDept,
							 MultipartFile upfile, HttpSession session, Model model) {
		
		// 첨부파일 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/taskFiles/");
			t.setFilePath(saveFilePath);
			t.setOriginName(upfile.getOriginalFilename());
		}
		// task insert
		int tkCurrval = pService.insertTask(t);
		
		// 참조자 추가
		ArrayList<ProjectParticipant> taskRefUser =  new ArrayList<>();
		for(int i=0; i<selectUserNo.length; i++) {
				ProjectParticipant pp = new ProjectParticipant();
				pp.setUserNo(selectUserNo[i]);
				pp.setDepartmentNo(selectUserDept[i]);
				pp.setProjectNo(t.getProjectNo());
				pp.setTaskAssign("N");
				pp.setTaskNo(tkCurrval);
				taskRefUser.add(pp);
			}
		// task 담당자 추가
		ProjectParticipant assign = new ProjectParticipant();
		assign.setProjectNo(t.getProjectNo());
		assign.setUserNo(t.getAssignUser());
		assign.setDepartmentNo(assignUserDept);
		assign.setTaskAssign("Y");
		assign.setTaskNo(tkCurrval);
		taskRefUser.add(assign);
		
		int result = pService.insertTaskParticipants(taskRefUser);
		if(result > 0) {
			session.setAttribute("alertMsg", "업무가 추가되었습니다.");
			return "redirect:list.pr?no=" + ((Member)session.getAttribute("loginUser")).getUserNo();
		}else {
			model.addAttribute("errorMsg", "업무 추가 실패");
			return "common/errorPage";
		}
	}
	
	
	
	@RequestMapping("updateTask.tk")
	public String updateTask(Task t, MultipartFile reupfile,
						   String[] selectUser, String[] selectUserDept,
						   HttpSession session, Model model) {
	
		// 새파일이 없을 때 
		if(reupfile.getOriginalFilename().equals("")) {
			// 기존 파일이 있었다면
			if(t.getFilePath() != null) {
				// 유저가 삭제했을 때
				if(t.getOriginName() == null) {
					// 기존 파일 지우기
					new File(session.getServletContext().getRealPath(t.getFilePath())).delete();
					t.setFilePath("");
				}
			}
		// 새파일이 있을 때
		}else if(!reupfile.getOriginalFilename().equals("")){
			// 새 파일 저장
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/taskFiles/");
			// 기존 파일이 없었다면
			if(t.getFilePath() != null) {
				new File(session.getServletContext().getRealPath(t.getFilePath())).delete();
			}
			t.setOriginName(reupfile.getOriginalFilename());
			t.setFilePath(saveFilePath);
		}
		
		int result = pService.updateTask(t);
		Task t2 = pService.selectTaskDetail(t.getTaskNo());
		
		// 참조자 정보 업데이트
		// 기존 참조자 전체 지우기
		int result2 = pService.deleteTaskParticipant(t.getTaskNo());
		
		// 새 참조자리스트 추가
		ArrayList<ProjectParticipant> updateList = new ArrayList<>();
		for(int i=0; i<selectUser.length; i++) {
			ProjectParticipant p = new ProjectParticipant();
			p.setProjectNo(t.getProjectNo());
			p.setTaskNo(t.getTaskNo());
			p.setUserNo(selectUser[i]);
			p.setDepartmentNo(selectUserDept[i]);
			updateList.add(p);
		}
		// assign 유저 추가
		ProjectParticipant p = new ProjectParticipant();
		p.setProjectNo(t2.getProjectNo());
		p.setTaskNo(t2.getTaskNo());
		p.setUserNo(t2.getAssignUser());
		p.setDepartmentNo(t2.getDepartmentNo());
		p.setTaskAssign("Y");
		updateList.add(p);
		
		int	result3 = pService.insertTaskParticipants(updateList);
		
		
		if(result*result3 > 0) {
			session.setAttribute("alertMsg", "업무가 수정되었습니다.");
			return "redirect:list.pr?no=" + ((Member)session.getAttribute("loginUser")).getUserNo();
		}else {
			model.addAttribute("errorMsg", "업무 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteTask.tk")
	public String deleteTask(int taskNo, Model model, HttpSession session) {
		// 업무 삭제
		int result = pService.deleteTask(taskNo);
		int result2 = 0;
		if(result > 0) {
			// 참조자 삭제
			result2 = pService.deleteTaskParticipant(taskNo);
		}
		if(result*result2 > 0) {
			session.setAttribute("alertMsg", "업무가 삭제되었습니다.");
			return "redirect:list.pr?no=" + ((Member)session.getAttribute("loginUser")).getUserNo();
		}else {
			model.addAttribute("errorMsg", "업무 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteProject.pr")
	public String deleteProject(int projectNo, HttpSession session, Model model) {
		int result = pService.deleteProject(projectNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "프로젝트가 삭제되었습니다.");
			return "redirect:list.pr?no=" + ((Member)session.getAttribute("loginUser")).getUserNo();
		}else {
			model.addAttribute("errorMsg", "프로젝트 삭제 실패");
			return "common/errorPage";
		}
	}
	
}
