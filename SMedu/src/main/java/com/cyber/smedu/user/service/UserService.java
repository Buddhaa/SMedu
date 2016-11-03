package com.cyber.smedu.user.service;

import java.util.Map;

import com.cyber.smedu.user.domain.PlannerDomain;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;

//인터페이스
public interface UserService {
	
	public Map<String, Object> login(String userId, String userPw);
	public Map<String, Object> adminLogin(String userId, String userPw);
	public int addStudent(UserDomain user, StudentDomain student);
	public int addProfessor(UserDomain user, ProfessorDomain professor);
	public int addPlanner(UserDomain user, PlannerDomain planner);
}
