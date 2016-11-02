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

import com.cyber.smedu.user.service.UserService;

@Controller
public class UserController {
	@Autowired UserService userService;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
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
		if(map.get("loginFalse").equals(null)) {
			model.addAttribute("userInfo", map.get("userInfo"));
			model.addAttribute("userPlusInfo", map.get("userPlusInfo"));
		} else {
			model.addAttribute("loginFalseMessage", map.get("loginFalse"));
		}
		return "smedu/main/main";
	}
}