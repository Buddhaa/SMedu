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
	public List<UserDomain> selectAdminUserList(Map<String, Object> map) {
		return sqlSession.selectList(NS+".selectAdminUserList", map);
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
	//관리자 가입승인요청 리스트 select
	@Override
	public List<UserDomain> selectAdminJoinRequestList() {
		return sqlSession.selectList(NS+".selectAdminJoinRequestList");
	}
	//관리자 학생성적관리 학생 리스트
	@Override
	public List<StudentDomain> selectAdminStudentList(Map<String, Object> map) {
		return sqlSession.selectList(NS+".selectAdminStudentList", map);
	}
	//관리자 학생성적관리 학생 상세보기
	@Override
	public UserDomain selectAdminStudentGradeDetail(String userCode) {
		return sqlSession.selectOne(NS+".selectAdminStudentGradeDetail", userCode);
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
	//교수 상세정보
	@Override
	public ProfessorDomain professorSelectInfo(String professorCode) {	
		System.out.println("professorCode dat"+ professorCode);
		return sqlSession.selectOne(NS+".professorSelectInfo", professorCode);
	}
	
	//아이디 중복 체크
	@Override
	public UserDomain userIdCheck(String userId) {
		return sqlSession.selectOne(NS+".userIdCheck", userId);
	}
	
	@Override
	public UserDomain selectStudentName(String studentCode) {
		return sqlSession.selectOne(NS+".selectStudentName",studentCode);
	}
	
}