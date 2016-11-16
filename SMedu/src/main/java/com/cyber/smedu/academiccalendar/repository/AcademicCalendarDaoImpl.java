package com.cyber.smedu.academiccalendar.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.academiccalendar.domain.CardinalDomain;

@Repository
public class AcademicCalendarDaoImpl implements AcademicCalendarDao{
	
	private String NS = "com.cyber.smedu.mapper.AcademicCalendarMapper";
	@Autowired SqlSessionTemplate sqlSession;
			
	@Override
	public List<CardinalDomain> selectCardinalList() {
		return sqlSession.selectList(NS+".selectCardinalList");
	}
	@Override
	public CardinalDomain selectCardinalDetail(String cardinalCode) {
		return sqlSession.selectOne(NS+".selectCardinalDetail", cardinalCode);
	}
	@Override
	public List<AcademicCalendarDomain> selectAcademicCalendarDetail(String cardinalCode) {
		return sqlSession.selectList(NS+".selectAcademicCalendarDetail", cardinalCode);
	}
	@Override
	public AcademicCalendarDomain adminStudentGradeTestAcademicCalendarCodeSelect(Map<String, Object> map) {
		return sqlSession.selectOne(NS+".adminStudentGradeTestAcademicCalendarCodeSelect", map);
	}
}
