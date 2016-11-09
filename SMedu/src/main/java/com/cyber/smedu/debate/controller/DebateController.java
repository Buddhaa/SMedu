package com.cyber.smedu.debate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.debate.service.DebateService;
import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class DebateController {

	@Autowired
	DebateService debateService;
	
	@Autowired
	OpenSubjectService openSubjectService;
	
	@RequestMapping(value="/professorStudentDebateResponseDetail")
	public String professorStudentdebateResponseDetail(Model model, String openSubjectCode, String studentCode) {
		
		System.out.println("01 professorStudentdebateResponseDetail <-- DebateController.java");
		//System.out.println("openSubjectCode : " + openSubjectCode);
		//System.out.println("studentCode : " + studentCode);
		
		model.addAttribute("studentCode", studentCode);
		
		model.addAttribute("professorStudentDebateCommentAndDate", 
				debateService.professorStudentDebateCommentAndDateSelect(openSubjectCode));
		
		model.addAttribute("professorStudentDebateSubjectAndContent", 
				debateService.professorStudentDebateSubjectAndContentSelect(openSubjectCode));
		
		return "professor/management/management_debate_response_detail";
		
	}
	//우영
	
	//토론참여 페이지 이동시
		@RequestMapping(value="/classroomDebateJoin", method = RequestMethod.GET)
		public String classroomDebateJoinView(Model model
											,@ModelAttribute(value="userInfo") UserDomain userDomain
											,@RequestParam(value="openSubjectCode", defaultValue="") String openSubjectCode){
			String userCode = userDomain.getUserCode();
			
			//토론 참여 페이지 이동시 -> 과목선택 가져오기
			model.addAttribute("openSubjectSelect", openSubjectService.classroomAcademicaCtivity(userCode));
			
			//토론 참여 페이지에서 과목 선택시 해당 과목 주제 리스트 받아오기
			model.addAttribute("oneDebateList", debateService.oneDebateList(openSubjectCode));
			
			
			return"student/classroom/classroom_debate_join";
		}
	//장용
}
