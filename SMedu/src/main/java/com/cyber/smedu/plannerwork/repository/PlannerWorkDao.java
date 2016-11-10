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

	public List<LearningPlanDomain> selectPlannerLearningPlanResponse();

	public int plannerConsultInsert(PlanRecordDomain planRecordDomain);
	
	public int plannerConsultUpdate(PlanRecordDomain planRecordDomain);
	
	public List<PlannerStudentDomain> selectPlannerStudentDetail(String planStudentCode);

	List<LearningPlanDomain> selectPlannerLearningPlanNonresponse();

	List<PlannerStudentDomain> selectPlannerStudentList();

	List<PlanRecordDomain> selectPlannerConsultList();

	LearningPlanDomain applicantSelectOne(String learningPlanCode);
	
}
