package com.ppicachu.ppic.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {

	@RequestMapping("list.pr")
	public String selectProjectList() {
		return "project/currentProject";
	}
}
