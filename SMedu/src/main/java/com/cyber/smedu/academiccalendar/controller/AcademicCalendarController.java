package com.cyber.smedu.academiccalendar.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyber.smedu.academiccalendar.service.AcademicCalendarService;

@Controller
public class AcademicCalendarController {
	
	@Autowired AcademicCalendarService academicCalendarService;
	//관리자 기수일정 등록폼
	@RequestMapping(value="/admin/academicCalendar/insertForm", method= RequestMethod.GET)
	public String adminaAademicCalendarInsertForm() {
		
		return "admin/academiccalendar/academiccalendar_insert";
	}
	//관리자 기수일정 리스트
	@RequestMapping(value="/admin/academicCalendar/list", method= RequestMethod.GET)
	public String adminaAademicCalendarList(Model model) {
		Map<String, Object> map = academicCalendarService.selectCardinalList();
		model.addAttribute("cardinalList", map.get("cardinalList"));
		return "admin/academiccalendar/academiccalendar_list";
	}
	//관리자 기수일정 상세보기
	@RequestMapping(value="/admin/academicCalendar/detail", method= RequestMethod.GET)
	public String adminaAademicCalendarDetail(Model model, String cardinalCode) {
		Map<String, Object> map = academicCalendarService.selectCardinalDetail(cardinalCode);
		model.addAttribute("cardinal", map.get("cardinal"));
		model.addAttribute("academicCalendarList", map.get("academicCalendarList"));
		return "admin/academiccalendar/academiccalendar_detail";
	}
}
