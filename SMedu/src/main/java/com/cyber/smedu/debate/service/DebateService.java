package com.cyber.smedu.debate.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;
import com.cyber.smedu.debate.domain.DebateScoreDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

public interface DebateService {

	List<DebateResultDomain> professorStudentDebateCommentAndDateSelect(String openSubjectCode);

	DebateDomain professorStudentDebateSubjectAndContentSelect(String openSubjectCode);

	Map<String, Object> oneDebateList(String openSubjectCode);

	List<OpenSubjectDomain> professorSubjectSelectForDebate(String professorCode);

	DebateDomain professorDebateSelect(String openSubjectCode);

	void professorDebateUpdate(DebateDomain debateDomain);

	void professorDebateInsert(DebateDomain debateDomain);

	void debateResultAdd(String userCode, DebateResultDomain debateResultDomain);

	void debateScoreAndParticipationUpdate(DebateScoreDomain debateScoreDomain);

	void finalGradeUpdateForDebate(DebateScoreDomain debateScoreDomain);

	DebateScoreDomain professorDebateScoreAndCodeSelect(GradeDomain gradeDomain);

	void debateMarkingInsert(DebateScoreDomain debateScoreDomain);

}
