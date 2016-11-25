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
	@Override
	public List<CardinalDomain> selectOpenSubjectCardinalList() {
		return sqlSession.selectList(NS+".selectOpenSubjectCardinalList");
	}
	@Override
	public List<CardinalDomain> selectCommunityAcademiccalendarList(Map<String, Object> map) {
		return sqlSession.selectList(NS+".selectCommunityAcademiccalendarList", map);
	}
	
	@Override
	public int selectCardinalTotalCount() {
        return sqlSession.selectOne(NS+".selectCardinalTotalCount");
    	}
	
	@Override
	public List<CardinalDomain> selectTodayCardinalList() {
		return sqlSession.selectList(NS+".selectTodayCardinalList");
	}
	//의기
	@Override
	public List<CardinalDomain> selectMainAcademicCalendarList(Map<String, Object> map){
		return sqlSession.selectList(NS+".selectMainAcademicCalendarList", map);
	}
	//현호
	@Override
	public List<CardinalDomain> plannerCardinalList() {
		return sqlSession.selectList(NS+".plannerCardinalList");
	}
	//진호
}
