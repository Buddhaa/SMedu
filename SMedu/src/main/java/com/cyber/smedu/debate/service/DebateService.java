package com.cyber.smedu.debate.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;

public interface DebateService {

	List<DebateResultDomain> professorStudentDebateCommentAndDateSelect(String openSubjectCode);

	DebateDomain professorStudentDebateSubjectAndContentSelect(String openSubjectCode);

	Map<String, Object> oneDebateList(String openSubjectCode);

}
