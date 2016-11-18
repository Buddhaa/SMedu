package com.cyber.smedu.evaluation.service;

import java.util.List;

import com.cyber.smedu.evaluation.domain.EvaluationCategoryDomain;
import com.cyber.smedu.evaluation.domain.EvaluationDomain;

public interface EvaluationService {
	
	//////////////////11.10 입력
	
	//학생의 강의평가 페이지에서 과목을 선택시
	List<EvaluationCategoryDomain> lectureEvaluationItemsList();
	
	//학생이 해당과목을 평가를 했는지 확인
	List<EvaluationDomain> lectureEvaluationCheck(String userCode, String openSubjectCode);
	
	//강의평가 처리
	void evaluationAdd(String userCode, List<String> score, List<String> item, String openSubjectCode);

	
	
}
