package com.cyber.smedu.user.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.user.domain.PlannerDomain;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Repository
public class UserDaoImpl implements UserDao {
	private String NS = "com.cyber.smedu.mapper.UserMapper";
	@Autowired SqlSessionTemplate sqlSession;
	
	//전체회원 로그인
	@Override
	public UserDomain login(Map<String, Object> map) {
		return sqlSession.selectOne(NS+".login", map);
	}
	
	//교수 로그인
	@Override
	public ProfessorDomain loginProfessor(String userCode) {
		return sqlSession.selectOne(NS+".loginProfessor", userCode);
	}
	
	//플래너 로그인
	@Override
	public PlannerDomain loginPlanner(String userCode) {
		return sqlSession.selectOne(NS+".loginPlanner", userCode);
	}
	
	//학생 로그인
	@Override
	public StudentDomain loginStudent(String userCode) {
		return sqlSession.selectOne(NS+".loginStudent", userCode);
	}
	
	//회원 테이블 insert
	@Override
	public int insertUser(UserDomain user) {
		return sqlSession.insert(NS+".insertUser", user);
	}

	//학생 테이블 insert
	@Override
	public int insertStudent(StudentDomain student) {
		return sqlSession.insert(NS+".insertStudent", student);
	}
	
	//교수 테이블 insert
	@Override
	public int insertProfessor(ProfessorDomain professor) {
		return sqlSession.insert(NS+".insertProfessor", professor);
	}

	//플래너 테이블 insert
	@Override
	public int insertPlanner(PlannerDomain planner) {
		return sqlSession.insert(NS+".insertPlanner", planner);
	}
	//관리자 회원리스트 select
	@Override
	public List<UserDomain> selectAdminUserList() {
		return sqlSession.selectList(NS+".selectAdminUserList");
	}
	//관리자 회원 상세보기 select
	@Override
	public UserDomain selectAdminUserDetail(String userCode) {
		return sqlSession.selectOne(NS+".selectAdminUserDetail", userCode);
	}
	//관리자 회원 상세보기 select - 교수 추가정보
	@Override
	public ProfessorDomain selectAdminProfessorDetail(String userCode) {
		return sqlSession.selectOne(NS+".selectAdminProfessorDetail", userCode);
	}
	//관리자 회원 상세보기 select - 플래너 추가정보
	@Override
	public PlannerDomain selectAdminPlannerDetail(String userCode) {
		return sqlSession.selectOne(NS+".selectAdminPlannerDetail", userCode);
	}
	//관리자 회원 상세보기 select - 학생 추가정보
	@Override
	public StudentDomain selectAdminStudentDetail(String userCode) {
		return sqlSession.selectOne(NS+".selectAdminStudentDetail", userCode);
	}
	//관리자 가입승인요청 리스트 select - 학생 추가정보
	@Override
	public List<UserDomain> selectAdminJoinRequestList() {
		return sqlSession.selectList(NS+".selectAdminJoinRequestList");
	}
	//한명의 학생 회원정보
	@Override
	public StudentDomain studentSelectOne(String userCode) {
		return sqlSession.selectOne(NS+".studentSelectOne", userCode);
	}
	
	//한명의 학생 기수조회 
	@Override
	public CardinalDomain cardinalSelectOne(String cardinalCode) {
		return sqlSession.selectOne(NS+".cardinalSelectOne", cardinalCode);
	}

	//한명의 학생 정보수정 처리
	@Override
	public void studentUpdate(StudentDomain studentDomain) {
		sqlSession.selectOne(NS+".studentUpdate", studentDomain);
	}

	//회원의 학생코드 받기
	@Override
	public StudentDomain studentCode(String userCode) {		
		
		return sqlSession.selectOne(NS+".studentSelectOne", userCode);
	}

	//학생이수학점관리 데이터 받기
	@Override
	public List<StudentDomain> finalResultGrade(String studentCode) {
		
		return sqlSession.selectList(NS+".finalResultGrade", studentCode);
	}

	//학생의 상담내역 페이지 이동
	@Override
	public List<BoardArticleDomain> consultingHistory(String userCode) {
		
		return  sqlSession.selectList(NS+".consultingHistory", userCode);
	}
	
	//학생의 상담내역 디테일페이지 이동
	@Override
	public BoardArticleDomain consultingHistoryDetail(String boardArticleCode) {
		return sqlSession.selectOne(NS+".consultingHistoryDetail", boardArticleCode);
	}

	//나의 학사관리 페이지 이동
	@Override
	public List<CardinalDomain> classroomAcademicaCtivity(String userCode) {
		return sqlSession.selectList(NS+".classroomAcademicaCtivity", userCode);
	}

	//해당과목 강의 리스트
	@Override
	public List<LectureDomain> lectureList(String openSubjectCode) {
		
		return sqlSession.selectList(NS+".lectureList", openSubjectCode);
	}
	
	//나의 학사관리에서 과목 선택시 출석여부 확인
	@Override
	public List<AttendDomain> openSubjectAttendList(AttendDomain attendDomain) {

		return sqlSession.selectList(NS+".openSubjectAttendList", attendDomain);
	}
	@Override
	public ProfessorDomain professorSelectOne(String userCode) {		
		
		System.out.println("03 professorSelectOne <-- UserDaoImpl.java");
		
		return sqlSession.selectOne(NS+".professorSelectOne", userCode);
		
	}
	
	@Override
	public void professorUpdate(ProfessorDomain professorDomain){
		
		System.out.println("03 professorUpdate <-- UserDaoImpl.java");
		
		sqlSession.update(NS+".professorUpdate", professorDomain);
		
	}
	
	@Override
	public void userStateUpdate(String userCode) {
		
		System.out.println("03 userStateUpdate <-- UserDaoImpl.java");
		System.out.println("userCode : " + userCode);
		
		sqlSession.update(NS+".userStateUpdate", userCode);
	}
}