package com.cyber.smedu.academiccalendar.repository;

import java.util.List;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.academiccalendar.domain.CardinalDomain;

public interface AcademicCalendarDao {

	List<CardinalDomain> selectCardinalList();

	CardinalDomain selectCardinalDetail(String cardinalCode);

	List<AcademicCalendarDomain> selectAcademicCalendarDetail(String cardinalCode);

}
