package com.cyber.smedu.opensubject.controller;

import java.text.ParseException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class OpenSubjectController {
	@Autowired OpenSubjectService openSubjectService;
		
	@RequestMapping(value="/admin/curriculum/openSubjectList", method=RequestMethod.GET)
	public String adminOpenSubjectList(Model model){	
		Map<String, Object> map = openSubjectService.selectAdminOpenSubject();
		model.addAttribute("openSubjectList", map.get("openSubjectList"));
		return"admin/curriculum/open_subject_list";
	}
	//의기
	
	//나의 학사관리 페이지 이동 -- openSubject
	@RequestMapping(value="/classroomAcademicActivity", method=RequestMethod.GET)
	public String classroomAcademicaCtivity(Model model
											,@ModelAttribute(value="userInfo") UserDomain userDomain
											,@RequestParam(value="openSubjectCode", defaultValue="") String openSubjectCode
											,AttendDomain attendDomain){
	String userCode = userDomain.getUserCode();
		
	System.out.println("-------------------------"+userCode);
	//나의 학사관리 페이지 이동
	model.addAttribute("openSubjectSelect", openSubjectService.classroomAcademicaCtivity(userCode));
		
	//나의 학사관리에서 과목 선택시		
	model.addAttribute("classroomAcademicaCtivityView", openSubjectService.classroomAcademicaCtivityView(openSubjectCode));
		
	//나의 학사관리에서 과목 선택시 출석여부 확인
	model.addAttribute("openSubjectAttendList",openSubjectService.openSubjectAttendList(userCode, attendDomain));
	
	System.out.println(model.toString());
	return"student/classroom/classroom_academic_activity";
	}

	
	//나의 학사관리 페이지에서 과목 수강하기 클릭시 팝업창에 해당 과목의 동영상 나오기
	@RequestMapping(value="/classroomLecture", method=RequestMethod.GET)
	public String classroomLecture(Model model
									,@RequestParam(value="lectureCode") String lectureCode) throws ParseException{
		System.out.println("lectureCode : " + lectureCode);
		
		//리턴시킬 객체를 받아오기
		model.addAttribute("oneLectureList", openSubjectService.oneLecture(lectureCode)); 
		
		System.out.println("model : " + model.toString());
		return "student/classroom/classroom_lecture";
	}
	//장용
	
}
