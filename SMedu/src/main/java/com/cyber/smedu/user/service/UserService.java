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
	public Map<String, Object> selectAdminUserList();
	//학생의 정보수정페이지 이동
	Map<String, Object> studentSelectOne(String userCode);
	
	//학생의 정보수정 처리
	void studentUpdate(StudentDomain studentDomain);
	
	//학생의 이수학점관리 페이지 이동
	List<StudentDomain> finalResultGrade(String userCode);
	
	//학생의 상담내역 페이지 이동
	List<BoardArticleDomain> consultingHistory(String userCode);
	
	//학생의 상담내역 디테일 페이지 이동
	BoardArticleDomain consultingHistoryDetail(String boardArticleCode);
	
	//나의 학사관리 페이지 이동
	List<CardinalDomain>classroomAcademicaCtivity(String userCode);
	
	//나의 학사관리에서 과목 선택시
	List<LectureDomain> classroomAcademicaCtivityView(String openSubjectCode);
	
	//나의 학사관리에서 과목 선택시 출석여부 확인
	List<AttendDomain> openSubjectAttendList(String userCode,AttendDomain attendDomain);
	
	ProfessorDomain getProfessorSelectOne(String userCode);

	void professorUpdate(ProfessorDomain professorDomain);

	void userStateUpdate(String userCode);
}
