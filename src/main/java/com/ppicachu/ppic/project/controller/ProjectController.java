package com.ppicachu.ppic.project.controller;

import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView selectProjectList(int userNo, ModelAndView mv) {
		ArrayList<Project> pList = pService.selectProjectList(userNo);
		mv.addObject("pList", pList).setViewName("project/currentProject");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="detail.pr", produces="application/json; charset=UTF-8")
	public String selectProjectParticipants(int projectNo) {
		ArrayList<ProjectParticipant> ppList = pService.selectProjectParticipants(projectNo);
		ArrayList<Task> tList = pService.selectTaskList(projectNo);
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("ppList", ppList);
		jObj.put("tList", tList);
		
		return new Gson().toJson(jObj);
		
	}
}
