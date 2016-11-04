package com.cyber.smedu.grade.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Repository
public class GradeDaoImpl implements GradeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NS = "com.cyber.smedu.mapper.GradeMapper";
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelect(String professorCode) {
		
		System.out.println("03 professorSubjectSelect <-- GradeDaoImpl.java");
		
		return sqlSessionTemplate.selectList(NS+".professorSubjectSelect", professorCode);
		
	}
	
	@Override
	public List<UserDomain> professorStudentInfoSelect(String openSubjectCode) {
		
		System.out.println("03 professorStudentInfoSelect <-- GradeDaoImpl.java");
		System.out.println("openSubjectCode : " + openSubjectCode);
		
		return sqlSessionTemplate.selectList(NS+".professorStudentInfoSelect", openSubjectCode);
		
	}
	
	@Override
	public List<GradeDomain> professorStudentGradeSelect(String userCode) {
		
		System.out.println("03 professorStudentGradeSelect <-- GradeDaoImpl.java");
		System.out.println("userCode : " + userCode);
		
		return sqlSessionTemplate.selectList(NS+".professorStudentGradeSelect", userCode);
	}
}
