package com.cyber.smedu.plannerwork.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.curriculum.service.CurriculumService;
import com.cyber.smedu.plannerwork.domain.LearningPlanDomain;
import com.cyber.smedu.plannerwork.domain.PlanRecordDomain;
import com.cyber.smedu.plannerwork.service.PlannerWorkService;
import com.cyber.smedu.user.domain.PlannerDomain;
import com.cyber.smedu.user.domain.UserDomain;

@SessionAttributes({"userInfo", "userPlusInfo"})
@Controller
public class PlannerWorkController {
	
	@Autowired CurriculumService curriculumService;
	
	@Autowired
	private PlannerWorkService plannerWorkService;
	
	//학습설계 입력페이지
	@RequestMapping(value = "/smedu/consulting/consultingLearningPlanInsert", method = RequestMethod.GET)
	public String adminLoginForm(Model model) {
		Map<String, Object> map = curriculumService.selectDepartmentList();
		model.addAttribute("departmentList", map.get("departmentList"));
		return "smedu/consulting/consulting_learning_plan_insert";
	}
	//학습설계 입력처리
	@RequestMapping(value = "/smedu/consulting/consultingLearningPlanInsert", method = RequestMethod.POST)
	public String consultingLearningPlanInsert(LearningPlanDomain LearningPlanDomain) {
		plannerWorkService.insertConsultingLearningPlan(LearningPlanDomain);
		return "redirect:/smedu/consulting/consultingLearningPlanInsert";
	}
	/*현호*/
	//플래너 회원정보를 select, value값에 login 시 session에 저장된 userCode 입력 
	@RequestMapping(value="/plannerInfo")
	public String plannerSelectOne(Model model,
									@ModelAttribute(value="userInfo") UserDomain userDomain) {
		
	String userCode = userDomain.getUserCode();
	model.addAttribute("plannerInfo",plannerWorkService.getPlannerSelectOne(userCode));
	return "planner/mypage/mypage_planner_info";
	}
	
	//플래너 회원정보를 update 
	@RequestMapping(value="/updatePlannerInfo", method=RequestMethod.POST)
	public String plannerUpdate(PlannerDomain plannerDomain) {
		String userCode = plannerDomain.getUserCode();
		plannerWorkService.plannerUpdate(plannerDomain);	
		return "redirect:/smedu/main/main?userCode="+userCode+"";
	}
	
	//학습설계 미답변목록 
	@RequestMapping(value="/planner/work/planner_learningplan_nonresponse", method = RequestMethod.GET)
	public String nonresponse(Model model,
			@ModelAttribute(value="userPlusInfo") PlannerDomain plannerDomain){
		model.addAttribute("nonresponseList",plannerWorkService.getPlannerLearningPlanNonresponse(plannerDomain));
	
		return "planner/work/planner_learningplan_nonresponse";
	}
	
	
	//학습설계 신청내용
	@RequestMapping(value="/planner/work/planner_learningplan_response_insert", method = RequestMethod.GET)
	public String applicantSelectOne(Model model,
			@ModelAttribute(value="learningPlanCode") LearningPlanDomain learningPlanDomain) {
		String learningPlanCode = learningPlanDomain.getLearningPlanCode();
		model.addAttribute("responseInsert", plannerWorkService.getApplicantSelectOne(learningPlanCode));
		return "planner/work/planner_learningplan_response_insert";							
	
	}
	
	//학습설계 답변하기
	@RequestMapping(value="/planner/work/planner_learningplan_response_insert", method = RequestMethod.POST)
	public String plannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain) {
	String learningPlanCode = learningPlanDomain.getLearningPlanCode();
	plannerWorkService.getPlannerLearningPlanResponseUpdate(learningPlanDomain);
		return "redirect:/planner/work/planner_learningplan_response?learningPlanCode="+learningPlanCode+"";
	}
	
	
	//학습설계 답변목록 
	@RequestMapping(value="/planner/work/planner_learningplan_response", method = RequestMethod.GET)
	public String response(Model model,
			@ModelAttribute(value="userPlusInfo") PlannerDomain plannerDomain){
		model.addAttribute("responseList", plannerWorkService.getPlannerLearningPlanResponse(plannerDomain));
		
		return "planner/work/planner_learningplan_response";
	}
	
	//플래너 상담목록   
	@RequestMapping(value="/planner/work/planner_consult_list", method = RequestMethod.GET) 
	public String consultList(Model model) {
		model.addAttribute("consultList", plannerWorkService.getPlannerConsultList());
		return "planner/work/planner_consult_list";
	}
	
	//플래너 상담등록 
	@RequestMapping(value="/planner/work/planner_consult_insert", method = RequestMethod.GET)
	public String plannerConsultInsert(PlanRecordDomain planRecordDomain) {
//				plannerWorkService.getPlannerConsultInsert(planRecordDomain);
		return "planner/work/planner_consult_insert";
	}
	
	//플래너 상담등록 처리
	@RequestMapping(value="/planner/work/planner_consult_list", method = RequestMethod.POST)
	public String plannerConsultInsertSend(PlanRecordDomain planRecordDomain) {
		plannerWorkService.getPlannerConsultInsertSend(planRecordDomain);
		return "redirect:/planner/work/planner_consult_list";
	}
	
	
	//플래너 상담등록 할 때 학생찾기   
	@RequestMapping(value="/studentSearchView", method = RequestMethod.GET)
	public String getStudentSearchView(Model model, 
			@ModelAttribute(value="userPlusInfo") PlannerDomain plannerDomain) {
		String plannerCode = plannerDomain.getPlannerCode();
		System.out.println("플래너 상담등록 할 때 학생찾기 <---" +plannerCode);
		model.addAttribute("searchView", plannerWorkService.getStudentSearchView(plannerCode));
		return "planner/work/planner_consult_search";
	}
		
	//플래너 상담등록 할 때 학생찾고 값 전달
	@RequestMapping(value="/planner/work/planner_consult_search", method = RequestMethod.POST)
	public String sendStudentSearchView(PlannerDomain plannerDomain) {
		String plannerCode = plannerDomain.getPlannerCode();
//				plannerWorkService.sendStudentSearchView(plannerDomain);
		System.out.println("플래너 상담등록 할 때 학생찾고 값 전달 <---" +plannerCode);
		return "planner/work/planner_consult_insert";
//				return "redirect:/planner/work/planner_consult_insert?plannerCode="+plannerCode+"";
	}
	
	//플래너 상담내역 가져오기
	@RequestMapping(value="/planner/work/planner_consult_update", method = RequestMethod.GET)
	public String plannerConsultInfo(Model model,
			@ModelAttribute(value="planCode") PlanRecordDomain planRecordDomain) {
		String planCode = planRecordDomain.getPlanCode();
		model.addAttribute("consultUpdate", plannerWorkService.getPlannerConsultInfo(planCode));
		return "planner/work/planner_consult_update";								
	}	

	//플래너 상담내역 수정 
	@RequestMapping(value="/planner/work/planner_consult_update ", method = RequestMethod.POST)
	public String plannerConsultUpdate(PlanRecordDomain planRecordDomain) {
	String planCode = planRecordDomain.getPlanCode();
	plannerWorkService.getPlannerConsultUpdate(planRecordDomain);
		return "redirect:/planner/work/planner_consult_update?planCode="+planCode+"";
	}
	
	//플래너 담당학생 관리페이지
	@RequestMapping(value="/planner/work/planner_student_list",  method = RequestMethod.GET) 
	public String plannerStudnetListCardinalSelectOpenSubjectList(Model model,
			@RequestParam(value="cardinalCode", defaultValue="") String cardinalCode,
			@RequestParam(value="openSubjectCode", defaultValue="") String openSubjectCode,
			@ModelAttribute(value="userInfo")UserDomain user) {
			String departmentCode = user.getDepartmentCode();
			Map<String, Object> map = plannerWorkService.plannerStudnetListCardinalSelectOpenSubjectList(cardinalCode, openSubjectCode, departmentCode);
			
			model.addAttribute("cardinalList", map.get("cardinalList")); //개강중인 기수 리스트
			model.addAttribute("cardinalCode", cardinalCode); //선택한 기수코드 저장
			
			model.addAttribute("openSubjectList", map.get("openSubjectList")); //기수 선택시 개설되있는 개설과목 리스트
			model.addAttribute("openSubjectCode", openSubjectCode); //선택한 개설과목코드 저장
			
			if(!openSubjectCode.equals("")) {
				model.addAttribute("studentList", map.get("studentList")); //개설 과목 선택시 학생리스트
			}	
			
			return "planner/work/planner_student_list";
	}

	
	//플래너 담당학생 상세보기
	@RequestMapping(value="/planner/work/planner_student_detail")
	public String selectStudentDetail(Model model,
			@RequestParam(value="studentCode") String studentCode, 
			@RequestParam(value="openSubjectCode") String openSubjectCode,
			@RequestParam(value="cardinalCode") String cardinalCode) {
		Map<String, Object> map = plannerWorkService.selectStudentDetail(studentCode, openSubjectCode, cardinalCode);
		model.addAttribute("cardinalDomain", map.get("cardinalDomain"));
		model.addAttribute("openSubjectDomain", map.get("openSubjectDomain"));
		model.addAttribute("userDomain", map.get("userDomain"));
		model.addAttribute("academicCalendarList", map.get("academicCalendarList"));
		model.addAttribute("attendList", map.get("attendList"));
		model.addAttribute("taskResultDomain", map.get("taskResultDomain"));
		model.addAttribute("debateList", map.get("debateList"));		
			
		return "planner/work/planner_student_detail";			
	}
		/*진호*/
}
