package com.cyber.smedu.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cyber.smedu.academiccalendar.service.AcademicCalendarService;
import com.cyber.smedu.board.service.BoardService;

@Controller
public class PageController {
	@Autowired BoardService boardService;
	@Autowired AcademicCalendarService academicCalendarService;	
	
	//메인 페이지 이동
	@RequestMapping(value = "/smedu/main/main", method = RequestMethod.GET)
	public String main(Model model) {
		model.addAttribute("communityNoticeList", boardService.mainCommunityNoticeList());
		model.addAttribute("communityLectureReviewList", boardService.mainCommunityLectureReviewList());
		model.addAttribute("selectMainAcademicCalendarList", academicCalendarService.selectMainAcademicCalendarList());
		return "smedu/main/main";
	}
	
	//main폴더 -> 이용약관,개인정보 보호 페이지
	//이용약관 페이지 이동
	@RequestMapping(value = "/smedu/main/agreement", method = RequestMethod.GET)
	public String agreement() {
		return "smedu/main/agreement";
	}
	
	//개인정보 보호 페이지 이동
	@RequestMapping(value = "/smedu/main/personalInformation", method = RequestMethod.GET)
	public String personalInformation() {
		return "smedu/main/personal_information";
	}
	
	//introduction폴더 -> 프로젝트 소개, 교육원 소개, 찾아오시는 길, 사이트 맵 페이지
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
	/*
	creditbank폴더 -> 학점은행제란?, 학점인정절차, 학습자등록, 학점인정신청, 학위수여, 평가인정학습과목,
	독학학위제, 학점인정주의사항, 관련법규, 오리엔테이션, 강의수강방법, 출석률확인방법 페이지 
	*/
	//학점은행제란? 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankIntro", method = RequestMethod.GET)
	public String creditbankIntro() {
		return "smedu/creditbank/creditbank_intro";
	}
	
	//학점인정절차 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankProcedure", method = RequestMethod.GET)
	public String creditbankProcedure() {
		return "smedu/creditbank/creditbank_procedure";
	}
	
	//학습자등록 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankLearneradd", method = RequestMethod.GET)
	public String creditbankLearneradd() {
		return "smedu/creditbank/creditbank_learneradd";
	}
	
	//학점인정신청 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankCreditadd", method = RequestMethod.GET)
	public String creditbankCreditadd() {
		return "smedu/creditbank/creditbank_creditadd";
	}
	
	//학위수여 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankCommencement", method = RequestMethod.GET)
	public String creditbankCommencement() {
		return "smedu/creditbank/creditbank_commencement";
	}
	
	//평가인정학습과목 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankRecognitionSubject", method = RequestMethod.GET)
	public String creditbankRecognitionSubject() {
		return "smedu/creditbank/creditbank_recognition_subject";
	}
	
	//독학학위제 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankSelfEducation", method = RequestMethod.GET)
	public String creditbankSelfEducation() {
		return "smedu/creditbank/creditbank_self_education";
	}	
	
	//학점인정주의사항 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankPrecaution", method = RequestMethod.GET)
	public String creditbankPrecaution() {
		return "smedu/creditbank/creditbank_precaution";
	}
	
	//관련법규 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankRegulation", method = RequestMethod.GET)
	public String creditbankRegulation() {
		return "smedu/creditbank/creditbank_regulation";
	}
	
	//오리엔테이션 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankOrientation", method = RequestMethod.GET)
	public String creditbankOrientation() {
		return "smedu/creditbank/creditbank_orientation";
	}
	
	//강의수강방법 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankLectureWay", method = RequestMethod.GET)
	public String creditbankLectureWay() {
		return "smedu/creditbank/creditbank_lecture_way";
	}
	
	//출석률확인방법 페이지 이동
	@RequestMapping(value = "/smedu/creditbank/creditbankAttendWay", method = RequestMethod.GET)
	public String creditbankAttendWay() {
		return "smedu/creditbank/creditbank_attend_way";
	}
	//컴퓨터공학과란 페이지 이동
	@RequestMapping(value = "/smedu/curriculum/curriculumComputer", method = RequestMethod.GET)
	public String curriculumComputer() {
		return "smedu/curriculum/curriculum_computer";
	}
		
	//정보통신학과란 페이지 이동
	@RequestMapping(value = "/smedu/curriculum/curriculumCommunication", method = RequestMethod.GET)
	public String curriculumCommunication() {
		return "smedu/curriculum/curriculum_communication";
	}
	
	//정보보안학과란 페이지 이동
	@RequestMapping(value = "/smedu/curriculum/curriculumSecurity", method = RequestMethod.GET)
	public String curriculumSecurity() {
		return "smedu/curriculum/curriculum_security";
	}
	/*현호--------------------------------------------------------------------------------------*/
}