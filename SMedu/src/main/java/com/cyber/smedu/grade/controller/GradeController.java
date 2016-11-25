package com.cyber.smedu.grade.controller;

import java.util.List;
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
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
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
		model.addAttribute("departmentCode", map.get("departmentCode"));
		model.addAttribute("userName", map.get("userName"));
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
		model.addAttribute("studentInfo", map.get("studentInfo")); //학생정보
		model.addAttribute("studentCode", studentCode); //학생코드
		model.addAttribute("cardinalList", map.get("cardinalList")); //학생 기수 리스트
		model.addAttribute("cardinalCode", cardinalCode); //선택 기수코드
		model.addAttribute("openSubjectCode", openSubjectCode); //선택 과목코드
		model.addAttribute("finalGradeList", map.get("finalGradeList")); //학생 총 성적 이수과목 리스트
		if(!cardinalCode.equals("")) {
			model.addAttribute("classRegistrationList", map.get("classRegistrationList")); //학생의 수강과목 리스트
			if(!openSubjectCode.equals("")) {
				model.addAttribute("openSubject", map.get("openSubject")); //학생 과목 선택시 과목정보
				model.addAttribute("gradeList", map.get("gradeList")); //학생 선택과목 성적
				model.addAttribute("attendList", map.get("attendList")); //학생 선택과목 출석률
				model.addAttribute("task", map.get("task")); //학생 선택과목 과제 주제,결과물,점수
				model.addAttribute("debate", map.get("debate")); //학생 선택과목 토론 주제, 내용, 등록일자
				model.addAttribute("debateResult", map.get("debateResult")); //학생 선택과목 토론 답변,답변일자,점수
				model.addAttribute("debateScore", map.get("debateScore")); //학생 선택과목 토론 점수, 채점날짜				
				model.addAttribute("MidExamInfo", map.get("MidExam")); //중간고사 시험지 정보
				model.addAttribute("finalExamInfo", map.get("finalExam")); //기말고사 시험지 정보
				model.addAttribute("MidExamAndAnswerList", map.get("MidExamAndAnswerList")); //중간고사 문제 답안 배점 학생 답안 채점점수
				model.addAttribute("finalExamAndAnswerList", map.get("finalExamAndAnswerList")); //기말고사 문제 답안 배점 학생 답안 채점점수
			}
		}
		
		return "admin/studentgrade/student_grade_detail";
	}
	
	/*의기---------------------------------------------------------------------------------------------------------------------*/
	
	//교수 자신의 담당과목들을 select	
	@RequestMapping(value="/professorSubjectSelectForCheck")
	public String professorSubjectSelectForCheck(
			Model model, 
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
		
		String professorCode = professorDomain.getProfessorCode();					
		//System.out.println("01 professorSubjectSelectForCheck <-- GradeController.java");
		//System.out.println("professorCode : " + professorCode);
		
		model.addAttribute("professorSubject", gradeService.professorSubjectSelectForCheck(professorCode));
		
/*		List<OpenSubjectDomain> openSubjectDomain =
				gradeService.professorSubjectSelectForCheck(professorCode);
		
		System.out.println(openSubjectDomain);*/
		
		return "professor/management/management_student_grade";		
	}
	
	//학생성적조회를 위한 교수의 학생 정보(이름, 전화번호, 이메일), 성적(출석,과제,토론,중간,기말)을 select + 검색기능추가	
	@RequestMapping(value="/professorStudentInfoSelect", method=RequestMethod.POST)
	public String professorStudentInfoSelect(Model model, String openSubjectCode, String searchWord,
			@ModelAttribute(value="userPlusInfo" )ProfessorDomain professorDomain) {
		
		String professorCode = professorDomain.getProfessorCode();
		
/*		System.out.println("---------------------------------------------"+professorCode);
		System.out.println("openSubjectCode : " + openSubjectCode);
		System.out.println("01 professorStudentInfoSelect <-- GradeController.java");*/
		
		model.addAttribute("openSubjectCode", openSubjectCode);
		model.addAttribute("professorSubject", gradeService.professorSubjectSelectForCheck(professorCode));
		model.addAttribute("professorStudentInfo", gradeService.professorStudentInfoSelect(openSubjectCode, searchWord));		
		
/*		List<UserDomain> userDomain = 
				gradeService.professorStudentInfoSelect(openSubjectCode, searchWord);
		System.out.println("userDomain : " + userDomain);*/
		
		return "professor/management/management_student_grade";		
	}
	
	//성적조회 클릭시 학생의 성적과 최종성적을 select
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
	public String professorStudentGradeManageSelect(Model model, String openSubjectCode, String searchWord,
			@ModelAttribute(value="userPlusInfo" )ProfessorDomain professorDomain) {
				
		String professorCode = professorDomain.getProfessorCode();
	
		System.out.println("01 professorStudentGradeManageSelect <-- GradeController.java");
		//System.out.println("professorCode : " + professorCode);
		//System.out.println("openSubjectCode : " + openSubjectCode);

		model.addAttribute("openSubjectCode", openSubjectCode);
		model.addAttribute("professorSubject", gradeService.professorSubjectSelectForManage(professorCode));
		model.addAttribute("professorStudentNameAndCode", gradeService.professorStudentNameAndCodeSelect(openSubjectCode, searchWord));
				
		return "professor/management/management_student_grade_list";
		
	}
	/*우영---------------------------------------------------------------------------------------------------------------------*/
	
	//나의 학점관리 페이지 이동
	@RequestMapping(value="/classroomCreditManage", method=RequestMethod.GET)
	public String creditManage(Model model
								,@ModelAttribute(value="userInfo") UserDomain userDomain){
	
		String userCode = userDomain.getUserCode();
		
		model.addAttribute("creditList", gradeService.creditManage(userCode));
		
		return "student/classroom/classroom_credit_manage";
		
	}

	//나의 이수학점관리 페이지 이동
	@RequestMapping(value="/finalResultGrade", method=RequestMethod.GET)
	public String finalResultGrade(Model model
								,@ModelAttribute(value="userInfo") UserDomain userDomain){
	
		String userCode = userDomain.getUserCode();
		
		model.addAttribute("gradeDomainList", gradeService.finalResultGrade(userCode));
		 
		System.out.println(model.toString());
		
		return "student/mypage/mypage_final_result_grade";
	}
	/*장용------------------------------------------------------------------------------------------------------------------*/
}
