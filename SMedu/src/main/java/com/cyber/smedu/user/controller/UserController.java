package com.cyber.smedu.user.controller;

import java.util.Map;

import javax.swing.JOptionPane;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
		System.out.println(map.get("userInfo"));
		System.out.println(map.get("loginFalse"));
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
	
	//교수 가입 처리
	@RequestMapping(value = "/smedu/main/plannerInsert", method = RequestMethod.POST)
	public String plannerInsert(UserDomain user, PlannerDomain planner) {
		userService.addPlanner(user, planner);
		return "redirect:/smedu/main/main";
	}
}