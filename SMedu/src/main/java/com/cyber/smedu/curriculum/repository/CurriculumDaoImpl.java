package com.cyber.smedu.curriculum.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.curriculum.domain.DepartmentDomain;
import com.cyber.smedu.curriculum.domain.SubjectDomain;

@Repository
public class CurriculumDaoImpl implements CurriculumDao {
	private String NS = "com.cyber.smedu.mapper.CurriculumMapper";
	@Autowired SqlSessionTemplate sqlSession;
	
	//학과 리스트 출력
	@Override
	public List<DepartmentDomain> selectDepartmentList() {
		return sqlSession.selectList(NS+".selectDepartmentList");
	}
	//학과 출력
	@Override
	public DepartmentDomain selectDepartmentOne(String departmentCode) {
		return sqlSession.selectOne(NS+".selectDepartmentOne", departmentCode);
	}
	//관리자 과목 조회
	@Override
	public List<SubjectDomain> adminSelectSubjectList(Map<String, Object> map) {
		return sqlSession.selectList(NS+".adminSubjectList", map);
	}
	//과목 조회
	@Override
	public List<SubjectDomain> selectSubjectList() {
		return sqlSession.selectList(NS+".subjectList");
	}
	//과목 상세보기
	@Override
	public SubjectDomain subjectSelectInfo(String subjectCode) {	
		return sqlSession.selectOne(NS+".subjectSelectInfo", subjectCode);
	}
}
