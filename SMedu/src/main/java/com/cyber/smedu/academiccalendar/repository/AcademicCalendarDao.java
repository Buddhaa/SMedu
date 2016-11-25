package com.cyber.smedu.academiccalendar.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.academiccalendar.domain.CardinalDomain;

public interface AcademicCalendarDao {

	List<CardinalDomain> selectCardinalList();

	CardinalDomain selectCardinalDetail(String cardinalCode);

	List<AcademicCalendarDomain> selectAcademicCalendarDetail(String cardinalCode);

	AcademicCalendarDomain adminStudentGradeTestAcademicCalendarCodeSelect(Map<String, Object> map);

	List<CardinalDomain> selectCommunityAcademiccalendarList(Map<String, Object> map);

	int selectCardinalTotalCount();

	List<CardinalDomain> selectTodayCardinalList();

	List<CardinalDomain> selectOpenSubjectCardinalList();

	List<CardinalDomain> selectMainAcademicCalendarList(Map<String, Object> map);

	List<CardinalDomain> plannerCardinalList();

}
