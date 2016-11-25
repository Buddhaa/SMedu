package com.cyber.smedu.academiccalendar.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;

public interface AcademicCalendarService {

	Map<String, Object> selectCardinalList();

	Map<String, Object> selectCardinalDetail(String cardinalCode);

	List<CardinalDomain> selectCommunityAcademiccalendarList(int page);

	int getLastPage();

	List<CardinalDomain> selectMainAcademicCalendarList();

}
