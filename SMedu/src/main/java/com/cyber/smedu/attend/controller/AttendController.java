package com.cyber.smedu.attend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyber.smedu.attend.domain.AttendDomain;
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
	//우영
	//학생 강의 출석저장
	@RequestMapping(value="/lectureAttendUpdate", method=RequestMethod.GET)
	public String lectureAttendUpdate(AttendDomain attendDomain){

		System.out.println(attendDomain.toString());
		attendService.lectureAttendUpdate(attendDomain);
	
		return "student/classroom/close";	
	}
		
	//장용
	
}
