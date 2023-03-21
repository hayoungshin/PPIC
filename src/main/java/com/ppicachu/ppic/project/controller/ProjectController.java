package com.ppicachu.ppic.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ppicachu.ppic.project.model.service.ProjectService;
import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.ProjectParticipant;
import com.ppicachu.ppic.project.model.vo.Task;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	// 로그인유저의 프로젝트 리스트 조회
	@RequestMapping("list.pr")
	public ModelAndView selectProjectList(@RequestParam(value="no")int userNo, ModelAndView mv) {
		ArrayList<Project> pList = pService.selectProjectList(userNo);
		mv.addObject("pList", pList).setViewName("project/currentProject");
		
		return mv;
	}
	
	// 프로젝트 상세정보 조회
	@ResponseBody
	@RequestMapping(value="detail.pr", produces="application/json; charset=UTF-8")
	public String selectProjectParticipants(int projectNo) {
		// 프로젝트 참여자 리스트
		ArrayList<ProjectParticipant> ppList = pService.selectProjectParticipants(projectNo);
		// task 리스트
		ArrayList<Task> tList = pService.selectTaskList(projectNo);
		// task 참조자 수
		int tpCount = 0;
		for(int i=0; i<tList.size(); i++) {
			tpCount = pService.selectCountTaskParticipants(tList.get(i).getTaskNo());
			tList.get(i).setRefPeopleCnt(tpCount);
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("ppList", ppList);
		jObj.put("tList", tList);
		
		return new Gson().toJson(jObj);
		
	}
	
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
}
