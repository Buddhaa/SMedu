package com.cyber.smedu.task.repository;

import com.cyber.smedu.task.domain.TaskResultDomain;

public interface TaskDao {

	TaskResultDomain professorStudentTaskResultDetail(String studentCode);

}
