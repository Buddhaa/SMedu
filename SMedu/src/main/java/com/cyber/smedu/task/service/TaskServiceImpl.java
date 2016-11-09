package com.cyber.smedu.task.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.task.domain.TaskResultDomain;
import com.cyber.smedu.task.repository.TaskDao;

@Service
public class TaskServiceImpl implements TaskService{

	@Autowired
	TaskDao taskDao;
	
	@Override
	public TaskResultDomain professorStudentTaskResultDetail(String studentCode) {
		
		System.out.println("02 professorStudentTaskResultDetail <-- TaskServiceImpl.java");
		System.out.println("studentCode : " + studentCode);
		
		TaskResultDomain taskResultDomain
			= taskDao.professorStudentTaskResultDetail(studentCode);
		
		return taskResultDomain;
		
	}
}
