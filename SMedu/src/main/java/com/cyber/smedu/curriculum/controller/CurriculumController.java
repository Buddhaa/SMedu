package com.cyber.smedu.curriculum.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cyber.smedu.curriculum.service.CurriculumService;

@Controller
public class CurriculumController {
	
	@Autowired CurriculumService curriculumService;
	
	//관리자 학과리스트
	@RequestMapping(value = "/admin/curriculum/departmentList")
	public String adminDepartmentList(Model model) {
		Map<String, Object> map = curriculumService.selectDepartmentList();
		model.addAttribute("departmentList", map.get("departmentList"));
		return "admin/curriculum/department_list";
	}
	//관리자 과목리스트
	@RequestMapping(value = "/admin/curriculum/subjectList")
	public String adminSubjectList(Model model,
										@RequestParam(value="departmentCode", defaultValue="")String departmentCode,
										@RequestParam(value="subjectName", defaultValue="")String subjectName,
										@RequestParam(value="subjectState", defaultValue="")String subjectState) {
		Map<String, Object> map = curriculumService.adminSelectSubjectList(departmentCode, subjectName, subjectState);
		model.addAttribute("subjectList", map.get("subjectList"));
		model.addAttribute("departmentList", map.get("departmentList"));
		
		model.addAttribute("departmentCode", departmentCode);
		model.addAttribute("subjectName", subjectName);
		return "admin/curriculum/subject_list";
	}
	//의기
	//교육과정 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/curriculumIntro", method = RequestMethod.GET)
	public String curriculumIntro(Model model) {
		Map<String, Object> map = curriculumService.selectSubjectList();
		model.addAttribute("subjectList", map.get("subjectList"));
		return "smedu/creditbank/curriculum_intro";
	}
	//현호
}