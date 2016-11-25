package com.cyber.smedu.pay.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;
import com.cyber.smedu.pay.repository.PayDao;
import com.cyber.smedu.user.domain.StudentDomain;

@Service
public class PayServiceImpl implements PayService{
	@Autowired private PayDao payDao;
	
	//수강,결제 페이지 
	@Override
	public List<ClassRegistrationDomain> selectClassregistrationPaySubject(String studentCode) {
		return  payDao.selectClassregistrationPaySubject(studentCode);
	}
	
	//수강신청 취소
	@Override
	public void updateClassregistrationPaySubject(List<String> classRegistrationCodeList) {
		Map<String, Object> map = new HashMap<String, Object>();
		for(String classRegistrationCode :  classRegistrationCodeList){
			map.put("classRegistrationCode", classRegistrationCode);
			payDao.updateClassregistrationPaySubject(map);
		} 
	}
	
	//수강신청처리
	@Override
	public void insertClassregistrationPaySubject(String studentCode, String cardinalCode, List<String> openSubjectCodeList){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("studentCode", studentCode);
		map.put("cardinalCode", cardinalCode);
		for(String openSubjectCode :  openSubjectCodeList){
			map.put("openSubjectCode", openSubjectCode);
			payDao.insertClassregistrationPaySubject(map);
		} 
	}
	
	//결제이력페이지 
	@Override
	public List<ClassRegistrationDomain> selectClassregistrationPayHistory(String studentCode) {
		return  payDao.selectClassregistrationPayHistory(studentCode);
	}
}
