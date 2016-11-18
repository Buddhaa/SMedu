package com.cyber.smedu.evaluation.repository;

import java.util.List;

import com.cyber.smedu.evaluation.domain.EvaluationCategoryDomain;
import com.cyber.smedu.evaluation.domain.EvaluationDomain;

public interface EvaluationDao {

	//////////////////11.10 입력
		
	//학생의 강의평가 페이지에서 과목을 선택시
	List<EvaluationCategoryDomain> lectureEvaluationItemsList();
	
	//학생이 해당과목을 평가를 했는지 확인
	List<EvaluationDomain> lectureEvaluationCheck(EvaluationDomain evaluationDomain);
	
	//강의평가 처리
	void evaluationAdd(EvaluationDomain evaluationDomain);


}
