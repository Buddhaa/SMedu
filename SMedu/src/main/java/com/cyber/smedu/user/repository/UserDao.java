package com.cyber.smedu.user.repository;

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
public interface UserDao {

	public UserDomain login(Map<String, Object> map);

	public ProfessorDomain loginProfessor(String userCode);

	public PlannerDomain loginPlanner(String userCode);

	public StudentDomain loginStudent(String userCode);
	
	public int insertUser(UserDomain user);
	
	public int insertStudent(StudentDomain student);
	
	public int insertProfessor(ProfessorDomain professor);
	
	public int insertPlanner(PlannerDomain planner);

	//관리자 회원 리스트
	public List<UserDomain> selectAdminUserList(Map<String, Object> map);
	//한명의 학생 회원정보
	StudentDomain studentSelectOne(String userCode);

	//한명의 학생 기수조회 
	CardinalDomain cardinalSelectOne(String userCode);
	
	//한명의 학생 정보수정 처리
	void studentUpdate(StudentDomain studentDomain);
	
	//회원의 학생코드 받기
	StudentDomain studentCode(String userCode);
	
	ProfessorDomain professorSelectOne(String userCode);

	void professorUpdate(ProfessorDomain professorDomain);

	void userStateUpdate(String userCode);

	UserDomain selectAdminUserDetail(String userCode);

	ProfessorDomain selectAdminProfessorDetail(String userCode);

	PlannerDomain selectAdminPlannerDetail(String userCode);

	StudentDomain selectAdminStudentDetail(String userCode);

	List<UserDomain> selectAdminJoinRequestList();

	List<StudentDomain> selectAdminStudentList(Map<String, Object> map);

	UserDomain selectAdminStudentGradeDetail(String userCode);

	UserDomain userIdCheck(String userId);

	ProfessorDomain professorSelectInfo(String professorCode);

	UserDomain selectStudentName(String studentCode);

	

	

}
