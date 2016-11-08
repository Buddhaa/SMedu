package com.cyber.smedu.academiccalendar.service;

import java.util.Map;

public interface AcademicCalendarService {

	Map<String, Object> selectCardinalList();

	Map<String, Object> selectCardinalDetail(String cardinalCode);

}
