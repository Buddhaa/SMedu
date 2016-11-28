package com.cyber.smedu.plannerwork.repository;

import java.util.List;

import com.cyber.smedu.plannerwork.domain.LearningPlanDomain;
import com.cyber.smedu.plannerwork.domain.PlanRecordDomain;
import com.cyber.smedu.plannerwork.domain.PlannerStudentDomain;
import com.cyber.smedu.user.domain.PlannerDomain;

public interface PlannerWorkDao {
	
	public PlannerDomain plannerSelectOne(String userCode);
	
	void plannerUpdate(PlannerDomain plannerDomain);
	
	public int plannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain);
	
	public int plannerConsultUpdate(PlanRecordDomain planRecordDomain);

	List<PlanRecordDomain> selectPlannerConsultList();

	LearningPlanDomain applicantSelectOne(String learningPlanCode);

	int insertConsultingLearningPlan(LearningPlanDomain LearningPlanDomain);

	List<LearningPlanDomain> selectPlannerLearningPlanNonresponse(String plannerCode);

	List<LearningPlanDomain> selectPlannerLearningPlanResponse(String plannerCode);

	int plannerConsultInsertSend(PlanRecordDomain planRecordDomain);

	List<PlannerStudentDomain> getStudentSearchView(String plannerCode);

	List<PlannerStudentDomain> sendStudentSearchView(PlanRecordDomain planRecordDomain);

	PlanRecordDomain plannerConsultInfo(String planCode);

	PlannerStudentDomain plannerCardinalSelect(String cardinalCode);

	
}
