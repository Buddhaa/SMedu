package com.cyber.smedu.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyber.smedu.task.service.TaskService;

@Controller
public class TaskController {

	@Autowired
	TaskService taskService;
	
	//교수 담당학생 과제제출물 상세보기 페이지로 이동(select)
	@RequestMapping(value="/professorStudentTaskResultDetail")
	public String professorStudentTaskResultDetail(Model model, String studentCode) {
		
		System.out.println("01 professorStudentTaskResultDetail <-- TaskController.java");
		//System.out.println("studentCode : " + studentCode);
		
		model.addAttribute("professorStudentTaskResult", taskService.professorStudentTaskResultDetail(studentCode));

		return "professor/management/management_task_submit_detail";	
	}
	//우영
	

}
