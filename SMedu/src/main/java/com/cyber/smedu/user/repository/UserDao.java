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
	public List<UserDomain> selectAdminUserList();
	//한명의 학생 회원정보
	StudentDomain studentSelectOne(String userCode);

	//한명의 학생 기수조회 
	CardinalDomain cardinalSelectOne(String userCode);
	
	//한명의 학생 정보수정 처리
	void studentUpdate(StudentDomain studentDomain);
	
	//회원의 학생코드 받기
	StudentDomain studentCode(String userCode);
	
	//학생이수학점관리 데이터 받기
	List<StudentDomain> finalResultGrade(String studentCode);	
	
	//학생의 상담내역 페이지 이동
	List<BoardArticleDomain> consultingHistory(String userCode);
	
	//학생의 상담내역 디테일페이지 이동
	BoardArticleDomain consultingHistoryDetail(String boardArticleCode);
	
	//나의 학사관리 페이지 이동
	List<CardinalDomain> classroomAcademicaCtivity(String studentCode);
	
	//해당과목 강의 리스트
	List<LectureDomain> lectureList(String openSubjectCode);
	
	//나의 학사관리에서 과목 선택시 출석여부 확인
	List<AttendDomain> openSubjectAttendList(AttendDomain attendDomain);
	
	ProfessorDomain professorSelectOne(String userCode);

	void professorUpdate(ProfessorDomain professorDomain);

	void userStateUpdate(String userCode);

	

}
