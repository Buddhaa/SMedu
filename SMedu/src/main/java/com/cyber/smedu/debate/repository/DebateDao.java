package com.cyber.smedu.debate.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;
import com.cyber.smedu.debate.domain.DebateScoreDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

public interface DebateDao {

	List<DebateResultDomain> professorStudentDebateCommentAndDateSelect(String openSubjectCode);

	DebateDomain professorStudentDebateSubjectAndContentSelect(String openSubjectCode);

	DebateDomain oneDebateList(String openSubjectCode);

	List<DebateResultDomain> debateResultList(String debateCode);

	List<DebateResultDomain> adminStudentGradeSubjectDebateResultSelect(Map<String, Object> map);

	DebateScoreDomain adminStudentGradeSubjectDebateScoreSelect(Map<String, Object> map);

	List<OpenSubjectDomain> professorSubjectSelectForDebate(String professorCode);

	DebateDomain professorDebateSelect(String openSubjectCode);

	void professorDebateUpdate(DebateDomain debateDomain);

	void professorDebateInsert(DebateDomain debateDomain);

	void debateResultAdd(DebateResultDomain debateResultDomain);

	void debateScoreAndParticipationUpdate(DebateScoreDomain debateScoreDomain);

	void debateMarkingInsert(DebateScoreDomain debateScoreDomain);

	void finalGradeUpdateForDebate(DebateScoreDomain debateScoreDomain);

	DebateScoreDomain professorDebateScoreAndCodeSelect(GradeDomain gradeDomain);

	List<DebateResultDomain> selectPlannerStudentDebateList(Map<String, Object> map);

}
