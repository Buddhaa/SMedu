package com.cyber.smedu.exam.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.exam.domain.AnswerDomain;
import com.cyber.smedu.exam.domain.ExamQuestionsDomain;
import com.cyber.smedu.exam.domain.TestPaperDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

public interface ExamDao {

	TestPaperDomain adminStudentGradeTestPaperSelect(Map<String, Object> map);

	List<AnswerDomain> adminStudentGradeExamAndAnswerSelect(Map<String, Object> map);
	
	List<OpenSubjectDomain> professorSubjectSelectForExam(String professorCode);

	List<ExamQuestionsDomain> professorExamSelect(String openSubjectCode);

	AcademicCalendarDomain midAcademicCalendarCodeSelect(String openSubjectCode);

	AcademicCalendarDomain lastAcademicCalendarCodeSelect(String openSubjectCode);

	void examQuestionInsert(ExamQuestionsDomain examQuestionsDomain);

	List<ExamQuestionsDomain> midExamQuestionSelect(String openSubjectCode);

	List<ExamQuestionsDomain> finalExamQuestionSelect(String openSubjectCode);

	TestPaperDomain oneTestPaperDomain(LectureDomain oneLeture);

	List<ExamQuestionsDomain> examQuestionsList(String testPaperCode);

	void answerPaperAdd(AnswerDomain answerDomain);

	AttendDomain examCheck(AttendDomain attendDomain);
}
