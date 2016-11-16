package com.cyber.smedu.debate.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;
import com.cyber.smedu.debate.domain.DebateScoreDomain;

public interface DebateDao {

	List<DebateResultDomain> professorStudentDebateCommentAndDateSelect(String openSubjectCode);

	DebateDomain professorStudentDebateSubjectAndContentSelect(String openSubjectCode);

	DebateDomain oneDebateList(String openSubjectCode);

	List<DebateResultDomain> debateResultList(String debateCode);

	List<DebateResultDomain> adminStudentGradeSubjectDebateResultSelect(Map<String, Object> map);

	DebateScoreDomain adminStudentGradeSubjectDebateScoreSelect(Map<String, Object> map);

}
