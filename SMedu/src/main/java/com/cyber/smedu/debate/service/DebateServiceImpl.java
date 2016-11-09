package com.cyber.smedu.debate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;
import com.cyber.smedu.debate.repository.DebateDao;

@Service
public class DebateServiceImpl implements DebateService {

	@Autowired
	DebateDao debateDao;
	
	@Override
	public List<DebateResultDomain> professorStudentDebateCommentAndDateSelect(String openSubjectCode) {
		
		System.out.println("02 professorStudentDebateCommentAndDateSelect <-- DebateServiceImpl.java");
		//System.out.println("openSubjectCode : " + openSubjectCode);
		
		List<DebateResultDomain> debateResultDomain
			= debateDao.professorStudentDebateCommentAndDateSelect(openSubjectCode);
		
		return debateResultDomain;
		
	}
	
	@Override
	public DebateDomain professorStudentDebateSubjectAndContentSelect(String openSubjectCode) {
		
		System.out.println("02 professorStudentDebateSubjectAndContentSelect <-- DebateServiceImpl.java");
		System.out.println("openSubjectCode : " + openSubjectCode);
		
		DebateDomain debateDomain
			= debateDao.professorStudentDebateSubjectAndContentSelect(openSubjectCode);
		
		return debateDomain;
		
	}
	//우영
	//토론 참여 페이지에서 과목 선택시 해당 과목 주제 리스트 받아오기
	@Override
	public Map<String,Object> oneDebateList(String openSubjectCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//해당 과목의 주제 리스트 받아오기 
		DebateDomain oneDebateList = debateDao.oneDebateList(openSubjectCode);
		map.put("oneDebateList", oneDebateList);
		
		
		if(oneDebateList != null){
			//주제에 대한 학생들의 토론 리스트 받아오기
			String debateCode = oneDebateList.getDebateCode();
			List<DebateResultDomain> debateResultList = debateDao.debateResultList(debateCode);
			map.put("debateResultList", debateResultList);
		}
		
		return map;
	}
	//장용
}
