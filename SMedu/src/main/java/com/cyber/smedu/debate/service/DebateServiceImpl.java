package com.cyber.smedu.debate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;
import com.cyber.smedu.debate.domain.DebateScoreDomain;
import com.cyber.smedu.debate.repository.DebateDao;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.grade.repository.GradeDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

@Service
public class DebateServiceImpl implements DebateService {

	@Autowired
	DebateDao debateDao;
	
	@Autowired
	GradeDao gradeDao;
	
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
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForDebate(String professorCode) {
		
		System.out.println("02 professorSubjectSelectForDebate <-- DebateServiceImpl.java ");
		System.out.println("professorCode : " + professorCode);
		
		List<OpenSubjectDomain> openSubjectDomain
			= debateDao.professorSubjectSelectForDebate(professorCode);
		
		return openSubjectDomain;
	}
	
	@Override
	public DebateDomain professorDebateSelect(String openSubjectCode) {
		
		DebateDomain debateDomain
			= debateDao.professorDebateSelect(openSubjectCode);
		
		return debateDomain;
		
	}
	
	@Override
	public void professorDebateUpdate(DebateDomain debateDomain) {
		debateDao.professorDebateUpdate(debateDomain);
	}
	
	@Override
	public void professorDebateInsert(DebateDomain debateDomain) {
		debateDao.professorDebateInsert(debateDomain);
	}
	
	@Override
	public void debateScoreAndParticipationUpdate(DebateScoreDomain debateScoreDomain) {
		debateDao.debateScoreAndParticipationUpdate(debateScoreDomain);
	}
	
	@Override
	public void debateMarkingInsert(DebateScoreDomain debateScoreDomain) {
		debateDao.debateMarkingInsert(debateScoreDomain);
	}
	@Override
	public void finalGradeUpdateForDebate(DebateScoreDomain debateScoreDomain) {
		debateDao.finalGradeUpdateForDebate(debateScoreDomain);
	}
	@Override
	public DebateScoreDomain professorDebateScoreAndCodeSelect(GradeDomain gradeDomain) {
		
		DebateScoreDomain debateScoreDomain
			= debateDao.professorDebateScoreAndCodeSelect(gradeDomain);
		
		return debateScoreDomain;
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

	
	//////////////////11.10 입력
	
	//토론참여에 해당 과목을 학생이 토론 글쓰기를 눌렀을때 
	@Override
	public void debateResultAdd(String userCode, DebateResultDomain debateResultDomain) {
		
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		
		debateResultDomain.setStudentCode(studentCode);
		
		//토론답글 등록 처리
		debateDao.debateResultAdd(debateResultDomain);
		
	}
	//장용
}
