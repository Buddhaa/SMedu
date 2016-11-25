package com.cyber.smedu.pay.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;


public interface PayService {

	List<ClassRegistrationDomain> selectClassregistrationPayHistory(String studentCode);

	List<ClassRegistrationDomain> selectClassregistrationPaySubject(String studentCode);

	void updateClassregistrationPaySubject(List<String> classRegistrationCodeList);

	void insertClassregistrationPaySubject(String studentCode, String cardinalCode, List<String> openSubjectCodeList);

}
