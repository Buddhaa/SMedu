package com.cyber.smedu.evaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.evaluation.domain.EvaluationCategoryDomain;
import com.cyber.smedu.evaluation.domain.EvaluationDomain;
import com.cyber.smedu.evaluation.repository.EvaluationDao;
import com.cyber.smedu.grade.repository.GradeDao;

@Service
public class EvaluationServiceImpl implements EvaluationService {

	@Autowired
	EvaluationDao evaluationDao;
	
	@Autowired
	GradeDao gradeDao;
	
	//////////////////11.10 입력
	
	//학생의 강의평가 페이지에서 과목을 선택시
	@Override
	public List<EvaluationCategoryDomain> lectureEvaluationItemsList() {
		
		return evaluationDao.lectureEvaluationItemsList();
	}
	
	//학생이 해당과목을 평가를 했는지 확인
	@Override
	public List<EvaluationDomain> lectureEvaluationCheck(String userCode, String openSubjectCode) {
		
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		
		EvaluationDomain evaluationDomain= new EvaluationDomain();
		
		evaluationDomain.setStudentCode(studentCode);
		evaluationDomain.setOpenSubjectCode(openSubjectCode);
		
		List<EvaluationDomain> lectureEvaluationCheck = evaluationDao.lectureEvaluationCheck(evaluationDomain);
		
		System.out.println(lectureEvaluationCheck.toString());
		
		
		return lectureEvaluationCheck;		
	
	}

	
	//강의평가 처리
	@Override
	public void evaluationAdd(String userCode, List<String> arr, List<String> item, String openSubjectCode) {
	
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		
		EvaluationDomain evaluationDomain= new EvaluationDomain();
		
		evaluationDomain.setStudentCode(studentCode);
		evaluationDomain.setOpenSubjectCode(openSubjectCode);
		
		for(int i=0; i<arr.size(); i++){
			evaluationDomain.setLectureEvaluationScore(Integer.parseInt(arr.get(i)));
			evaluationDomain.setLectureEvaluationItemsCode(item.get(i));
			
			evaluationDao.evaluationAdd(evaluationDomain);
		}
	}


	
}
