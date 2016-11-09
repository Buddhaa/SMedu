package com.cyber.smedu.debate.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;

@Repository
public class DebateDaoImpl implements DebateDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.cyber.smedu.mapper.DebateMapper";
	
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
	//장용
}
