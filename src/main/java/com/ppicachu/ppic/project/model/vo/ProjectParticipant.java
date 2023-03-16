package com.ppicachu.ppic.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProjectParticipant {

	private int projectNo;
	private int taskNo;
	private String departmentName;
	private String userName;
}
