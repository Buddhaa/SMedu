package com.cyber.smedu.debate.repository;

import java.util.List;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;

public interface DebateDao {

	List<DebateResultDomain> professorStudentDebateCommentAndDateSelect(String openSubjectCode);

	DebateDomain professorStudentDebateSubjectAndContentSelect(String openSubjectCode);

	DebateDomain oneDebateList(String openSubjectCode);

	List<DebateResultDomain> debateResultList(String debateCode);

}
