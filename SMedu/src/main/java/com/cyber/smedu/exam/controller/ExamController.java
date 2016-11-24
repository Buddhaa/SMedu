package com.cyber.smedu.exam.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.cyber.smedu.exam.domain.ExamQuestionsDomain;
import com.cyber.smedu.exam.domain.TestPaperDomain;
import com.cyber.smedu.exam.service.ExamService;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class ExamController {

	@Autowired
	ExamService examService;
	@Autowired
	OpenSubjectService openSubjectService;
	
	//과목선택 폼
	@RequestMapping(value="/professorSubjectSelectForExam")
	public String professorSubjectSelectForExam(Model model,
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
			
		String professorCode = professorDomain.getProfessorCode();
		
		System.out.println("01 professorSubjectSelectForExam <-- ExamController.java");
		//System.out.println("professorCode : " + professorCode);
		
		model.addAttribute("professorSubject", examService.professorSubjectSelectForExam(professorCode));
		model.addAttribute("questionsNo", examService.examQuestionsNo());	
		return "professor/management/management_test_list";
	}
	
	//시험문제 등록, 조회 선택 폼
	@RequestMapping(value="/professorSubjectSelectForExam", method=RequestMethod.POST)
	public String professorSubjectSelectForExam(Model model, String openSubjectCode,
			@ModelAttribute(value="userPlusInfo")ProfessorDomain professorDomain) {
				
		String professorCode = professorDomain.getProfessorCode();
		
		//System.out.println("openSubjectCode : " + openSubjectCode);
		
		model.addAttribute("openSubjectCode", openSubjectCode);
		model.addAttribute("professorSubject", examService.professorSubjectSelectForExam(professorCode));
		model.addAttribute("professorExam", examService.professorExamSelect(openSubjectCode));
/*		model.addAttribute("midAcademicCalendarCode", examService.midAcademicCalendarCodeSelect(openSubjectCode));
		model.addAttribute("lastAcademicCalendarCode", examService.lastAcademicCalendarCodeSelect(openSubjectCode));
		model.addAttribute("questionsNo", examService.examQuestionsNo());*/
		
		return "professor/management/management_test_list";
	}
	
	//시험문제 등록 폼
	@RequestMapping(value="/examQuestionInsertView")
	public String examQuestionInsertView(Model model, String openSubjectCode) {
		
		//System.out.println(openSubjectCode);
		
		model.addAttribute("midAcademicCalendarCode", examService.midAcademicCalendarCodeSelect(openSubjectCode));
		model.addAttribute("lastAcademicCalendarCode", examService.lastAcademicCalendarCodeSelect(openSubjectCode));
		model.addAttribute("questionsNo", examService.examQuestionsNo());
		
		return "professor/management/management_test_insert";
	}
	
	//시험문제 등록 처리
	@RequestMapping(value="/examQuestionInsert", method=RequestMethod.POST)
	public String examQuestionInsert(MultipartHttpServletRequest request,
				ExamQuestionsDomain examQuestionsDomain) throws IllegalStateException, IOException {
		
		String openSubjectCode = examQuestionsDomain.getOpenSubjectCode();
		//System.out.println("01 openSubjectCode ----> " + openSubjectCode);
		
		Map<String, MultipartFile> files = request.getFileMap();
		
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("examQuestionFile");
		
		System.out.println("examQuestionsDomain ---->" + examQuestionsDomain);
		
		// upload file save path 서버 배포용
		String savePath =request.getSession().getServletContext().getRealPath("/") +"resources/examQuestionUpload/"+cmf.getOriginalFilename();
		
		/*// upload file save path 개인 테스트용
		String savePath =request.getSession().getServletContext().getRealPath("/") +"resources/examQuestionUpload/"+cmf.getOriginalFilename();*/
		
		File file = new File(savePath);
		// 파일 업로드 처리 완료.
		cmf.transferTo(file);
		
		examService.examQuestionInsert(examQuestionsDomain, cmf);
		
		
		return "redirect:/examQuestionInsertView?openSubjectCode="+openSubjectCode+"";
		
	}
	
	//중간고사 시험문제 상세보기
	@RequestMapping(value="/midExamQuestionDetail")
	public String midExamQuestionDetail(Model model, String openSubjectCode) {
		
		System.out.println("01 midExamQuestionDetail <-- ExamController.java");
		System.out.println("openSubjectCode : " + openSubjectCode);
		
		model.addAttribute("midExamQuestion", examService.midExamQuestionDetail(openSubjectCode));
		examService.midExamQuestionDetail(openSubjectCode).get(0);
		System.out.println("---------------------------------------------------------------------------");
		System.out.println(examService.midExamQuestionDetail(openSubjectCode).get(0));
		System.out.println(examService.midExamQuestionDetail(openSubjectCode).get(1));
		
		return "professor/management/management_mid_test_detail";
		
	}
	
	//기말고사 시험문제 상세보기
	@RequestMapping(value="/finalExamQuestionDetail")
	public String finalExamQuestionDetail(Model model, String openSubjectCode) {
		
		System.out.println("01 finalExamQuestionDetail <-- ExamController.java");
		System.out.println("openSubjectCode : " + openSubjectCode);
		
		model.addAttribute("finalExamQuestion", examService.finalExamQuestionDetail(openSubjectCode));
			
		return "professor/management/management_final_test_detail";
		
	}
	//우영
	
	// -- 수정 --//
	
	//시험응시 버튼을 클릭시
	@RequestMapping(value="/classroomExam", method=RequestMethod.GET)
	public String examList(Model model
								,@ModelAttribute(value="userInfo" ) UserDomain userDomain
								,@RequestParam(value="openSubjectCode") String openSubjectCode
								,@RequestParam(value="lectureCode") String lectureCode){
		
		String userCode = userDomain.getUserCode();
		
		model.addAttribute("examList", examService.examList(lectureCode));
		model.addAttribute("examOpenSubjectList", openSubjectService.examOpenSubjectList(openSubjectCode,lectureCode));
		model.addAttribute("examCheck",examService.examCheck(userCode,openSubjectCode,lectureCode));
		
		return"student/classroom/classroom_exam";
	}
	
	//학생이 시험문제를 풀고 답안 제출을 할 경우
	@RequestMapping(value="/answerPaperAdd", method=RequestMethod.GET)
	public String answerPaperAdd(@ModelAttribute(value="userInfo" ) UserDomain userDomain
								,@RequestParam(value="testPaperCode") String testPaperCode
								,@RequestParam(value="attendCode") String attendCode
								,@RequestParam(value="score", required=true) List<String> score
								,@RequestParam(value="examQuestionCode", required=true) List<String> examQuestionCode){
		String userCode = userDomain.getUserCode();
		
		System.out.println(testPaperCode);
		System.out.println(attendCode);
		System.out.println(score);
		System.out.println(examQuestionCode);
		
		examService.answerPaperAdd(attendCode, userCode, testPaperCode, score, examQuestionCode);
		
		return"student/classroom/close";
		
	}
	//장용
}
	

