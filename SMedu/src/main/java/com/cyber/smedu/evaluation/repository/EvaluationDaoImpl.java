package com.cyber.smedu.evaluation.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.evaluation.domain.EvaluationCategoryDomain;
import com.cyber.smedu.evaluation.domain.EvaluationDomain;

@Repository
public class EvaluationDaoImpl implements EvaluationDao {

	private String NS = "com.cyber.smedu.mapper.EvaluationMapper";
	
	@Autowired 
	SqlSessionTemplate sqlSession;
	
	//////////////////11.10 입력
	
	//학생의 강의평가 페이지에서 과목을 선택시	
	
	@Override
	public List<EvaluationCategoryDomain> lectureEvaluationItemsList() {

		return sqlSession.selectList(NS+".lectureEvaluationItemsList");
	}
	
	
	//학생이 해당과목을 평가를 했는지 확인
	@Override
	public List<EvaluationDomain> lectureEvaluationCheck(EvaluationDomain evaluationDomain) {

		return sqlSession.selectList(NS+".lectureEvaluationCheck",evaluationDomain);
	}

	
	
	//강의평가 처리
	@Override
	public void evaluationAdd(EvaluationDomain evaluationDomain) {
	
		sqlSession.selectList(NS+".evaluationAdd",evaluationDomain);
	}



}
