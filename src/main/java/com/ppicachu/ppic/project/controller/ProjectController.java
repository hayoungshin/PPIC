package com.ppicachu.ppic.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ppicachu.ppic.project.model.service.ProjectService;
import com.ppicachu.ppic.project.model.vo.Project;
import com.ppicachu.ppic.project.model.vo.ProjectParticipant;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@RequestMapping("list.pr")
	public ModelAndView selectProjectList(int userNo, ModelAndView mv) {
		ArrayList<Project> pList = pService.selectProjectList(userNo);
		Project p = pList.get(0);
		mv.addObject("pList", pList).addObject("p", p).setViewName("project/currentProject");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="detail.pr", produces="application/json; charset=UTF-8")
	public String selectProjectParticipants(int projectNo) {
		ArrayList<ProjectParticipant> ppList = pService.selectProjectParticipants(projectNo);
		return new Gson().toJson(ppList);
	}
}
