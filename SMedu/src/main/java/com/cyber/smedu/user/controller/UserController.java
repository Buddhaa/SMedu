package com.cyber.smedu.user.controller;

import java.util.Map;

import javax.swing.JOptionPane;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.user.domain.PlannerDomain;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;
import com.cyber.smedu.user.service.UserService;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class UserController {
	@Autowired UserService userService;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//관리자 로그인 폼
	@RequestMapping(value = "/admin/login/loginForm", method = RequestMethod.GET)
	public String adminLoginForm() {
		return "admin/login/login";
	}
	//관리자 페이지 로그인 처리 맵핑
	@RequestMapping(value = "/admin/login/login", method = RequestMethod.POST)
	public String adminLogin(Model model,
								@RequestParam(value="userId") String userId,
								@RequestParam(value="userPw") String userPw) {
		Map<String, Object> map = userService.adminLogin(userId, userPw);
		if(map.get("userInfo")!=null) {
			model.addAttribute("userInfo", map.get("userInfo"));
		} else {
			model.addAttribute("loginFalseMessage", map.get("loginFalse"));
			return "admin/login/login";
		}
		return "admin/main/main";
	}
	//메인 페이지 로그인 처리 맵핑
	@RequestMapping(value = "/smedu/login/login", method = RequestMethod.POST)
	public String login(Model model,
								@RequestParam(value="userId") String userId,
								@RequestParam(value="userPw") String userPw) {
		Map<String, Object> map = userService.login(userId, userPw);
		if(map.get("userInfo")!=null) {
			model.addAttribute("userInfo", map.get("userInfo"));
			if(map.get("userPlusInfo")!=null){
				model.addAttribute("userPlusInfo", map.get("userPlusInfo"));
			}
		} else {
			model.addAttribute("loginFalseMessage", map.get("loginFalse"));
			return "smedu/main/login_form";
		}
		return "smedu/main/main";
	}
	//관리자 메인 페이지 맵핑
	@RequestMapping(value = "/admin/main/main", method = RequestMethod.GET)
	public String adminMain() {
		return "admin/main/main";
	}
	
	//관리자 로그아웃 맵핑
	@RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
	public String adminLogout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/admin/login/loginForm";
	}
	//관리자 회원관리 리스트
	@RequestMapping(value = "/admin/user/userList", method = RequestMethod.GET)
	public String adminUserList(Model model) {
		Map<String, Object> map = userService.selectAdminUserList();
		model.addAttribute("userList", map.get("userList"));
		return "admin/user/user_list";
	}
	//관리자 회원 상세보기
	@RequestMapping(value = "/admin/user/userDetail", method = RequestMethod.GET)
	public String adminUserDetail(Model model,
									@RequestParam(value="userCode") String userCode) {
		Map<String, Object> map = userService.selectAdminUserDetail(userCode);
		model.addAttribute("originInfo", map.get("originInfo"));
		model.addAttribute("plusInfo", map.get("plusInfo"));
		return "admin/user/user_detail";
	}
	//관리자 교수,플래너 가입승인요청 리스트
	@RequestMapping(value = "/admin/user/joinRequest", method = RequestMethod.GET)
	public String adminJoinRequest(Model model) {
		Map<String, Object> map = userService.selectAdminJoinRequestList();
		model.addAttribute("joinRequestList", map.get("joinRequestList"));
		return "admin/user/professor_planner_join";
	}
	//사용자페이지 로그아웃 맵핑
	@RequestMapping(value = "/smedu/main/logOut", method = RequestMethod.GET)
	public String smeduLogout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/smedu/main/main";
	}
	
	//로그인 폼으로 이동
	@RequestMapping(value = "/smedu/main/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "smedu/main/login_form";
	}
	
	//회원가입 폼으로 이동
	@RequestMapping(value = "/smedu/main/signUpUser", method = RequestMethod.GET)
	public String signUpUser() {
		return "smedu/main/sign_up_user";
	}
	
	//교수,플래너 폼으로 이동
	@RequestMapping(value = "/smedu/main/professorPlannerInsertForm", method = RequestMethod.GET)
	public String professorPlannerInsertForm() {
		return "smedu/main/professor_planner_insert";
	}

	//학생(회원) 폼으로 이동
	@RequestMapping(value = "/smedu/main/studentInsertForm", method = RequestMethod.GET)
	public String studentInsertForm() {
		return "smedu/main/student_insert";
	}
	
	//학생 (회원) 가입 처리
	@RequestMapping(value = "/smedu/main/studentInsert", method = RequestMethod.POST)
	public String studentInsert(UserDomain user, StudentDomain student) {
		userService.addStudent(user, student);
		return "redirect:/smedu/main/main";
	}
	
	//교수 가입 처리
	@RequestMapping(value = "/smedu/main/professorInsert", method = RequestMethod.POST)
	public String professorInsert(UserDomain user, ProfessorDomain professor) {
		userService.addProfessor(user, professor);
		return "redirect:/smedu/main/main";
	}
	
	//플래너  가입 처리
	@RequestMapping(value = "/smedu/main/plannerInsert", method = RequestMethod.POST)
	public String plannerInsert(UserDomain user, PlannerDomain planner) {
		userService.addPlanner(user, planner);
		return "redirect:/smedu/main/main";
	}
	/*------------------------------------------------------------------------*/
	
	//학생정보수정페이지 이동
	@RequestMapping(value="/studentInfo", method=RequestMethod.GET)
	public String studentSelectOne(Model model 
									,@ModelAttribute(value="userInfo") UserDomain userDomain){
		String userCode = userDomain.getUserCode();
		logger.info(" 회원정보 페이지{}.","studentInfo()");		
		model.addAttribute("studentInfo", userService.studentSelectOne(userCode));		
		logger.info(" 회원정보 페이지 이동 정보{}.", model.toString());
		return"student/mypage/mypage_student_info";
	}
	
	
	//학생정보수정처리
	@RequestMapping(value="/updateStudentInfo", method=RequestMethod.POST)
	public String studentUpdate(StudentDomain studentDomain){
		logger.info("학생정보수정처리{}.","studentUpdate()"+studentDomain.toString());
				
		userService.studentUpdate(studentDomain);
		
		return "redirect:/studentInfo";
	}
	
	
	//이수학점관리페이지 이동 -- grade
	@RequestMapping(value="/finalResultGrade", method=RequestMethod.GET)
	public String finalResultGrade(Model model
									,@ModelAttribute(value="userInfo") UserDomain userDomain){
		String userCode = userDomain.getUserCode();
		model.addAttribute("finalResultGrade", userService.finalResultGrade(userCode));	

		logger.info("modle toString : {}", model.toString());
		return "student/mypage/mypage_final_result_grade";		
	}	
	
	
	//나의 상담내역페이지 이동 -- board
	@RequestMapping(value="/studentconsultingHistory", method=RequestMethod.GET)
	public String consultingHistory(Model model
									,@ModelAttribute(value="userInfo") UserDomain userDomain){
		String userCode = userDomain.getUserCode();
		logger.info("{}", "나의 상담내역페이지 이동");
		
		model.addAttribute("board", userService.consultingHistory(userCode));		
		
		logger.info("modle toString : {}", model.toString());
		return "student/mypage/mypage_consulting_history";	
	}
	
	
	//나의 상담내역디테일 페이지 이동 -- board
	@RequestMapping(value="/studentConsultingHistoryDetail", method=RequestMethod.GET)
	public String consultingHistoryDetail(Model model
											,@RequestParam(value="boardArticleCode") String boardArticleCode){
		
		logger.info("{}", "나의 상담내역디테일 페이지 이동");
		
		BoardArticleDomain boardArticleDomain = userService.consultingHistoryDetail(boardArticleCode);
		
		model.addAttribute("consultingHistoryDetail", boardArticleDomain);
		
		return "student/mypage/mypage_consulting_history_detail";
	}

	
	//나의 학사관리 페이지 이동 -- openSubject
	@RequestMapping(value="/classroomAcademicActivity", method=RequestMethod.GET)
	public String classroomAcademicaCtivity(Model model
											,@ModelAttribute(value="userInfo") UserDomain userDomain
											,@RequestParam(value="openSubjectCode", defaultValue="") String openSubjectCode
											,AttendDomain attendDomain){
	String userCode = userDomain.getUserCode();
		
	System.out.println("-------------------------"+userCode);
	//나의 학사관리 페이지 이동
	model.addAttribute("classroomAcademicaCtivity", userService.classroomAcademicaCtivity(userCode));
		
	//나의 학사관리에서 과목 선택시		
	model.addAttribute("classroomAcademicaCtivityView", userService.classroomAcademicaCtivityView(openSubjectCode));
		
	//나의 학사관리에서 과목 선택시 출석여부 확인
	model.addAttribute("openSubjectAttendList",userService.openSubjectAttendList(userCode, attendDomain));
	
	System.out.println(model.toString());
	return"student/classroom/classroom_academic_activity";
	}
	
	//한명의 교수 정보를 select, value값에 login 시 session 에 저장된 userCode 입력 
	@RequestMapping(value="/professorInfo")
	public String professorSelectOne(Model model, 
								@ModelAttribute(value="userInfo" ) UserDomain userDomain) {
		
		System.out.println("01 professorSelectOne <-- UserController.java");
		String userCode = userDomain.getUserCode();
		model.addAttribute("professorInfo", userService.getProfessorSelectOne(userCode));
		
		
		return "professor/mypage/mypage_professor_info";
		
	}
	
	//교수 정보를 update
	@RequestMapping(value="/updateProfessorInfo", method=RequestMethod.POST)
	public String professorUpdate(ProfessorDomain professorDomain) {
		
		System.out.println("01 professorUpdate <-- UserController.java");
		String userCode = professorDomain.getUserCode();
		userService.professorUpdate(professorDomain);
		
		return "redirect:/professorInfo?userCode="+userCode+"";
				
	}
	
	//탈퇴폼
	@RequestMapping(value="/userDelete")
	public String userDeleteView() {
		
		System.out.println("01 professorDeleteView <-- UserController.java");

		return "smedu/main/user_delete";		
	}
	
	//탈퇴처리 한명의 회원정보의 상태와 탈퇴일을 update
	@RequestMapping(value="/userStateUpdate", method=RequestMethod.POST)
	public String userStateUpdate(String userCode) {
		
		System.out.println("01 userStateUpdate <-- UserController.java");
		System.out.println("userCode : " + userCode);
		
		userService.userStateUpdate(userCode);
		
		return "redirect:/smedu/main/logOut";
	}
	
}