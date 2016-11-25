package com.cyber.smedu.pay.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;
import com.cyber.smedu.pay.service.PayService;
import com.cyber.smedu.user.domain.StudentDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class PayController {
	
	@Autowired private PayService payService;
	
	//신청,결제 페이지
	@RequestMapping(value = "/smedu/classregistration/classregistrationPaySubject", method = RequestMethod.GET)
	public String classregistrationPaySubject(Model model,
			@ModelAttribute(value="userPlusInfo") StudentDomain studentDomain){
		String studentCode = studentDomain.getStudentCode();
		List<ClassRegistrationDomain> payHistoryList = payService.selectClassregistrationPaySubject(studentCode);
		model.addAttribute("payHistoryList", payHistoryList);
		return "smedu/classregistration/classregistration_pay_subject";
	}
	//수강신청 입력
	@RequestMapping(value = "/smedu/classregistration/classregistrationPaySubject", method = RequestMethod.POST)
	public String classregistrationPaySubjectInsert(Model model,
			@ModelAttribute(value="userPlusInfo") StudentDomain studentDomain,
			@RequestParam(value="cardinalCode") String cardinalCode,
			@RequestParam(value="openSubjectCode") List<String> openSubjectCodeList){
		String studentCode = studentDomain.getStudentCode();
		payService.insertClassregistrationPaySubject(studentCode,cardinalCode,openSubjectCodeList);
		return "redirect:/smedu/classregistration/classregistrationPaySubject";
	}
	
	//수강신청 취소
	@RequestMapping(value = "/smedu/classregistration/classregistrationPaySubjectDelete", method = RequestMethod.POST)
	public String classregistrationPaySubjectInsert(Model model,
			@RequestParam(value="classRegistrationCode") List<String> classRegistrationCode){
		payService.updateClassregistrationPaySubject(classRegistrationCode);
		return "redirect:/smedu/classregistration/classregistrationPaySubject";
	}
	
	//수강과목 결제페이지 이동
	@RequestMapping(value = "/smedu/classregistration/classregistrationPaySubjectMethod", method = RequestMethod.GET)
	public String classregistrationPaySubjectMethod(Model model){
		return "smedu/classregistration/classregistration_pay_subject_method";
	}
	
	//결제 이력 페이지
	@RequestMapping(value = "/smedu/classregistration/classregistrationPayHistory", method = RequestMethod.GET)
	public String classregistrationPayHistory(Model model,
			@ModelAttribute(value="userPlusInfo") StudentDomain studentDomain){
		String studentCode = studentDomain.getStudentCode();
		List<ClassRegistrationDomain> payHistoryList = payService.selectClassregistrationPayHistory(studentCode);
		model.addAttribute("payHistoryList", payHistoryList);
		return "smedu/classregistration/classregistration_pay_history";
	}
	//현호
}
