package com.cyber.smedu.debate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;
import com.cyber.smedu.debate.domain.DebateScoreDomain;
import com.cyber.smedu.debate.service.DebateService;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class DebateController {

	@Autowired
	DebateService debateService;
	
	@Autowired
	OpenSubjectService openSubjectService;
	
	//토론 답변 상세보기
	@RequestMapping(value="/professorStudentDebateResponseDetail")
	public String professorStudentdebateResponseDetail(Model model, String openSubjectCode, 
			String studentCode, GradeDomain gradeDomain) {
		
		System.out.println("01 professorStudentdebateResponseDetail <-- DebateController.java");
		//System.out.println("openSubjectCode : " + openSubjectCode);
		//System.out.println("studentCode : " + studentCode);
		
		model.addAttribute("studentCode", studentCode);
		
		model.addAttribute("professorStudentDebateCommentAndDate", 
				debateService.professorStudentDebateCommentAndDateSelect(openSubjectCode));
		
		model.addAttribute("professorStudentDebateSubjectAndContent", 
				debateService.professorStudentDebateSubjectAndContentSelect(openSubjectCode));
		
		model.addAttribute("debateScoreAndCode", 
				debateService.professorDebateScoreAndCodeSelect(gradeDomain));
				
		return "professor/management/management_debate_response_detail";		
	}
	
	//토론관리를 위한 과목선택
	@RequestMapping(value="/professorSubjectSelectForDebate")
	public String professorSubjectSelectForDebate(Model model, 
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
				
		String professorCode = professorDomain.getProfessorCode();					
		System.out.println("01 professorSubjectSelectForDebate <-- DebateController.java");
		System.out.println("professorCode : " + professorCode);
		
		model.addAttribute("professorSubject", debateService.professorSubjectSelectForDebate(professorCode));
		
		return "professor/management/management_debate_list";
	}
	
	@RequestMapping(value="/professorSubjectSelectForDebate", method=RequestMethod.POST )
	public String professorSubjectSelectForDebate(Model model, String openSubjectCode,
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
				
		String professorCode = professorDomain.getProfessorCode();
		
		model.addAttribute("openSubjectCode", openSubjectCode);
		model.addAttribute("professorSubject", debateService.professorSubjectSelectForDebate(professorCode));
		model.addAttribute("professorDebate", debateService.professorDebateSelect(openSubjectCode));
		
		return "professor/management/management_debate_list";
		
	}

	@RequestMapping(value="/professorDebateUpdate", method=RequestMethod.POST)
	public String professorDebateUpdate(DebateDomain debateDomain) {
		
		System.out.println("01 professorDebateUpdate <-- DebateController.java");
		System.out.println("debateDomain : " + debateDomain);
		
		debateService.professorDebateUpdate(debateDomain);
				
		return "redirect:/professorSubjectSelectForDebate";
		
	}
	
	//교수 토론 등록
	@RequestMapping(value="/professorDebateInsert", method=RequestMethod.POST)
	public String professorDebateInsert(DebateDomain debateDomain) {
		
		System.out.println("01 professorDebateInsert <-- DebateController.java");
		System.out.println("debateDomain : " + debateDomain);

		debateService.professorDebateInsert(debateDomain);
		
		return "redirect:/professorSubjectSelectForDebate";
	}
	
	@RequestMapping(value="/professorDebateMarking", method=RequestMethod.POST)
	public String professorDebateMarking(DebateScoreDomain debateScoreDomain) {
		
		System.out.println("01 professorDebateMarking <-- DebateController.java");
		System.out.println("debateScoreDomain : " + debateScoreDomain);
		
		debateService.debateScoreAndParticipationUpdate(debateScoreDomain);
		debateService.debateMarkingInsert(debateScoreDomain);
		debateService.finalGradeUpdateForDebate(debateScoreDomain);
		
		return "professor/management/close_jsp";
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
		
		//selectbox 고정시키는 값
		model.addAttribute("selectbox", openSubjectCode);		
		
		
		return"student/classroom/classroom_debate_join";
	}
	
	
	////////////////// 11.10 입력

	//토론참여에 해당 과목을 학생이 토론 글쓰기를 눌렀을때 
	@RequestMapping(value="/debateResultAdd", method = RequestMethod.POST)
	public String debateResultAdd(DebateResultDomain debateResultDomain
								,@ModelAttribute(value="userInfo") UserDomain userDomain){
		
		String userCode = userDomain.getUserCode();
		
		debateService.debateResultAdd(userCode,debateResultDomain);
		
		return "redirect:/classroomDebateJoin";
	}
	//장용
}
