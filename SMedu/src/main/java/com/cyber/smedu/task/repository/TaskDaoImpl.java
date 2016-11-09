package com.cyber.smedu.task.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.task.domain.TaskResultDomain;

@Repository
public class TaskDaoImpl implements TaskDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NS = "com.cyber.smedu.mapper.TaskMapper";
	
	@Override
	public TaskResultDomain professorStudentTaskResultDetail(String studentCode) {
		
		System.out.println("03 professorStudentTaskResultDetail <-- TaskDaoImpl.java");
		System.out.println("studentCode : " + studentCode);
		
		return sqlSessionTemplate.selectOne(NS+".professorStudentTaskResultDetail", studentCode);
		
	}
}
