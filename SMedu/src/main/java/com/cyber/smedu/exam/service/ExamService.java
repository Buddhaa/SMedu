package com.cyber.smedu.exam.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.exam.domain.ExamQuestionsDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

public interface ExamService {

	List<OpenSubjectDomain> professorSubjectSelectForExam(String professorCode);

	List<ExamQuestionsDomain> professorExamSelect(String openSubjectCode);

	AcademicCalendarDomain midAcademicCalendarCodeSelect(String openSubjectCode);

	AcademicCalendarDomain lastAcademicCalendarCodeSelect(String openSubjectCode);

	int[] examQuestionsNo();

	void examQuestionInsert(ExamQuestionsDomain examQuestionsDomain, CommonsMultipartFile cmf);

	List<ExamQuestionsDomain> midExamQuestionDetail(String openSubjectCode);

	List<ExamQuestionsDomain> finalExamQuestionDetail(String openSubjectCode);

	Map<String, Object> examList(String lectureCode);

	void answerPaperAdd(String attendCode, String userCode, String testPaperCode, List<String> score,
			List<String> examQuestionCode);

	AttendDomain examCheck(String userCode, String openSubjectCode, String lectureCode);

}
