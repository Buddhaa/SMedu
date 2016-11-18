package com.cyber.smedu.plannerwork.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.plannerwork.domain.LearningPlanDomain;
import com.cyber.smedu.plannerwork.domain.PlanRecordDomain;
import com.cyber.smedu.plannerwork.domain.PlannerStudentDomain;
import com.cyber.smedu.user.domain.PlannerDomain;

public interface PlannerWorkService {
	
	public PlannerDomain getPlannerSelectOne(String userCode);
	
	void plannerUpdate(PlannerDomain plannerDomain);
	
	void getPlannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain);
	
	void getPlannerConsultInsert(PlanRecordDomain planRecordDomain);
	
	void getPlannerConsultUpdate(PlanRecordDomain planRecordDomain);
	
	public List<PlannerStudentDomain> getPlannerStudentDetail(String planStudentCode);

	List<LearningPlanDomain> getPlannerLearningPlanNonresponse();

	List<LearningPlanDomain> getPlannerLearningPlanResponse();

	List<PlannerStudentDomain> getPlannerStudentList();

	List<PlanRecordDomain> getPlannerConsultList();

	Map<String, Object> applicantSelectOne(String learningPlanCode);

	int insertConsultingLearningPlan(LearningPlanDomain LearningPlanDomain);
	
	
}
