package com.cyber.smedu.pay.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;
import com.cyber.smedu.pay.domain.PayDomain;

@Repository
public class PayDaoImpl implements PayDao{
	private String NS = "com.cyber.smedu.mapper.PayMapper";
	@Autowired SqlSessionTemplate sqlSession;
	
	//관리자 학생 성적관리 학생성적 상세보기 학생이 결제한 기수출력
	@Override
	public List<PayDomain> selectStudentPayCardinal(String studentCode) {
		return sqlSession.selectList(NS+".selectStudentPayCardinal", studentCode);
	}
	//관리자 학생 성적관리 학생성적 상세보기 기수 선택시 기수에 해당하는 수강과목 출력
	@Override
	public List<ClassRegistrationDomain> selectStudentCardinalClassRegistration(Map<String, Object> map) {
		return sqlSession.selectList(NS+".selectStudentCardinalClassRegistration", map);
	}
	//의기
	
	//결제이력 페이지
	@Override
	public List<ClassRegistrationDomain> selectClassregistrationPayHistory(String studentCode) {	
		return sqlSession.selectList(NS+".selectClassregistrationPayHistory", studentCode);
	}
	//현호
}