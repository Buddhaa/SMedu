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
	
	@Override
	public UserDomain login(Map<String, Object> map) {
		return sqlSession.selectOne(NS+".login", map);
	}
	@Override
	public ProfessorDomain loginProfessor(String userCode) {
		return sqlSession.selectOne(NS+".loginProfessor", userCode);
	}
	@Override
	public PlannerDomain loginPlanner(String userCode) {
		return sqlSession.selectOne(NS+".loginPlanner", userCode);
	}
	@Override
	public StudentDomain loginStudent(String userCode) {
		return sqlSession.selectOne(NS+".loginStudent", userCode);
	}
}