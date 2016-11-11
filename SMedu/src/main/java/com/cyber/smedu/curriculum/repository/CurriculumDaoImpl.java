package com.cyber.smedu.curriculum.repository;

import java.util.List;

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
	//과목 조회
	@Override
	public List<SubjectDomain> selectSubjectList() {
		return sqlSession.selectList(NS+".subjectList");
	}
}
