package com.cyber.smedu.task.service;

import java.util.Map;

import com.cyber.smedu.task.domain.TaskResultDomain;

public interface TaskService {

	//교수 담당학생 과제제출물 상세보기
	TaskResultDomain professorStudentTaskResultDetail(String studentCode);

	Map<String, Object> oneTaskView(String userCode, String openSubjectCode);

	String taskResultAddCheck(String userCode, TaskResultDomain taskResultDomain);

	void taskResultAdd(String userCode, TaskResultDomain taskResultDomain);

	void taskResultUpdate(TaskResultDomain taskResultDomain);

	TaskResultDomain taskSubmitUpdateDetail(String taskResultCode);
}
