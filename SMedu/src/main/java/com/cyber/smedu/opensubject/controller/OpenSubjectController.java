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

import com.cyber.smedu.academiccalendar.service.AcademicCalendarService;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.attend.service.AttendService;
import com.cyber.smedu.curriculum.service.CurriculumService;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.UserDomain;
import com.cyber.smedu.user.service.UserService;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class OpenSubjectController {
	@Autowired OpenSubjectService openSubjectService;
	@Autowired CurriculumService curriculumService;
	@Autowired AcademicCalendarService academicCalendarService;
	@Autowired AttendService attendService;
	@Autowired UserService userService;
		
	@RequestMapping(value="/admin/curriculum/openSubjectList", method=RequestMethod.GET)
	public String adminOpenSubjectList(Model model,
											@RequestParam(value="cardinalCode", defaultValue="") String cardinalCode,
											@RequestParam(value="subjectName", defaultValue="") String subjectName,
											@RequestParam(value="professorName", defaultValue="") String professorName){	
		Map<String, Object> map = openSubjectService.selectAdminOpenSubject(cardinalCode, subjectName, professorName);
		model.addAttribute("openSubjectList", map.get("openSubjectList"));
		model.addAttribute("cardinalList", map.get("cardinalList"));
		
		//select박스 값 검색후 저장
		model.addAttribute("cardinalCode", cardinalCode);
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("professorName", professorName);
		return"admin/curriculum/open_subject_list";
	}
	//의기
	
	// -- 수정 --  //
	//나의 학사관리 페이지 이동 -- openSubject
	@RequestMapping(value="/classroomAcademicActivity", method=RequestMethod.GET)
	public String classroomAcademicaCtivity(Model model
											,@ModelAttribute(value="userInfo") UserDomain userDomain
											,@RequestParam(value="openSubjectCode", defaultValue="") String openSubjectCode
											,AttendDomain attendDomain){
	String userCode = userDomain.getUserCode();
		
	//학생이 수강신청을 안했을 경우 수강신청 페이지로 이동
	String studentCode = openSubjectService.studentCodeCheck(userCode);
	
	if(studentCode.equals("수강신청 안함")){
		
		return "redirect:/smedu/classregistration/classregistrationOpenSubject";
	}else{
		
		//나의 학사관리 페이지 이동
		model.addAttribute("openSubjectSelect", openSubjectService.classroomAcademicaCtivity(userCode));
			
		//나의 학사관리에서 과목 선택시		
		model.addAttribute("classroomAcademicaCtivityView", openSubjectService.classroomAcademicaCtivityView(openSubjectCode));
			
		//나의 학사관리에서 과목 선택시 출석여부 확인
		model.addAttribute("openSubjectAttendList",openSubjectService.openSubjectAttendList(userCode, attendDomain));
		
		//selectbox 고정시키는 값
		model.addAttribute("selectbox", openSubjectCode);
		
		System.out.println(model.toString());
		return "student/classroom/classroom_academic_activity";
	}
	
	}

	//나의 학사관리 페이지에서 과목 수강하기 클릭시 팝업창에 해당 과목의 동영상 나오기
	@RequestMapping(value="/classroomLecture", method=RequestMethod.GET)
	public String classroomLecture(Model model
									,@ModelAttribute(value="userInfo") UserDomain userDomain
									,@RequestParam(value="lectureCode") String lectureCode) throws ParseException{
		
		String userCode = userDomain.getUserCode();
		
		//리턴시킬 객체를 받아오기
		model.addAttribute("oneLectureList", openSubjectService.oneLecture(lectureCode));
		
		//해당강의 출석을 받아오기
		model.addAttribute("studentAttend",attendService.studentAttend(userCode,lectureCode));
		
		return "student/classroom/classroom_lecture";
	}
	//장용
	//수강신청 페이지
	@RequestMapping(value = "/smedu/classregistration/classregistrationOpenSubject", method = RequestMethod.GET)
	public String classregistrationOpenSubject(Model model,
			@RequestParam(value="departmentCode", defaultValue="") String departmentCode,
			@RequestParam(value="cardinalCode", defaultValue="") String cardinalCode) {		
		System.out.println("departmentCode : " + departmentCode);
		Map<String, Object> map = openSubjectService.selectOpenSubjectList(departmentCode, cardinalCode);
		model.addAttribute("cardinalList", map.get("cardinalList"));
		model.addAttribute("openSubjectList", map.get("openSubjectList"));
		Map<String, Object> map1 = curriculumService.selectDepartmentList();
		model.addAttribute("departmentList", map1.get("departmentList"));			
		model.addAttribute("departmentCode",departmentCode);
		model.addAttribute("cardinalCode",map.get("cardinalCode"));
		System.out.println(curriculumService.selectDepartmentList());
		return "smedu/classregistration/classregistration_open_subject";
	}
	//교수 상세보기
	@RequestMapping(value = "/smedu/classregistration/classregistrationProfessorInfo", method = RequestMethod.GET)
	public String classregistrationProfessorInfo(Model model,
			@RequestParam(value="professorCode") String professorCode){
		model.addAttribute("professorSelectInfo", userService.professorSelectInfo(professorCode));
		System.out.println(userService.professorSelectInfo(professorCode));
		return "smedu/classregistration/classregistration_professor_info";
	}
	//과목상세보기
	@RequestMapping(value = "/smedu/classregistration/classregistrationSubjectInfo", method = RequestMethod.GET)
	public String classregistrationSubjectInfo(Model model,
			@RequestParam(value="subjectCode") String subjectCode){
		model.addAttribute("subjectSelectInfo",curriculumService.subjectSelectInfo(subjectCode));
		return "smedu/classregistration/classregistration_subject_info";
	}
	//현호
		
	//강의관리를 위한 담당개설과목 선택 화면으로 이동
	@RequestMapping(value="/professorSubjectSelectForLecture")
	public String professorSubjectSelectForLecture(Model model, 
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
				
		String professorCode = professorDomain.getProfessorCode();
		
		System.out.println("01 professorSubjectSelectForLecture <-- OpenSubjectController.java");
		System.out.println("professorCode : " + professorCode);
		
		model.addAttribute("professorSubject", openSubjectService.professorSubjectSelectForLecture(professorCode));
		
		return "professor/management/management_lecture_list";		
	}
	
	@RequestMapping(value="/professorLectureListSelect", method=RequestMethod.POST)
	public String professorLectureListSelect(Model model, String openSubjectCode,
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
		
		String professorCode = professorDomain.getProfessorCode();
		
		System.out.println("01 professorLectureListSelect <-- OpenSubjectController.java");
		System.out.println("professorCode : " + professorCode + "//openSubjectCode : " + openSubjectCode);
		
		//openSubjectCode
		model.addAttribute("openSubjectCode", openSubjectCode);
		//과목선택을 위한 과목정보
		model.addAttribute("professorSubject", openSubjectService.professorSubjectSelectForLecture(professorCode));
		//강의정보 및 주차별 일정
		model.addAttribute("professorLectureList", openSubjectService.professorLectureListSelect(openSubjectCode));
		
		return "professor/management/management_lecture_list";		
	}
	
	@RequestMapping(value="/professorLetureDetail")
	public String professorLetureDetail(Model model, String lectureCode) {
		
		System.out.println("01 professorLetureDetail <-- OpenSubjectController.java");
		System.out.println("lectureCode : " + lectureCode);
		
		model.addAttribute("professorLetureDetail", openSubjectService.professorLetureDetail(lectureCode));
				
		return "professor/management/management_lecture_view";		
	}
	
	@RequestMapping(value="/professorLectureUpdateForm", method=RequestMethod.POST)
	public String professorLectureUpdateForm(Model model, LectureDomain lectureDomain) {
		
		System.out.println("01 professorLectureUpdateForm <-- OpenSubjectController.java");
		System.out.println("lectureDomain : " + lectureDomain);
		
		model.addAttribute("lectureDomain", lectureDomain);
		
		return "professor/management/management_lecture_update";
	}
	
	@RequestMapping(value="/professorLectureUpdate", method=RequestMethod.POST)
	public String professorLectureUpdate(LectureDomain lectureDomain) {
		
		System.out.println("01professorLectureUpdate <-- OpenSubjectController.java");
		System.out.println("lectureDomain : " + lectureDomain);
		String lectureCode = lectureDomain.getLectureCode();
		
		openSubjectService.professorLectureUpdate(lectureDomain);
		
		return "redirect:/professorLetureDetail?lectureCode="+lectureCode+"";
	}
	
	@RequestMapping(value="/professorLectureInsert")
	public String professorLectureInsertView(Model model, String openSubjectCode) {
		
		System.out.println("01 professorLectureInsert <-- OpenSubjectController.java");
		System.out.println("openSubjectCode : " + openSubjectCode);
		
		model.addAttribute("academicCalendar", openSubjectService.professorLectureInsertView(openSubjectCode));
		model.addAttribute("lectureAcademicCalendarCode", openSubjectService.lectureAcademicCalendarCodeSelect(openSubjectCode));
		
		return "professor/management/management_lecture_insert";
		
	}
	
	@RequestMapping(value="/professorLectureInsert", method=RequestMethod.POST)
	public String professorLectureInsert(LectureDomain lectureDomain) {
		
		System.out.println("01 professorLectureInsert <-- OpenSubjectController.java");
		System.out.println("lectureDomain : " + lectureDomain);
		
		openSubjectService.professorLectureInsert(lectureDomain);
		
		return "professor/management/close_jsp";
		
	}
	//우영
	
}
