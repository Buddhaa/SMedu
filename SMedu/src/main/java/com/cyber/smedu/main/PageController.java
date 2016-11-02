package com.cyber.smedu.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	//관리자 로그인 폼
	@RequestMapping(value = "/admin/login/loginForm", method = RequestMethod.GET)
	public String adminLoginForm() {
		return "admin/login/login";
	}
}