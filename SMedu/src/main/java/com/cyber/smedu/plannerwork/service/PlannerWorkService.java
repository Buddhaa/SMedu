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

	int insertConsultingLearningPlan(LearningPlanDomain LearningPlanDomain);

	List<LearningPlanDomain> getPlannerLearningPlanNonresponse(PlannerDomain plannerDomain);

	LearningPlanDomain getApplicantSelectOne(String learningPlanCode);

	List<LearningPlanDomain> getPlannerLearningPlanResponse(PlannerDomain plannerDomain);

	int getPlannerConsultInsertSend(PlanRecordDomain planRecordDomain);

	List<PlannerStudentDomain> getStudentSearchView(String plannerCode);

	List<PlannerStudentDomain> sendStudentSearchView(PlanRecordDomain planRecordDomain);

	PlanRecordDomain getPlannerConsultInfo(String planCode);

	Map<String, Object> plannerStudnetListCardinalSelectOpenSubjectList(String cardinalCode, String openSubjectCode,
			String departmentCode);


	int getPlannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain);

	List<PlanRecordDomain> getPlannerConsultList();

	int getPlannerConsultUpdate(PlanRecordDomain planRecordDomain);

	Map<String, Object> selectStudentDetail(String studentCode, String openSubjectCode, String cardinalCode);
	
	
}
