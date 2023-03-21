package com.ppicachu.ppic.project.controller;

import java.util.ArrayList;

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
	
	@RequestMapping("list.pr")
	public ModelAndView selectProjectList(@RequestParam(value="no")int userNo, ModelAndView mv) {
		ArrayList<Project> pList = pService.selectProjectList(userNo);
		mv.addObject("pList", pList).setViewName("project/currentProject");
		
		return mv;
	}
	
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
	
	@ResponseBody
	@RequestMapping(value="tpList.tk", produces="application/json; charset=UTF-8")
	public String selectTaskParticipants(int taskNo) {
		// task 참조자 리스트
		ArrayList<ProjectParticipant> tpList = pService.selectTaskParticipants(taskNo);
		
		JSONObject jObj = new JSONObject();
		jObj.put("tpList", tpList);
		
		return new Gson().toJson(jObj);
	}
	
	
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
}
