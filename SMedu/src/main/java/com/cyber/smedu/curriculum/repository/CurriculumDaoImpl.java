package com.cyber.smedu.curriculum.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.curriculum.domain.DepartmentDomain;

@Repository
public class CurriculumDaoImpl implements CurriculumDao {
	private String NS = "com.cyber.smedu.mapper.CurriculumMapper";
	@Autowired SqlSessionTemplate sqlSession;
	
	//학과 리스트 출력
	@Override
	public List<DepartmentDomain> selectDepartmentList() {
		return sqlSession.selectList(NS+".selectDepartmentList");
	}
}
