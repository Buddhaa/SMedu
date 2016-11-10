package com.cyber.smedu.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.opensubject.service.OpenSubjectService;
import com.cyber.smedu.task.domain.TaskResultDomain;
import com.cyber.smedu.task.service.TaskService;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class TaskController {

	@Autowired
	TaskService taskService;
	
	@Autowired 
	OpenSubjectService openSubjectService;
	
	//교수 담당학생 과제제출물 상세보기 페이지로 이동(select)
	@RequestMapping(value="/professorStudentTaskResultDetail")
	public String professorStudentTaskResultDetail(Model model, String studentCode) {
		
		System.out.println("01 professorStudentTaskResultDetail <-- TaskController.java");
		//System.out.println("studentCode : " + studentCode);
		
		model.addAttribute("professorStudentTaskResult", taskService.professorStudentTaskResultDetail(studentCode));

		return "professor/management/management_task_submit_detail";	
	}
	//우영
	
	//과제 참여 페이지 이동시 
		@RequestMapping(value = "/classroomTaskJoin", method = RequestMethod.GET)
		public String classroomDebateJoin(Model model
										,@ModelAttribute(value="userInfo") UserDomain userDomain
										,@RequestParam(value="openSubjectCode", defaultValue="") String openSubjectCode){
			
			String userCode = userDomain.getUserCode();
			
			//과제 참여 페이지 이동시 -> 과목선택 가져오기
			model.addAttribute("openSubjectSelect", openSubjectService.classroomAcademicaCtivity(userCode));
			
			//과제 참여 페이지에서 과목 선택시 -> 과제주제,내용 보여주기 제출버튼, 제출목록
			model.addAttribute("oneTaskView", taskService.oneTaskView(userCode, openSubjectCode));
		
			return "student/classroom/classroom_task_join";
		}
		
		
		//학생이 과제 업로드시 
		@RequestMapping(value="/taskResultAdd", method = RequestMethod.POST)
		public String taskResultAdd(Model model
									,TaskResultDomain taskResultDomain
									,@ModelAttribute(value="userInfo") UserDomain userDomain){
			
			
			String userCode = userDomain.getUserCode();
			
			//1. 과제 업로드시 이미 업로드가 된 학생인가 체크
			String check = taskService.taskResultAddCheck(userCode, taskResultDomain);
			
			if(check == null){
				
				taskService.taskResultAdd(userCode, taskResultDomain);
				
				return"redirect:/classroomTaskJoin";
		
			}else{
				
				model.addAttribute("check", check);
				
				return"student/classroom/classroom_task_join";
			}		
			
		}
		
		
		//학생이 과제제출을 수정하기 위해 과제 링크를 클릭했을때
		@RequestMapping(value="/taskSubmitUpdate",method=RequestMethod.GET)
		public String taskSubmitUpdateDetail(Model model
											,@RequestParam(value="taskResultCode") String taskResultCode){
			
			model.addAttribute("taskSubmitUpdateDetail",taskService.taskSubmitUpdateDetail(taskResultCode));
			
			return "student/classroom/classroom_task_submit_update";
		}
		
		
		//학생이 과제를 수정하기 버튼을 눌렀을때 업데이트 처리
		@RequestMapping(value="/taskResultUpdate", method=RequestMethod.POST)
		public String taskResultUpdate(TaskResultDomain taskResultDomain){
			
			taskService.taskResultUpdate(taskResultDomain);
			
			return "redirect:/classroomTaskJoin";
			
		}
		//장용
	

}
