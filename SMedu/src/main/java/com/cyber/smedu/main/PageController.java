package com.cyber.smedu.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	//메인 페이지 이동
	@RequestMapping(value = "/smedu/main/main", method = RequestMethod.GET)
	public String main() {
		return "smedu/main/main";
	}
	
	//프로젝트 소개 페이지 이동
	@RequestMapping(value = "/smedu/introduction/introductionProject", method = RequestMethod.GET)
	public String introductionAcademy() {
		return "smedu/introduction/introduction_project";
	}
	
	//교육원 소개 페이지 이동
	@RequestMapping(value = "/smedu/introduction/introductionAcademy", method = RequestMethod.GET)
	public String introductionProject() {
		return "smedu/introduction/introduction_academy";
	}
	
	//찾아오시는 길 페이지 이동
	@RequestMapping(value = "/smedu/introduction/roadMap", method = RequestMethod.GET)
	public String roadMap() {
		return "smedu/introduction/road_map";
	}
	
	//사이트 맵 페이지 이동
	@RequestMapping(value = "/smedu/introduction/siteMap", method = RequestMethod.GET)
	public String siteMap() {
		return "smedu/introduction/site_map";
	}
}