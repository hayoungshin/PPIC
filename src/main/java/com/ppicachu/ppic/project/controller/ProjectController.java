package com.ppicachu.ppic.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
	public String addProject(Project p, String projectManagerDept, HttpSession session, Model model) {
		// 프로젝트 추가
		int result = pService.insertProject(p);
		
		// 참여자 추가
		ArrayList<ProjectParticipant> ppList = p.getProjectParticipants();
		for(int i=0; i<ppList.size(); i++) {
			if(ppList.get(i).getUserNo() != null) {
				ppList.get(i).setPmStatus("N");
			}else if(ppList.get(i).getUserNo() == null) {
				ppList.remove(i);
			}
		}
		
		// pm 추가
		ProjectParticipant pm = new ProjectParticipant();
		pm.setUserNo(p.getProjectManager());
		pm.setDepartmentNo(projectManagerDept);
		pm.setPmStatus("Y");
		ppList.add(pm);
		
		int result2 = 0;
		if(result > 0) {
			result2 = pService.insertProjectParticipants(ppList);
		}
		
		if(result*result2 > 0) {
			session.setAttribute("alertMsg", "프로젝트가 생성되었습니다.");
			return "redirect:list.pr?no=" + ((Member)session.getAttribute("loginUser")).getUserNo();
		}else {
			model.addAttribute("errorMsg", "프로젝트 생성 실패");
			return "common/errorPage";
		}
		
		
	}
	
	@RequestMapping("updteProject.pr")
	public String updateProject(Project p, String projectManagerDept, HttpSession session, Model model) {
		
		// 프로젝트 업데이트
		int result = pService.updateProject(p);
		
		
		// 기존 참여자 정보 삭제
		int result2 = 0;
		int result3 = 0;
		if(result > 0) {
			result2 = pService.deleteProjectParticipants(p.getProjectNo());
		
			ArrayList<ProjectParticipant> ppList = p.getProjectParticipants();
			for(int i=0; i<ppList.size(); i++) {
				if(ppList.get(i).getUserNo() != null) {
					ppList.get(i).setProjectNo(p.getProjectNo());
					ppList.get(i).setPmStatus("N");
				}else if(ppList.get(i).getUserNo() == null) {
					ppList.remove(i);
				}
			}
			
			// pm 추가
			ProjectParticipant pm = new ProjectParticipant();
			pm.setProjectNo(p.getProjectNo());
			pm.setUserNo(p.getProjectManager());
			pm.setDepartmentNo(projectManagerDept);
			pm.setPmStatus("Y");
			ppList.add(pm);
			result3 = pService.insertProjectParticipants(ppList);
		}
		
		if(result*result3 > 0) {
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
	}
	
	// task 추가
	@RequestMapping("addTask.tk")
	public String insertTask(Task t, MultipartFile upfile,
						   String[] selectUser, String[] selectUserDept,
						   HttpSession session, Model model) {
		
		// 첨부파일 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/taskFiles/");
			t.setFilePath(saveFilePath);
			t.setOriginName(upfile.getOriginalFilename());
		}
		
		// task insert
		int result1 = pService.insertTask(t);
		
		// 참여자 정보 insert
		ArrayList<ProjectParticipant> taskRefUser = new ArrayList<>();
		for(int i=0; i<selectUser.length; i++) {
			ProjectParticipant p = new ProjectParticipant();
			p.setProjectNo(t.getProjectNo());
			p.setUserNo(selectUser[i]);
			p.setDepartmentNo(selectUserDept[i]);
			taskRefUser.add(p);
		}

		int result2 = pService.insertTaskParticipants(taskRefUser);
		if(result1*result2 > 0) {
			session.setAttribute("alertMsg", "업무가 추가되었습니다.");
			return "redirect:list.pr?no=" + ((Member)session.getAttribute("loginUser")).getUserNo();
		}else {
			model.addAttribute("errorMsg", "업무 추가 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="detail.tk", produces="application/json; charset=UTF-8")
	public String selectTaskDetail(int taskNo, int projectNo) {
		Task t = pService.selectTaskDetail(taskNo);
		ArrayList<ProjectParticipant> ppList = pService.selectProjectParticipants(projectNo);
		ArrayList<ProjectParticipant> tpList = pService.selectTaskParticipants(taskNo);
		JSONObject jObj = new JSONObject();
		jObj.put("t", t);
		jObj.put("ppList", ppList);
		jObj.put("tpList", tpList);
		
		return new Gson().toJson(jObj);
		
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
		
		int	result3 = pService.addTaskParticipant(updateList);
		
		
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
	*/
}
