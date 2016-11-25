package com.cyber.smedu.grade.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.grade.domain.FinalGradeDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Repository
public class GradeDaoImpl implements GradeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NS = "com.cyber.smedu.mapper.GradeMapper";
	
	//관리자 학생성적관리 총이수성적
	@Override
	public List<FinalGradeDomain> adminStudentFinalGrade(String studentCode) {
				
		return sqlSessionTemplate.selectList(NS+".adminStudentFinalGrade", studentCode);
		
	}
	//관리자 학생성적관리 수강과목 선택시 해당 수강과목 성적출력
	@Override
	public List<GradeDomain> adminStudentSubjectGrade(Map<String, Object> map) {
				
		return sqlSessionTemplate.selectList(NS+".adminStudentSubjectGrade", map);
		
	}
	
	/*의기--------------------------------------------------------------------------------------------------------*/
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForCheck(String professorCode) {
		
		//System.out.println("03 professorSubjectSelectForCheck <-- GradeDaoImpl.java");
		
		return sqlSessionTemplate.selectList(NS+".professorSubjectSelect", professorCode);
		
	}
	
	@Override
	public List<UserDomain> professorStudentInfoSelect(Map<String, Object> map) {
		
		//System.out.println("03 professorStudentInfoSelect <-- GradeDaoImpl.java");
		//System.out.println("openSubjectCode : " + openSubjectCode);
		
		return sqlSessionTemplate.selectList(NS+".professorStudentInfoSelect", map);
		
	}
	
	@Override
	public List<GradeDomain> professorStudentGradeSelect(String userCode) {
		
		System.out.println("03 professorStudentGradeSelect <-- GradeDaoImpl.java");
		//System.out.println("userCode : " + userCode);
		
		return sqlSessionTemplate.selectList(NS+".professorStudentGradeSelect", userCode);
	}
	
	@Override
	public FinalGradeDomain professorStudentFinalGradeSelect(String userCode) {
		
		System.out.println("03 professorStudentFinalGradeSelect <-- GradeDaoImpl.java");
		
		sqlSessionTemplate.selectOne(NS+".professorStudentFinalGradeSelect", userCode);
		
		return sqlSessionTemplate.selectOne(NS+".professorStudentFinalGradeSelect", userCode);
		
	}
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForManage(String professorCode) {
		
		System.out.println("03 professorSubjectSelectForManage <-- GradeDaoImpl.java");
		
		return sqlSessionTemplate.selectList(NS+".professorSubjectSelect", professorCode);
		
	}
	
	@Override
	public List<StudentDomain> professorStudentNameAndCodeSelect(Map<String, Object> map) {
		
		System.out.println("03 professorStudentNameAndCodeSelect <-- GradeDaoImpl.java");
		
		return sqlSessionTemplate.selectList(NS+".professorStudentNameAndCodeSelect", map);
	}
	/*우영--------------------------------------------------------------------------------------------------------*/
	//회원의 학생코드 받기
	@Override
	public StudentDomain studentCode(String userCode) {		
		
		return sqlSessionTemplate.selectOne(NS+".studentSelectOne", userCode);
	}

	
	@Override
	public List<FinalGradeDomain> finalResultGrade(String studentCode) {
		
		return sqlSessionTemplate.selectList(NS+".finalResultGrade", studentCode);
	}

	//해당 학생의과목 출석률, 과제, 토론, 시험, 총성적 받아오기
	@Override
	public List<GradeDomain> creditManage(String studentCode) {
		
		return sqlSessionTemplate.selectList(NS+".creditManage", studentCode);
	}
	/*장용-----------------------------------------------------------------------------------------*/
	
}
