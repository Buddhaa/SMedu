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
	/*현호*/
	//플래너 회원정보를 select, value값에 login 시 session에 저장된 userCode 입력 맵핑
		@RequestMapping(value="/plannerInfo")
		public String plannerSelectOne(Model model,
										@ModelAttribute(value="userInfo") UserDomain userDomain) {
			
		String userCode = userDomain.getUserCode();
		model.addAttribute("plannerInfo",plannerWorkService.getPlannerSelectOne(userCode));
		return "planner/mypage/mypage_planner_info";
		}
		
		//플래너 회원정보를 update 맵핑
		@RequestMapping(value="/updatePlannerInfo", method=RequestMethod.POST)
		public String plannerUpdate(PlannerDomain plannerDomain) {
			String userCode = plannerDomain.getUserCode();
			plannerWorkService.plannerUpdate(plannerDomain);	
			return "redirect:/plannerInfo?userCode="+userCode+"";
		}
		
		//학습설계 신청한 내용 담아서 답변 등록으로 이동
		@RequestMapping(value="/planner/work/planner_learningplan_response_insert", method = RequestMethod.GET)
		public String applicantSelectOne(Model model, @RequestParam(value="learningPlanCode") String learningPlanCode) {
			model.addAttribute("responseInsert", plannerWorkService.applicantSelectOne(learningPlanCode));
			return "planner/work/planner_learningplan_response_insert";							
		
		}
		
		//학습설계 답변 등록 처리
		@RequestMapping(value="/updateResponse", method = RequestMethod.POST)
		public String plannerLearningPlanResponseUpdate(LearningPlanDomain learningPlanDomain) {
			plannerWorkService.getPlannerLearningPlanResponseUpdate(learningPlanDomain);
			return "redirect:/planner/work/planner_learningplan_response_insert";
		}
		
		//학습설계 결과리스트(답변) 맵핑
		@RequestMapping(value="/planner/work/planner_learningplan_response", method = RequestMethod.GET)
		public String response(Model model) {
			model.addAttribute("responseList", plannerWorkService.getPlannerLearningPlanResponse());
			
			return "planner/work/planner_learningplan_response";
		}
		
		//학습설계 신청리스트(미답변) 맵핑
		@RequestMapping(value="/planner/work/planner_learningplan_nonresponse", method = RequestMethod.GET)
		public String nonresponse(Model model) {
			model.addAttribute("nonresponseList",plannerWorkService.getPlannerLearningPlanNonresponse());

			return "planner/work/planner_learningplan_nonresponse";
		}
		
		//플래너 상담 기록 입력 맵핑
		@RequestMapping(value="/planner/work/planner_consult_insert", method = RequestMethod.GET)
		public String plannerConsultInsert() {
			return "planner/work/planner_consult_insert";
		}
		
		//플래너 상담 기록 입력 처리 맵핑
		@RequestMapping(value="/planner/work/planner_consult_insert", method = RequestMethod.POST)
		public String plannerConsultInsert(PlanRecordDomain planRecordDomain) {
			plannerWorkService.getPlannerConsultInsert(planRecordDomain);
			return "redirect:/planner/work/planner_consult_insert";
		}
		
		//플래너 상담 기록 수정 맵핑
		@RequestMapping(value="/planner/work/planner_consult_update", method = RequestMethod.GET)
		public String plannerConsultUpdate() {
			return "planner/work/planner_consult_update";
		}
		
		//플래너 상담 리스트  맵핑 
		@RequestMapping(value="/planner/work/planner_consult_list", method = RequestMethod.GET) 
		public String consultList(Model model) {
			model.addAttribute("consultList", plannerWorkService.getPlannerConsultList());
			return "planner/work/planner_consult_list";
		}
		
		//플래너 담당학생 리스트  맵핑
		@RequestMapping(value="/planner/work/planner_student_list", method = RequestMethod.GET)
		public String studentList(Model model) {
			model.addAttribute("plannerStudentList", plannerWorkService.getPlannerStudentList());
			return "planner/work/planner_student_list";
		}
		
		//플래너 담당학생 상세보기
		@RequestMapping(value="/planner/work/planner_student_detail", method = RequestMethod.GET)
		public String studentDetail(Model model, @RequestParam(value="srcPlanStudentCode") String plannerStudentCode) {
			model.addAttribute("studentDetail", plannerWorkService.getPlannerStudentDetail(plannerStudentCode));
			model.addAttribute("plannerStudentCode", plannerStudentCode);
			return "planner/work/planner_student_detail";
		}
		/*진호*/
}
