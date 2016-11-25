package com.cyber.smedu.plannerwork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.academiccalendar.repository.AcademicCalendarDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.opensubject.repository.OpenSubjectDao;
import com.cyber.smedu.pay.repository.PayDao;
import com.cyber.smedu.plannerwork.domain.LearningPlanDomain;
import com.cyber.smedu.plannerwork.domain.PlanRecordDomain;
import com.cyber.smedu.plannerwork.domain.PlannerStudentDomain;
import com.cyber.smedu.plannerwork.repository.PlannerWorkDao;
import com.cyber.smedu.user.domain.PlannerDomain;
import com.cyber.smedu.user.domain.StudentDomain;

@Service
public class PlannerWorkServiceImpl implements PlannerWorkService {
	@Autowired
	private PlannerWorkDao plannerWorkDao;
	@Autowired
	private AcademicCalendarDao academicCalendarDao;
	@Autowired
	private OpenSubjectDao openSubjectDao;
	@Autowired
	private PayDao payDao;
	
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
    
	//학습설계 미답변목록
	@Override
	public List<LearningPlanDomain> getPlannerLearningPlanNonresponse(PlannerDomain plannerDomain) {
		String plannerCode = plannerDomain.getPlannerCode();
		List<LearningPlanDomain> nonresponse 
			= plannerWorkDao.selectPlannerLearningPlanNonresponse(plannerCode);
		return nonresponse;
	}
    
    
    //학습설계 신청내용
  	@Override
  	public LearningPlanDomain getApplicantSelectOne(String learningPlanCode) {
  		LearningPlanDomain learningPlan = plannerWorkDao.applicantSelectOne(learningPlanCode);	
  		return learningPlan;
  	}
    
    //학습설계 답변하기
	@Override
	public int getPlannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain) {
		return plannerWorkDao.plannerLearningPlanResponseUpdate(learningPlanDomain);
	}
	
	//학습설계 답변목록
	@Override
	public List<LearningPlanDomain> getPlannerLearningPlanResponse(PlannerDomain plannerDomain) {
		String plannerCode = plannerDomain.getPlannerCode();
		List<LearningPlanDomain> response
		= plannerWorkDao.selectPlannerLearningPlanResponse(plannerCode);
		return response;
	}
		
	//플래너 상담목록
	@Override
	public List<PlanRecordDomain> getPlannerConsultList() {
		List<PlanRecordDomain> consultList 
		= plannerWorkDao.selectPlannerConsultList();
		return consultList;	
	}

	//플래너 상담등록 
	@Override
	public int getPlannerConsultInsertSend(PlanRecordDomain planRecordDomain) {
		return plannerWorkDao.plannerConsultInsertSend(planRecordDomain);
	}

	
	//플래너 상담등록 할 때 학생찾기   
	@Override
	public List<PlannerStudentDomain> getStudentSearchView(String plannerCode) {
		List<PlannerStudentDomain> consultStudent
		= plannerWorkDao.getStudentSearchView(plannerCode);
		return consultStudent;
	}
	
	//플래너 상담등록 할 때 학생찾고 값 전달
	@Override
	public List<PlannerStudentDomain> sendStudentSearchView(PlanRecordDomain planRecordDomain) {
		List<PlannerStudentDomain> consultStudent
		= plannerWorkDao.sendStudentSearchView(planRecordDomain);
		return consultStudent;
	}
	
	//플래너 상담내역 가져오기
	@Override
  	public PlanRecordDomain getPlannerConsultInfo(String planCode) {
		PlanRecordDomain planRecord = plannerWorkDao.plannerConsultInfo(planCode);
  		return planRecord;
  	}
	
	//플래너 상담내역수정
	@Override
	public int getPlannerConsultUpdate(PlanRecordDomain planRecordDomain) {
		return plannerWorkDao.plannerConsultUpdate(planRecordDomain);
	}
	
	//플래너 담당학생 관리페이지
	@Override
	public Map<String, Object> plannerStudnetListCardinalSelectOpenSubjectList(String cardinalCode, String openSubjectCode, String departmentCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CardinalDomain> cardinalList = academicCalendarDao.plannerCardinalList(); //개강중인 기수 리스트
		map.put("cardinalCode", cardinalCode);
		map.put("departmentCode", departmentCode);
		List<OpenSubjectDomain> openSubjectList = openSubjectDao.plannerStudnetListCardinalSelectOpenSubjectList(map);
		if(!openSubjectCode.equals("")){
			map.put("openSubjectCode", openSubjectCode);
			List<StudentDomain> studentList = payDao.selectClassregistrationStudentList(map);
			map.put("studentList", studentList);
		}
		
		map.put("cardinalList", cardinalList);
		map.put("openSubjectList", openSubjectList);
		return map;
	}
	

	//플래너 담당학생 상세보기  
	@Override
	public List<PlannerStudentDomain> selectStudentDetail(String userCode) {
		List<PlannerStudentDomain> studentDomain
		= plannerWorkDao.selectStudentDetail(userCode);
		return studentDomain;
	}
	//진호
	//상담설계 입력
	@Override
	public int insertConsultingLearningPlan(LearningPlanDomain LearningPlanDomain) {
		return plannerWorkDao.insertConsultingLearningPlan(LearningPlanDomain);
	}
	
}
