package com.cyber.smedu.exam.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.exam.domain.AnswerDomain;
import com.cyber.smedu.exam.domain.TestPaperDomain;

@Repository
public class ExamDaoImpl implements ExamDao {
	
	private String NS = "com.cyber.smedu.mapper.ExamMapper";
	@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public TestPaperDomain adminStudentGradeTestPaperSelect(Map<String, Object> map) {
		return sqlSession.selectOne(NS+".adminStudentGradeTestPaperSelect", map);
	}	
	@Override
	public List<AnswerDomain> adminStudentGradeExamAndAnswerSelect(Map<String, Object> map) {
		return sqlSession.selectList(NS+".adminStudentGradeExamAndAnswerSelect", map);
	}
}
