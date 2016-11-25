package com.cyber.smedu.task.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.task.domain.TaskDomain;
import com.cyber.smedu.task.domain.TaskResultDomain;
import com.cyber.smedu.task.domain.TaskScoreDomain;

public interface TaskDao {

	TaskResultDomain professorStudentTaskResultDetail(String studentCode);

	TaskDomain oneTaskView(String openSubjectCode);

	void taskResultAdd(TaskResultDomain taskResultDomain);

	TaskResultDomain studentTaskResultCheck(TaskResultDomain taskResultDomain);

	TaskResultDomain taskSubmitUpdateDetail(String taskResultCode);

	void taskResultContentUpdate(TaskResultDomain taskResultDomain);

	void taskResultFullUpdate(TaskResultDomain taskResultDomain);

	TaskResultDomain adminStudentGradeTaskResult(Map<String, Object> map);

	List<OpenSubjectDomain> professorSubjectSelectForTask(String professorCode);

	TaskDomain professorTaskSelect(String openSubjectCode);

	void professorTaskUpdate(TaskDomain taskDomain);

	void professorTaskInsert(TaskDomain taskDomain);

	void taskScoreAndParticipationUpdate(TaskScoreDomain taskScoreDomain);

	void taskMarkingInsert(TaskScoreDomain taskScoreDomain);

	void finalGradeUpdateForTask(TaskScoreDomain taskScoreDomain);

	TaskScoreDomain professorTaskScoreAndCodeSelect(GradeDomain gradeDomain);

}
