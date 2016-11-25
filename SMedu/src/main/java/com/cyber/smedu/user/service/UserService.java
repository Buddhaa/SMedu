package com.cyber.smedu.user.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;
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
	//학생의 정보수정페이지 이동
	Map<String, Object> studentSelectOne(String userCode);
	
	//학생의 정보수정 처리
	void studentUpdate(StudentDomain studentDomain);
	
	ProfessorDomain getProfessorSelectOne(String userCode);

	void professorUpdate(ProfessorDomain professorDomain);

	void userStateUpdate(String userCode);
	Map<String, Object> selectAdminUserDetail(String userCode);
	Map<String, Object> selectAdminJoinRequestList();
	Map<String, Object> selectAdminUserList(String departmentCode, String userLevel, String userName, String userState);
	ProfessorDomain professorSelectInfo(String professorCode);
	UserDomain userIdCheck(String userId);
}
