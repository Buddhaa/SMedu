package com.cyber.smedu.task.repository;

import com.cyber.smedu.task.domain.TaskDomain;
import com.cyber.smedu.task.domain.TaskResultDomain;

public interface TaskDao {

	TaskResultDomain professorStudentTaskResultDetail(String studentCode);

	TaskDomain oneTaskView(String openSubjectCode);

	void taskResultAdd(TaskResultDomain taskResultDomain);

	TaskResultDomain studentTaskResultCheck(TaskResultDomain taskResultDomain);

	TaskResultDomain taskSubmitUpdateDetail(String taskResultCode);

	void taskResultContentUpdate(TaskResultDomain taskResultDomain);

	void taskResultFullUpdate(TaskResultDomain taskResultDomain);

}
