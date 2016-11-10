package com.cyber.smedu.plannerwork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.plannerwork.domain.LearningPlanDomain;
import com.cyber.smedu.plannerwork.domain.PlanRecordDomain;
import com.cyber.smedu.plannerwork.domain.PlannerStudentDomain;
import com.cyber.smedu.plannerwork.repository.PlannerWorkDao;
import com.cyber.smedu.user.domain.PlannerDomain;

@Service
public class PlannerWorkServiceImpl implements PlannerWorkService {
	@Autowired
	private PlannerWorkDao plannerWorkDao;
	
	//한명의 플래너 회원정보 select
    @Override
    public PlannerDomain getPlannerSelectOne(String userCode) {
    	PlannerDomain planner = plannerWorkDao.plannerSelectOne(userCode);
    	return planner;
    }
    
    //플래너 회원정보 update
    @Override
    public void plannerUpdate(PlannerDomain plannerDomain) {
    	plannerWorkDao.plannerUpdate(plannerDomain);
    }
    
    //학습설계 신청한 내용 담아서 답변 등록으로 이동
  	@Override
  	public Map<String,Object> applicantSelectOne(String learningPlanCode) {
  		Map<String,Object> map = new HashMap<String,Object>();
  		LearningPlanDomain learningPlan = plannerWorkDao.applicantSelectOne(learningPlanCode);	
  		map.put("learningPlan", learningPlan);
  		return map;
  	}
    
    //학습설계 답변 등록 처리
	@Override
	public void getPlannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain) {
		plannerWorkDao.plannerLearningPlanResponseUpdate(learningPlanDomain);
		
	}
	
	//학습설계 결과리스트(답변) 검색
	@Override
	public List<LearningPlanDomain> getPlannerLearningPlanResponse() {
		List<LearningPlanDomain> response
		= plannerWorkDao.selectPlannerLearningPlanResponse();
		return response;
	}
	
	//학습설계 신청리스트(미답변) 검색
	@Override
	public List<LearningPlanDomain> getPlannerLearningPlanNonresponse() {
		List<LearningPlanDomain> nonresponse 
		= plannerWorkDao.selectPlannerLearningPlanNonresponse();
		return nonresponse;
	}
	
	//플래너 상담 기록 입력 
	@Override
	public void getPlannerConsultInsert(PlanRecordDomain planRecordDomain) {
		plannerWorkDao.plannerConsultInsert(planRecordDomain);	
	}
	
	//플래너 상담 기록 수정
	@Override
	public void getPlannerConsultUpdate(PlanRecordDomain planRecordDomain) {
		plannerWorkDao.plannerConsultUpdate(planRecordDomain);
	}
	
	//플래너 상담 리스트 
	@Override
	public List<PlanRecordDomain> getPlannerConsultList() {
		List<PlanRecordDomain> consultList 
		= plannerWorkDao.selectPlannerConsultList();
		return consultList;	
	}
	//플래너 담당학생 리스트
	@Override
	public List<PlannerStudentDomain> getPlannerStudentList() {
		List<PlannerStudentDomain> studentList
		= plannerWorkDao.selectPlannerStudentList();
		return studentList;
	}
	//플래너 담당학생 상세보기  
	@Override
	public List<PlannerStudentDomain> getPlannerStudentDetail(String plannerStudentCode) {
		List<PlannerStudentDomain> studentDetail
		= plannerWorkDao.selectPlannerStudentDetail(plannerStudentCode);
		return studentDetail;
	}
}
