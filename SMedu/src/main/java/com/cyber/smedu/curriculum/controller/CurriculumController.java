package com.cyber.smedu.curriculum.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyber.smedu.curriculum.service.CurriculumService;

@Controller
public class CurriculumController {
	
	@Autowired CurriculumService curriculumService;
	
	//교육과정 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/curriculumIntro", method = RequestMethod.GET)
	public String curriculumIntro(Model model) {
		Map<String, Object> map = curriculumService.selectSubjectList();
		model.addAttribute("subjectList", map.get("subjectList"));
		return "smedu/creditbank/curriculum_intro";
	}
}
