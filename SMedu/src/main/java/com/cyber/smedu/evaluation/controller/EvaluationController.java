package com.cyber.smedu.evaluation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.evaluation.service.EvaluationService;
import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class EvaluationController {
	@Autowired
	OpenSubjectService openSubjectService;
	
	@Autowired
	EvaluationService evaluationService;
	
	
	//////////////////11.10 입력
	
	//강의평가 페이지로 이동
	@RequestMapping(value="/classroomLectureEvaluationList",method=RequestMethod.GET)
	public String lectureEvaluationList(Model model
										,@ModelAttribute(value="userInfo") UserDomain userDomain
										,@RequestParam(value="openSubjectCode", defaultValue="") String openSubjectCode){
		
		String userCode = userDomain.getUserCode();
		
		//학생의 강의평가 페이지 이동 -> 과목선택 가져오기
		model.addAttribute("openSubjectSelect", openSubjectService.classroomAcademicaCtivity(userCode));
		
		if(!openSubjectCode.equals("")){
			//학생의 강의평가 페이지에서 과목을 선택시
			model.addAttribute("lectureEvaluationItemsList",evaluationService.lectureEvaluationItemsList());
			
			//학생이 해당과목을 평가를 했는지 확인
			model.addAttribute("lectureEvaluationCheck", evaluationService.lectureEvaluationCheck(userCode, openSubjectCode));
		}
		
		//selectbox 고정시키는 값
		model.addAttribute("selectbox", openSubjectCode);
	
		return "/student/classroom/classroom_lecture_evaluation_list";
	}
	
	//////////////////11.14 입력
	
	//강의평가 처리
	@RequestMapping(value="/evaluationAdd", method=RequestMethod.GET)
	public String evaluationAdd(@RequestParam(value="score", required=true) List<String> score
								,@RequestParam(value="item", required=true) List<String> item
								,@RequestParam(value="openSubjectCode") String openSubjectCode
								,@ModelAttribute(value="userInfo") UserDomain userDomain){
		
		
		String userCode = userDomain.getUserCode();
	
		evaluationService.evaluationAdd(userCode, score, item, openSubjectCode);
		
		return "redirect:/classroomLectureEvaluationList";
	}
	
}	
