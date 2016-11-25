package com.cyber.smedu.pay.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;
import com.cyber.smedu.pay.domain.PayDomain;
import com.cyber.smedu.user.domain.StudentDomain;

public interface PayDao {

	List<PayDomain> selectStudentPayCardinal(String studentCode);

	List<ClassRegistrationDomain> selectStudentCardinalClassRegistration(Map<String, Object> map);

	List<ClassRegistrationDomain> selectClassregistrationPayHistory(String studentCode);

	List<ClassRegistrationDomain> selectClassregistrationPaySubject(String studentCode);

	List<ClassRegistrationDomain> insertClassregistrationPaySubject(Map<String, Object> map);

	List<ClassRegistrationDomain> updateClassregistrationPaySubject(Map<String, Object> map);

	List<StudentDomain> selectClassregistrationStudentList(Map<String, Object> map);

}
