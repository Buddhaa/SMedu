package com.cyber.smedu.grade.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.grade.service.GradeService;
import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class GradeController {
	
	@Autowired
	GradeService gradeService;
	
	@Autowired 
	OpenSubjectService openSubjectService;
	
	
	//관리자 성적관리 학생 리스트 페이지(검색)
	@RequestMapping(value="/admin/studentGrade/list", method=RequestMethod.GET)
	public String adminSelectStudentList(Model model,
											@RequestParam(value="departmentCode", defaultValue="")String departmentCode,
											@RequestParam(value="userName", defaultValue="")String userName) {
		Map<String, Object> map = gradeService.adminStudentGradeList(departmentCode, userName); //검색창 학과리스트
		model.addAttribute("studentList", map.get("studentList"));
		model.addAttribute("cardinalList", map.get("cardinalList"));
		model.addAttribute("departmentList", map.get("departmentList"));
		return "admin/studentgrade/student_grade_list";
	}
	//관리자 성적관리 학생 상세보기
	@RequestMapping(value="/admin/studentGrade/detail", method=RequestMethod.GET)
	public String adminSelectStudentDetail(Model model,
											@RequestParam(value="userCode")String userCode,
											@RequestParam(value="studentCode")String studentCode,
											@RequestParam(value="cardinalCode", defaultValue="")String cardinalCode,
											@RequestParam(value="openSubjectCode", defaultValue="")String openSubjectCode) {
		Map<String, Object> map = gradeService.adminStudentGradeDetail(userCode, studentCode, cardinalCode, openSubjectCode);
		model.addAttribute("studentInfo", map.get("studentInfo"));
		model.addAttribute("studentCode", studentCode);
		model.addAttribute("cardinalList", map.get("cardinalList"));
		model.addAttribute("cardinalCode", cardinalCode);
		model.addAttribute("openSubjectCode", openSubjectCode);
		model.addAttribute("finalGradeList", map.get("finalGradeList"));
		if(cardinalCode != "") {
			model.addAttribute("classRegistrationList", map.get("classRegistrationList"));
			if(openSubjectCode != "") {
				model.addAttribute("openSubject", map.get("openSubject"));
			}
		}
		
		return "admin/studentgrade/student_grade_detail";
	}
	
	/*의기---------------------------------------------------------------------------------------------------------------------*/
	
	/*교수 자신의 담당과목들을 select
	value 값은 로그인 후 session 에 저장되있는 교수코드 값이 들어간다.*/
	
	@RequestMapping(value="/professorSubjectSelectForCheck")
	public String professorSubjectSelectForCheck(
			Model model, 
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
		
		String professorCode = professorDomain.getProfessorCode();					
		System.out.println("01 professorSubjectSelectForCheck <-- GradeController.java");
		//System.out.println("professorCode : " + professorCode);
		
		model.addAttribute("professorSubject", gradeService.professorSubjectSelectForCheck(professorCode));
		
		return "professor/management/management_student_grade";		
	}
	
	/*학생성적조회를 위한 교수의 학생 정보(이름, 전화번호, 이메일), 성적(출석,과제,토론,중간,기말)을 select
	value 값은 로그인 후 session 에 저장되있는 교수코드 값이 들어간다.*/	
	@RequestMapping(value="/professorStudentInfoSelect", method=RequestMethod.POST)
	public String professorStudentInfoSelect(Model model, String openSubjectCode,
			@ModelAttribute(value="userPlusInfo" )ProfessorDomain professorDomain) {
		
		String professorCode = professorDomain.getProfessorCode();
		
		System.out.println("---------------------------------------------"+professorCode);
		System.out.println("01 professorStudentInfoSelect <-- GradeController.java");
		//System.out.println("openSubjectCode : " + openSubjectCode);
		
		model.addAttribute("professorSubject", gradeService.professorSubjectSelectForCheck(professorCode));
		model.addAttribute("professorStudentInfo", gradeService.professorStudentInfoSelect(openSubjectCode));		
		
		return "professor/management/management_student_grade";		
	}
	
	@RequestMapping(value="/professorStudentGradeSelect")
	public String professorStudentGradeSelect(Model model, String userCode) {
		
		System.out.println("01 professorStudentGradeSelect <-- GradeController.java");
		//System.out.println("userCode : " + userCode);
		
		//교수 학생의 성적 select
		model.addAttribute("professorStudentGrade", gradeService.professorStudentGradeSelect(userCode));	
		//교수 학생의 최종성적 select
		model.addAttribute("professorStudentFinalGrade", gradeService.professorStudentFinalGradeSelect(userCode));
		
		return "professor/management/management_student_grade_search";
		
	}
	
	//학생성적관리를 위한 과목선택 페이지
	@RequestMapping(value="/professorSubjectSelectForManage")
	public String professorSubjectSelectForManage(
			Model model, 
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
		
		String professorCode = professorDomain.getProfessorCode();					
		System.out.println("01 professorSubjectSelectForManage <-- GradeController.java");
		//System.out.println("professorCode : " + professorCode);
		
		model.addAttribute("professorSubject", gradeService.professorSubjectSelectForManage(professorCode));
		
		return "professor/management/management_student_grade_list";		
	}
	
	//과목 선택후 보여지는 학생리스트
	@RequestMapping(value="/professorStudentGradeManageSelect", method=RequestMethod.POST)
	public String professorStudentGradeManageSelect(Model model, String openSubjectCode,
			@ModelAttribute(value="userPlusInfo" )ProfessorDomain professorDomain) {
				
		String professorCode = professorDomain.getProfessorCode();
		
		System.out.println("01 professorStudentGradeManageSelect <-- GradeController.java");
		//System.out.println("professorCode : " + professorCode);
		//System.out.println("openSubjectCode : " + openSubjectCode);
		
		model.addAttribute("professorSubject", gradeService.professorSubjectSelectForManage(professorCode));
		model.addAttribute("professorStudentNameAndCode", gradeService.professorStudentNameAndCodeSelect(openSubjectCode));
				
		return "professor/management/management_student_grade_list";
		
	}
	/*우영---------------------------------------------------------------------------------------------------------------------*/
	//이수학점관리페이지 이동
		@RequestMapping(value="/finalResultGrade", method=RequestMethod.GET)
		public String finalResultGrade(Model model
										,@ModelAttribute(value="userInfo") UserDomain userDomain){
			String userCode = userDomain.getUserCode();
			model.addAttribute("finalResultGrade", gradeService.finalResultGrade(userCode));	

			return "student/mypage/mypage_final_result_grade";		
		}	

		
		//나의 학점 관리 페이지 이동
		@RequestMapping(value="/classroomCreditManage", method=RequestMethod.GET)
		public String CreditManage(Model model
									,@ModelAttribute(value="userInfo") UserDomain userDomain
									,@RequestParam(value="openSubjectCode", defaultValue="") String openSubjectCode){
		
			String userCode = userDomain.getUserCode();
			
			//나의 학점 관리 페이지 이동 -> 과목선택 가져오기
			model.addAttribute("openSubjectSelect", openSubjectService.classroomAcademicaCtivity(userCode));
			
			//나의 학점 관리 페이지에서 과목 선택시 -> 해당 과목 출석률, 과제, 토론, 시험, 총성적 받아오기
			model.addAttribute("gradeDomainList", gradeService.studentCreditManage(userCode, openSubjectCode));
			
			return "student/classroom/classroom_credit_manage";
		}
	/*장용------------------------------------------------------------------------------------------------------------------*/
}
