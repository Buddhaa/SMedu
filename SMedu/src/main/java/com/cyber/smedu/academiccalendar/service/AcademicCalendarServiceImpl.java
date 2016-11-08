package com.cyber.smedu.academiccalendar.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyber.smedu.academiccalendar.repository.AcademicCalendarDao;

@Transactional
@Service
public class AcademicCalendarServiceImpl implements AcademicCalendarService{
	@Autowired AcademicCalendarDao academicCalendarDao;
	
	@Override
	public Map<String, Object> selectCardinalList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cardinalList", academicCalendarDao.selectCardinalList());
		return map;
	}
	@Override
	public Map<String, Object> selectCardinalDetail(String cardinalCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cardinal", academicCalendarDao.selectCardinalDetail(cardinalCode));
		map.put("academicCalendarList", academicCalendarDao.selectAcademicCalendarDetail(cardinalCode));
		return map;
	}
}
