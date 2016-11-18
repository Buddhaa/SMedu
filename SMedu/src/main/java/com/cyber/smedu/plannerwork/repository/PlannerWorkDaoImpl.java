package com.cyber.smedu.plannerwork.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.plannerwork.domain.LearningPlanDomain;
import com.cyber.smedu.plannerwork.domain.PlanRecordDomain;
import com.cyber.smedu.plannerwork.domain.PlannerStudentDomain;
import com.cyber.smedu.user.domain.PlannerDomain;

@Repository
public class PlannerWorkDaoImpl implements PlannerWorkDao {
	
	private final String NS = "com.cyber.smedu.mapper.PlannerWorkMapper";
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	//한명의 플래너 회원정보 select
	@Override
	public PlannerDomain plannerSelectOne(String userCode) {
		return sessionTemplate.selectOne(NS+".plannerSelectOne", userCode);
	}
	
	//플래너 회원정보 update
	@Override
	public void plannerUpdate(PlannerDomain plannerDomain) {
		sessionTemplate.update(NS+".plannerUpdate", plannerDomain);
	}

	//한명의 신청자가 학습설계를 신청한 내용 
	@Override
	public LearningPlanDomain applicantSelectOne(String learningPlanCode) {
		return sessionTemplate.selectOne(NS+".applicantSelectOne", learningPlanCode);
	}
		
	//학습설계 답변 등록 처리
	@Override
	public int plannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain) {
		return sessionTemplate.update(NS+".plannerLearningPlanResponseUpdate",learningPlanDomain);
	}
	
	//학습설계 결과리스트(답변) 검색
	@Override
	public List<LearningPlanDomain> selectPlannerLearningPlanResponse() {
		return sessionTemplate.selectList(NS+".selectPlannerLearningPlanResponse");		
	}
	
	//학습설계 결과리스트(미답변) 검색
	@Override
	public List<LearningPlanDomain> selectPlannerLearningPlanNonresponse() {
		return sessionTemplate.selectList(NS+".selectPlannerLearningPlanNonresponse");
	}
	
	//플래너 상담 기록 입력
	@Override
	public int plannerConsultInsert(PlanRecordDomain planRecordDomain) {
		return sessionTemplate.insert(NS+".plannerConsultInsert", planRecordDomain);
	}
	
	//플래너 상담 기록 수정
	@Override
	public int plannerConsultUpdate(PlanRecordDomain planRecordDomain) {
		return sessionTemplate.update(NS+".plannerConsultUpdate", planRecordDomain);
	}

	//플래너 상담 리스트 
	@Override
	public List<PlanRecordDomain> selectPlannerConsultList() {
		return sessionTemplate.selectList(NS+".selectPlannerConsultList");	
	}
	//플래너 담당학생 리스트 
	@Override
	public List<PlannerStudentDomain> selectPlannerStudentList() {
		return sessionTemplate.selectList(NS+".selectPlannerStudentList");
	}
	//플래너 담당학생 상세보기
	@Override
	public List<PlannerStudentDomain> selectPlannerStudentDetail(String plannerStudentCode) {
		return sessionTemplate.selectList(NS+".selectPlannerStudentDetail", plannerStudentCode);
	}	
	//진호
	//맞춤학습설계 등록
	@Override
	public int insertConsultingLearningPlan(LearningPlanDomain LearningPlanDomain) {
		return sessionTemplate.insert(NS+".insertConsultingLearningPlan", LearningPlanDomain);
	}
	//현호
	
}
