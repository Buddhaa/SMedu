package com.cyber.smedu.debate.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;
import com.cyber.smedu.debate.domain.DebateScoreDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

@Repository
public class DebateDaoImpl implements DebateDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.cyber.smedu.mapper.DebateMapper";
	
	@Override
	public DebateScoreDomain adminStudentGradeSubjectDebateScoreSelect(Map<String, Object> map) {
				
		return sqlSession.selectOne(NS+".adminStudentGradeSubjectDebateScoreSelect", map);
		
	}
	
	@Override
	public List<DebateResultDomain> adminStudentGradeSubjectDebateResultSelect(Map<String, Object> map) {
				
		return sqlSession.selectList(NS+".adminStudentGradeSubjectDebateResultSelect", map);
		
	}
	//의기
	@Override
	public List<DebateResultDomain> professorStudentDebateCommentAndDateSelect(String openSubjectCode) {
		
		System.out.println("03 professorStudentDebateCommentAndDateSelect <-- DebateDaoImpl.java");
		//System.out.println("openSubjectCode : " + openSubjectCode);
		
		return sqlSession.selectList(NS+".professorStudentDebateCommentAndDateSelect", openSubjectCode);
		
	}
	
	@Override
	public DebateDomain professorStudentDebateSubjectAndContentSelect(String openSubjectCode) {
		
		System.out.println("03 professorStudentDebateSubjectAndContentSelect <-- DebateDaoImpl.java");
		System.out.println("openSubjectCode : " + openSubjectCode);
		
		return sqlSession.selectOne(NS+".professorStudentDebateSubjectAndContentSelect", openSubjectCode);
		
	}
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForDebate(String professorCode) {
		
		System.out.println("03 professorSubjectSelectForDebate <-- DebateDaoImpl.java");
		System.out.println("professorCode : " + professorCode);
		
		return sqlSession.selectList(NS+".professorSubjectSelectForDebate", professorCode);
		
	}
	
	@Override
	public DebateDomain professorDebateSelect(String openSubjectCode) {
		return sqlSession.selectOne(NS+".professorDebateSelect", openSubjectCode);	
	}
	
	@Override
	public void professorDebateUpdate(DebateDomain debateDomain) {
		sqlSession.update(NS+".professorDebateUpdate", debateDomain);
	}
	
	@Override
	public void professorDebateInsert(DebateDomain debateDomain) {
		sqlSession.insert(NS+".professorDebateInsert", debateDomain);
	}
	
	@Override
	public void debateScoreAndParticipationUpdate(DebateScoreDomain debateScoreDomain) {
		sqlSession.update(NS+".debateScoreAndParticipationUpdate", debateScoreDomain);
	}
	@Override
	public void debateMarkingInsert(DebateScoreDomain debateScoreDomain) {
		sqlSession.insert(NS+".debateMarkingInsert", debateScoreDomain);
	}
	@Override
	public void finalGradeUpdateForDebate(DebateScoreDomain debateScoreDomain) {
		sqlSession.update(NS+".finalGradeUpdateForDebate", debateScoreDomain);
	}
	@Override
	public DebateScoreDomain professorDebateScoreAndCodeSelect(GradeDomain gradeDomain) {
		return sqlSession.selectOne(NS+".professorDebateScoreAndCodeSelect", gradeDomain);
	}
	//우영
	
	//토론 참여 페이지에서 과목 선택시 해당 과목 주제 리스트 받아오기
	@Override
	public DebateDomain oneDebateList(String openSubjectCode) {
		
		return sqlSession.selectOne(NS + ".oneDebateList", openSubjectCode);
	}

	//주제에 대한 학생들의 토론 리스트 받아오기
	@Override
	public List<DebateResultDomain> debateResultList(String debateCode) {
		
		return sqlSession.selectList(NS+".debateResultList", debateCode);
	}

	
	//////////////////11.10 입력
	
	//토론참여에 해당 과목을 학생이 토론 글쓰기를 눌렀을때 	
		
	@Override
	public void debateResultAdd(DebateResultDomain debateResultDomain) {
		
		sqlSession.insert(NS+".debateResultAdd", debateResultDomain);
	}
	//장용
	
	@Override
	public List<DebateResultDomain> selectPlannerStudentDebateList(Map<String, Object> map) {
		
		return sqlSession.selectList(NS+".selectPlannerStudentDebateList", map);
	}
	//진호
}
