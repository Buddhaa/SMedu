package com.cyber.smedu.exam.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.exam.domain.AnswerDomain;
import com.cyber.smedu.exam.domain.TestPaperDomain;

public interface ExamDao {

	TestPaperDomain adminStudentGradeTestPaperSelect(Map<String, Object> map);

	List<AnswerDomain> adminStudentGradeExamAndAnswerSelect(Map<String, Object> map);

}
