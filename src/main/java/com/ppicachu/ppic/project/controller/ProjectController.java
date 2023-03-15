package com.ppicachu.ppic.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ppicachu.ppic.project.model.service.ProjectService;
import com.ppicachu.ppic.project.model.vo.Project;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@RequestMapping("list.pr")
	public ModelAndView selectProjectList(int userNo, ModelAndView mv) {
		System.out.println(userNo);
		ArrayList<Project> pList = pService.selectProjectList(userNo);
		System.out.println(pList);
		mv.addObject("pList", pList).setViewName("project/currentProject");
		
		return mv;
	}
}
