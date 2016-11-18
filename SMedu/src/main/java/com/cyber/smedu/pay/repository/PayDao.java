package com.cyber.smedu.pay.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;
import com.cyber.smedu.pay.domain.PayDomain;

public interface PayDao {

	List<PayDomain> selectStudentPayCardinal(String studentCode);

	List<ClassRegistrationDomain> selectStudentCardinalClassRegistration(Map<String, Object> map);

	List<ClassRegistrationDomain> selectClassregistrationPayHistory(String studentCode);

}
