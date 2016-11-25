package com.cyber.smedu.academiccalendar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.academiccalendar.repository.AcademicCalendarDao;
import com.cyber.smedu.helper.HelperPaging;

@Transactional
@Service
public class AcademicCalendarServiceImpl implements AcademicCalendarService{
	@Autowired AcademicCalendarDao academicCalendarDao;
	private final int LINE_PER_PAGE = 10;
	
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
	//의기
	
	//게시판 학사일정
	@Override
	public List<CardinalDomain> selectCommunityAcademiccalendarList(int page) {
		HelperPaging helperPaging = new HelperPaging(page,LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("helperPaging", helperPaging);
		List<CardinalDomain> selectCommunityAcademiccalendarList = academicCalendarDao.selectCommunityAcademiccalendarList(map);
		map.put("selectCommunityAcademiccalendarList", selectCommunityAcademiccalendarList);
		return selectCommunityAcademiccalendarList;
	}
	
	@Override
	public List<CardinalDomain> selectMainAcademicCalendarList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CardinalDomain> selectMainAcademicCalendarList = academicCalendarDao.selectMainAcademicCalendarList(map);
		map.put("selectMainAcademicCalendarList", selectMainAcademicCalendarList);
		return selectMainAcademicCalendarList;
	}
	
	@Override
	public int getLastPage() {
	    return (int)(Math.ceil((double)academicCalendarDao.selectCardinalTotalCount()/LINE_PER_PAGE));
	}
	//현호
}
