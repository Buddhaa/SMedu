package com.cyber.smedu.task.service;

import com.cyber.smedu.task.domain.TaskResultDomain;

public interface TaskService {

	//교수 담당학생 과제제출물 상세보기
	TaskResultDomain professorStudentTaskResultDetail(String studentCode);
}
