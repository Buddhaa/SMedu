package com.cyber.smedu.task.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.task.domain.TaskDomain;
import com.cyber.smedu.task.domain.TaskResultDomain;
import com.cyber.smedu.task.domain.TaskScoreDomain;

public interface TaskService {

	//교수 담당학생 과제제출물 상세보기
	TaskResultDomain professorStudentTaskResultDetail(String studentCode);

	Map<String, Object> oneTaskView(String userCode, String openSubjectCode);

	String taskResultAddCheck(String userCode, TaskResultDomain taskResultDomain);

	void taskResultUpdate(TaskResultDomain taskResultDomain, HttpServletRequest request);

	TaskResultDomain taskSubmitUpdateDetail(String taskResultCode);

	List<OpenSubjectDomain> professorSubjectSelectForTask(String professorCode);

	TaskDomain professorTaskSelect(String openSubjectCode);

	void professorTaskUpdate(TaskDomain taskDomain);

	void professorTaskInsert(TaskDomain taskDomain);

	void taskResultAdd(String userCode, TaskResultDomain taskResultDomain, HttpServletRequest request);

	void taskScoreAndParticipationUpdate(TaskScoreDomain taskScoreDomain);

	void taskMarkingInsert(TaskScoreDomain taskScoreDomain);

	void finalGradeUpdateForTask(TaskScoreDomain taskScoreDomain);

	TaskScoreDomain professorTaskScoreAndCodeSelect(GradeDomain gradeDomain);
}
