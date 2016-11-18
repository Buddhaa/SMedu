package com.cyber.smedu.pay.service;

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
	
	@Override
	public List<ClassRegistrationDomain> selectClassregistrationPayHistory(String studentCode) {
		return  payDao.selectClassregistrationPayHistory(studentCode);
	}
}
