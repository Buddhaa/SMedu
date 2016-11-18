package com.cyber.smedu.pay.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;
import com.cyber.smedu.pay.service.PayService;
import com.cyber.smedu.user.domain.StudentDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class PayController {
	
	@Autowired private PayService payService;
	
	//신청/결제 페이지
	@RequestMapping(value = "/smedu/classregistration/classregistrationPaySubject", method = RequestMethod.GET)
	public String classregistrationPaySubject() {
		return "smedu/classregistration/classregistration_pay_subject";
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
}
