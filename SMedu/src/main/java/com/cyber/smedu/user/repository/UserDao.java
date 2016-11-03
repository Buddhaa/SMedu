package com.cyber.smedu.user.repository;

import java.util.Map;

import com.cyber.smedu.user.domain.PlannerDomain;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;

//인터페이스
public interface UserDao {

	public UserDomain login(Map<String, Object> map);

	public ProfessorDomain loginProfessor(String userCode);

	public PlannerDomain loginPlanner(String userCode);

	public StudentDomain loginStudent(String userCode);
	
	public int insertUser(UserDomain user);
	
	public int insertStudent(StudentDomain student);
	
	public int insertProfessor(ProfessorDomain professor);
	
	public int insertPlanner(PlannerDomain planner);
}
