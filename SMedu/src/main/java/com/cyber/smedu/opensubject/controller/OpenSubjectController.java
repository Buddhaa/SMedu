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

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class OpenSubjectController {
	@Autowired OpenSubjectService openSubjectService;
	@Autowired CurriculumService curriculumService;
	@Autowired AcademicCalendarService academicCalendarService;
	@Autowired AttendService attendService;
		
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
	
	//selectbox 고정시키는 값
	model.addAttribute("selectbox", openSubjectCode);
	
	System.out.println(model.toString());
	return"student/classroom/classroom_academic_activity";
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
