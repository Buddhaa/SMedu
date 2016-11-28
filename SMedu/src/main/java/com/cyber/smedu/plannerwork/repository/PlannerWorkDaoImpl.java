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

		//학습설계 미답변목록
		@Override
		public List<LearningPlanDomain> selectPlannerLearningPlanNonresponse(String plannerCode) {
			return sessionTemplate.selectList(NS+".selectPlannerLearningPlanNonresponse", plannerCode);
		}
		
		//학습설계 신청내용
		@Override
		public LearningPlanDomain applicantSelectOne(String learningPlanCode) {
			return sessionTemplate.selectOne(NS+".applicantSelectOne", learningPlanCode);
		}
			
		//학습설계 답변하기
		@Override
		public int plannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain) {
			return sessionTemplate.update(NS+".plannerLearningPlanResponseUpdate",learningPlanDomain);
		}
			
		
		//학습설계 답변목록
		@Override
		public List<LearningPlanDomain> selectPlannerLearningPlanResponse(String plannerCode) {
			return sessionTemplate.selectList(NS+".selectPlannerLearningPlanResponse", plannerCode);		
		}
		
		//플래너 상담목록
		@Override
		public List<PlanRecordDomain> selectPlannerConsultList() {
			return sessionTemplate.selectList(NS+".selectPlannerConsultList");	
		}
		
		//플래너 상담등록 
		@Override
		public int plannerConsultInsertSend(PlanRecordDomain planRecordDomain) {
			return sessionTemplate.insert(NS+".plannerConsultInsertSend", planRecordDomain);
		}
		
		//플래너 상담등록 할 때 학생찾기   
		@Override
		public List<PlannerStudentDomain> getStudentSearchView(String plannerCode) {
			return sessionTemplate.selectList(NS+".getStudentSearchView", plannerCode);
		}
		//플래너 상담등록 할 때 학생찾고 값 전달
		@Override
		public List<PlannerStudentDomain> sendStudentSearchView(PlanRecordDomain planRecordDomain) {
			return sessionTemplate.selectList(NS+".sendStudentSearchView", planRecordDomain);
		}
			
		
		//플래너 상담내역 가져오기 
		@Override
		public PlanRecordDomain plannerConsultInfo(String planCode) {
			return sessionTemplate.selectOne(NS+".plannerConsultInfo", planCode);
		}
		
		//플래너 상담내역 수정
		@Override
		public int plannerConsultUpdate(PlanRecordDomain planRecordDomain) {
			return sessionTemplate.update(NS+".plannerConsultUpdate", planRecordDomain);
		}

		//플래너가 기수를 선택해서 그 기수에 해당하는 학생 선택
		@Override
		public PlannerStudentDomain plannerCardinalSelect(String cardinalCode) {
			return sessionTemplate.selectOne(NS+".plannerCardinalSelect", cardinalCode);
		}
		
	
		//진호
		
		//맞춤학습설계 등록
		@Override
		public int insertConsultingLearningPlan(LearningPlanDomain LearningPlanDomain) {
			return sessionTemplate.insert(NS+".insertConsultingLearningPlan", LearningPlanDomain);
		}
		//현호
	
}
