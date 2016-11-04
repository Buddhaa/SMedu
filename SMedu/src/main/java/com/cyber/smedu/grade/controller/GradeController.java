package com.cyber.smedu.grade.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.grade.service.GradeService;
import com.cyber.smedu.user.domain.ProfessorDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class GradeController {
	
	@Autowired
	GradeService gradeServiceImpl;
		
	/*교수 자신의 담당과목들을 select
	value 값은 로그인 후 session 에 저장되있는 교수코드 값이 들어간다.*/
	
	@RequestMapping(value="/professorSubjectSelect")
	public String professorSubjectSelect(
			Model model, 
			@RequestParam(value="professorCode")String professorCode) {
										
		System.out.println("01 professorSubjectSelect <-- GradeController.java");
		//System.out.println("professorCode : " + professorCode);
		
		model.addAttribute("professorSubject", gradeServiceImpl.professorSubjectSelect(professorCode));
		
		return "professor/management/management_student_grade";		
	}
	
	/*교수의 학생 정보(이름, 전화번호, 이메일), 성적(출석,과제,토론,중간,기말)을 select
	value 값은 로그인 후 session 에 저장되있는 교수코드 값이 들어간다.*/	
	@RequestMapping(value="/professorStudentInfoSelect", method=RequestMethod.POST)
	public String professorStudentInfoSelect(Model model, String openSubjectCode,
			@ModelAttribute(value="userPlusInfo" )ProfessorDomain professorDomain) {
		
		String professorCode = professorDomain.getProfessorCode();
		
		System.out.println("---------------------------------------------"+professorCode);
		System.out.println("01 professorStudentGradeSelect <-- GradeController.java");
		System.out.println("openSubjectCode : " + openSubjectCode);
		
		model.addAttribute("professorSubject", gradeServiceImpl.professorSubjectSelect(professorCode));
		model.addAttribute("professorStudentInfo", gradeServiceImpl.professorStudentInfoSelect(openSubjectCode));		
		
		return "professor/management/management_student_grade";		
	}
	
	@RequestMapping(value="/professorStudentGradeSelect")
	public String professorStudentGradeSelect(Model model, String userCode) {
		
		System.out.println("01 professorStudentGradeSelect <-- GradeController.java");
		System.out.println("userCode : " + userCode);
		
		model.addAttribute("professorStudentGrade", gradeServiceImpl.professorStudentGradeSelect(userCode));
		
		return "professor/management/management_student_grade_search";
		
	}
}
