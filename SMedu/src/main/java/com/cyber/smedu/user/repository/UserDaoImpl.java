package com.cyber.smedu.user.repository;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}