package com.cyber.smedu.stats.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cyber.smedu.board.service.BoardService;
import com.cyber.smedu.stats.service.StatsService;

@Controller
public class StatsController {
	@Autowired BoardService boardService;
	@Autowired StatsService statsService;
	
	//관리자 메인 페이지 맵핑
	@RequestMapping(value = "/admin/main/main", method = RequestMethod.GET)
	public String adminMain(Model model) {
		Map<String, Object> map = statsService.adminMain();
		model.addAttribute("todayCount", map.get("todayCount")); //오늘 방문자 수
		model.addAttribute("totalCount", map.get("totalCount")); //총 방문자 수
		model.addAttribute("monthStudentCount", map.get("monthStudentCount")); //이번 달 가입 학생수
		model.addAttribute("monthStudentPay", map.get("monthStudentPay")); //이번 달 학생 수강신청 총 결제금액
		model.addAttribute("recentlyUserList", map.get("recentlyUserList")); //최근가입자 목록
		model.addAttribute("studentKnowPathPercent", map.get("studentKnowPathPercent")); //학생가입자 유입경로 백분율 통계
		return "admin/main/main2";
	}
}