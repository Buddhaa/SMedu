package com.cyber.smedu.exam.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.exam.domain.AnswerDomain;
import com.cyber.smedu.exam.domain.ExamQuestionsDomain;
import com.cyber.smedu.exam.domain.TestPaperDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

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
	//의기
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForExam(String professorCode) {	
		return sqlSession.selectList(NS+".professorSubjectSelectForExam", professorCode);		
	}
	
	@Override
	public List<ExamQuestionsDomain> professorExamSelect(String openSubjectCode) {
		return sqlSession.selectList(NS+".professorExamSelect", openSubjectCode);
		
	}
	
	@Override
	public AcademicCalendarDomain midAcademicCalendarCodeSelect(String openSubjectCode) {
		return sqlSession.selectOne(NS+".midAcademicCalendarCodeSelect", openSubjectCode);
		
	}
	
	@Override
	public AcademicCalendarDomain lastAcademicCalendarCodeSelect(String openSubjectCode) {
		return sqlSession.selectOne(NS+".lastAcademicCalendarCodeSelect", openSubjectCode);
		
	}
	
	@Override
	public void examQuestionInsert(ExamQuestionsDomain examQuestionsDomain) {
		sqlSession.insert(NS+".examQuestionInsert", examQuestionsDomain);
	}
	
	@Override
	public List<ExamQuestionsDomain> midExamQuestionSelect(String openSubjectCode) {
		return sqlSession.selectList(NS+".midExamQuestionSelect", openSubjectCode);	
	}
	
	@Override
	public List<ExamQuestionsDomain> finalExamQuestionSelect(String openSubjectCode) {
		return sqlSession.selectList(NS+".finalExamQuestionSelect", openSubjectCode);		
	}
	//우영
	//oneLeture객체로 -> , 시험시간 받아오기
	@Override
	public TestPaperDomain oneTestPaperDomain(LectureDomain oneLeture) {
		
		return sqlSession.selectOne(NS+".oneTestPaperDomain", oneLeture);
	}

	
	//testPaperCode로 -> examQuestion객체 받아오기
	@Override
	public List<ExamQuestionsDomain> examQuestionsList(String testPaperCode) {
		
		return sqlSession.selectList(NS+".examQuestionsList", testPaperCode);
	}


	//학생이 시험문제를 풀고 답안 제출을 할 경우
	@Override
	public void answerPaperAdd(AnswerDomain answerDomain) {
		
		sqlSession.insert(NS+".answerPaperAdd", answerDomain);
	}


	//학생이 시험을 응시한적이 있나 체크
	@Override
	public AttendDomain examCheck(AttendDomain attendDomain) {
		
		return sqlSession.selectOne(NS+".examCheck", attendDomain);
	}
	//장용
}
