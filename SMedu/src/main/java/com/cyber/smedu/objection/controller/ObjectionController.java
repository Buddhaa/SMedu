package com.cyber.smedu.objection.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.board.service.BoardService;
import com.cyber.smedu.objection.domain.ObjectionDomain;
import com.cyber.smedu.objection.service.ObjectionService;
import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class ObjectionController {
	
	@Autowired
	OpenSubjectService openSubjectService;
	
	@Autowired
	ObjectionService objectionService;
	
	@Autowired
	BoardService boardService;
	
	//성적이의신청을 위한 담당개설과목 선택 화면으로 이동
	@RequestMapping(value="/professorSubjectSelectForObjection")
	public String professorSubjectSelectForObjection(
			Model model, 
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain ) {
				
		//System.out.println("01 professorSubjectSelectForObjection <-- ObjectionController.java");
		
		String professorCode = professorDomain.getProfessorCode();
		//System.out.println("professorCode : " + professorCode);
		
		model.addAttribute("professorSubject", objectionService.professorSubjectSelectForObjection(professorCode));
		
		return "professor/management/management_grade_objection";
	}
	
	//해당과목의 학생 성적이의신청 정보를 보여줌
	@RequestMapping(value="/professorStudentObjectionSelect")
	public String professorStudentObjectionSelect(
			Model model, String openSubjectCode, String searchWord,
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
		
		//System.out.println("01 professorStudentObjectionSelect <-- ObjectionController.java");
		
		String professorCode = professorDomain.getProfessorCode();
		
/*		System.out.println("openSubjectCode : " + openSubjectCode );
		System.out.println("searchWord : " + searchWord);
		System.out.println("professorCode : " + professorCode);*/
		
		//searchWord
		//model.addAttribute("searchWord", searchWord);
		//openSubjectCode
		model.addAttribute("openSubjectCode", openSubjectCode);
		//교수담당과목 정보
		model.addAttribute("professorSubject", objectionService.professorSubjectSelectForObjection(professorCode));		
		//성적이의신청 정보
		model.addAttribute("professorStudentObjectionInfo", objectionService.professorStudentObjectionInfoSelect(openSubjectCode, searchWord));
		
		return "professor/management/management_grade_objection";	
	}
	
	//답변 미처리된 성적이의신청 상세보기
	@RequestMapping(value="/professorStudentObjectionDetail")
	public String professorStudentObjectionDetail(Model model, String objectionCode) {
		
		//System.out.println("01 professorStudentObjectionDetail <-- ObjectionController.java");
		//System.out.println("objectionCode : " + objectionCode);
		
		model.addAttribute("professorStudentObjection", objectionService.professorStudentObjectionDetail(objectionCode));
		
		
		return "professor/management/management_objection_update";
		
	}
	
	//답변완료된 성적이의신청 상세보기
	@RequestMapping(value="/professorStudentObjectionReplyDetail")
	public String professorStudentObjectionReplyDetail(Model model, String objectionCode) {
		
		System.out.println("01 professorStudentObjectionReplyDetail <-- ObjectionController.java");
		System.out.println("objectionCode : " + objectionCode);
		
		model.addAttribute("StudentObjectionReply", objectionService.professorStudentObjectionReplyDetail(objectionCode));
		
		return "professor/management/management_objection_update_complete";	
	}
	
	//학생 이의신청에 답변 update
	@RequestMapping(value="/professorStudentObjectionReply", method = RequestMethod.POST)
	public String professorStudentObjectionReply(ObjectionDomain objectionDomain) {
		

		String objectionCode = objectionDomain.getObjectionCode();
		String objectionReply = objectionDomain.getObjectionReply();
		
		System.out.println("objectionCode : " + objectionCode);
		System.out.println("objectionReply : " + objectionReply);
		
		System.out.println("01 professorStudentObjectionReply <-- ObjectionController.java");

		
		objectionService.professorStudentObjectionReply(objectionDomain);
			
		return "professor/management/close_jsp";
		
	}
	//우영
	//학생이 성적이의신청 페이지 이동 
	@RequestMapping(value = "/classroomObjection", method = RequestMethod.GET)
	public String ObjectionView(Model model
								,@ModelAttribute(value="userInfo") UserDomain userDomain){
		
		String userCode = userDomain.getUserCode();
		
		model.addAttribute("oneObjectionView", objectionService.objectionView(userCode));
	
		
		return "student/classroom/classroom_objection";		
	}	
	
	
	//학생이 성적이의신청 페이지에서 글쓰기 페이지 이동시
	@RequestMapping(value="/objectionInsert",method=RequestMethod.GET)
	public String objectionInsert(Model model
								,@ModelAttribute(value="userInfo") UserDomain userDomain){
		String userCode = userDomain.getUserCode();

		//나의 과목 리스트
		model.addAttribute("openSubjectSelect", openSubjectService.classroomAcademicaCtivity(userCode));
		
		
		return "student/classroom/classroom_objection_insert";
	}	
	
	
	//////////////////11.11 입력
	
	
	@RequestMapping(value="/objectionAdd", method=RequestMethod.POST)
	public String objectionAdd(ObjectionDomain objectionDomain
							,@ModelAttribute(value="userInfo") UserDomain userDomain){
	
		String userCode = userDomain.getUserCode();
		
		
		//성적이의신청 등록처리
		objectionService.objectionAdd(userCode,objectionDomain);
		
		return "redirect:/classroomObjection";		
	}	
	

	
	
	//////////////////11.14 입력

	//학생이 이의신청 글을 상세보기를 할때 
	@RequestMapping(value="/objectionDetail", method=RequestMethod.GET)
	public String objectionDetail(Model model
								,@RequestParam(value="objectionCode")String objectionCode){
		
		model.addAttribute("objectionList", objectionService.objectionDetail(objectionCode));
		
		return "student/classroom/classroom_objection_detail";
	}
	//장용
	
}
