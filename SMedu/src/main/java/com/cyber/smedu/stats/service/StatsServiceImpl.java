package com.cyber.smedu.stats.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.stats.domain.StatsDomain;
import com.cyber.smedu.stats.repository.StatsDao;
import com.cyber.smedu.user.domain.UserDomain;
import com.cyber.smedu.user.repository.UserDao;

@Service
public class StatsServiceImpl implements StatsService{
	@Autowired StatsDao statsDao;
	
	@Override
	public Map<String, Object> adminMain() {
		Map<String, Object> map = new HashMap<String, Object>();
		//현재날짜 구하기
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(c.getTime());
		
		//오늘 방문자수
		StatsDomain stats = statsDao.isToday(day);
		int todayCount = stats.getStatsCount();
		map.put("todayCount", todayCount);
		
		//총 방문자수
		int totalCount = statsDao.totalCount();
		map.put("totalCount", totalCount);
		
		//현재 날짜 기준 월에 해당하는 학생 가입자수
		int monthStudentCount = statsDao.monthJoinStudentCount();
		map.put("monthStudentCount", monthStudentCount);
		
		//현재 날짜 기준 월에 해당하는 총 수강신청 결제금액
		int monthStudentPay = statsDao.monthStudentPayCount();
		map.put("monthStudentPay", monthStudentPay);
		
		//최근 가입자 목록
		List<UserDomain> recentlyUserList =  statsDao.recentlyJoinUser();
		map.put("recentlyUserList", recentlyUserList);
		
		//학생 가입자 유입경로 백분율 통계
		StatsDomain studentKnowPathPercent = statsDao.studentKnowPathPercent();
		map.put("studentKnowPathPercent", studentKnowPathPercent);
		
		return map;
	}
}
