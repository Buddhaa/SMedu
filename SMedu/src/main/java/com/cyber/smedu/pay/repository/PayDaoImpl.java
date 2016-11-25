package com.cyber.smedu.pay.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;
import com.cyber.smedu.pay.domain.PayDomain;
import com.cyber.smedu.user.domain.StudentDomain;

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
	
	//수강신청 결제 페이지
	@Override
	public List<ClassRegistrationDomain> selectClassregistrationPaySubject(String studentCode) {	
		return sqlSession.selectList(NS+".selectClassregistrationPaySubject", studentCode);
	}
	
	//수강신청쳐리
	@Override
	public List<ClassRegistrationDomain> insertClassregistrationPaySubject(Map<String, Object> map) {	
		return sqlSession.selectList(NS+".insertClassregistrationPaySubject", map);
	}
	
	//결제취소 
	@Override
	public List<ClassRegistrationDomain> updateClassregistrationPaySubject(Map<String, Object> map) {	
		return sqlSession.selectList(NS+".updateClassregistrationPaySubject", map);
	}
	//현호
	
	//플래너 담당학생관리 리스트
	@Override
	public List<StudentDomain> selectClassregistrationStudentList(Map<String, Object> map) {	
		return sqlSession.selectList(NS+".selectClassregistrationStudentList", map);
	}
	
	//진호
}