package com.cyber.smedu.attend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyber.smedu.attend.service.AttendService;

@Controller
public class AttendController {

	@Autowired
	AttendService attendService;
	
	@RequestMapping(value="/professorStudentAttendInfoDetail")
	public String professorStudentAttendInfoDetail(Model model, String openSubjectCode, String studentCode) {
		
		System.out.println("01 professorStudentAttendInfoDetail <-- AttendController.java");
		//System.out.println("openSubjectCode : " + openSubjectCode + "studentCode : " + studentCode);
		
		//교수 담당 학생의 이름
		model.addAttribute("professorStudentName", attendService.professorStudentNameSelect(studentCode));
		//교수 담당 개설과목 이름
		model.addAttribute("professorOpenSubjectName", attendService.professorOpenSubjectNameSelect(openSubjectCode));
		//해당 과목의 주차일정
		model.addAttribute("professorStudentWeeklySchedule", attendService.professorStudentWeeklyScheduleSelect(openSubjectCode));
		//해당 과목의 주차별 수강시간, 출석날짜, 출석점수
		model.addAttribute("professorStudentAttendInfo", attendService.professorStudentAttendInfoSelect(studentCode));
						
		return "professor/management/management_atend_detail";
		
	}
	
}
