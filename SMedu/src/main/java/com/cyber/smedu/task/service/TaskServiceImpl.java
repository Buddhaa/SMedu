package com.cyber.smedu.task.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.grade.repository.GradeDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.task.domain.TaskDomain;
import com.cyber.smedu.task.domain.TaskResultDomain;
import com.cyber.smedu.task.domain.TaskScoreDomain;
import com.cyber.smedu.task.repository.TaskDao;

@Service
public class TaskServiceImpl implements TaskService{

	@Autowired
	TaskDao taskDao;
	
	@Autowired
	GradeDao gradeDao;
	
	@Override
	public TaskResultDomain professorStudentTaskResultDetail(String studentCode) {
		
/*		System.out.println("02 professorStudentTaskResultDetail <-- TaskServiceImpl.java");
		System.out.println("studentCode : " + studentCode);*/
		
		TaskResultDomain taskResultDomain
			= taskDao.professorStudentTaskResultDetail(studentCode);
		
		return taskResultDomain;
		
	}
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForTask(String professorCode) {
		
		List<OpenSubjectDomain> openSubjectCode
			= taskDao.professorSubjectSelectForTask(professorCode);
		
		return openSubjectCode;		
	}
	
	@Override
	public TaskDomain professorTaskSelect(String openSubjectCode) {
		
		TaskDomain taskDomain
			= taskDao.professorTaskSelect(openSubjectCode);
		
		return taskDomain;		
	}
	
	@Override
	public void professorTaskUpdate(TaskDomain taskDomain) {
		taskDao.professorTaskUpdate(taskDomain);
	}
	
	@Override
	public void professorTaskInsert(TaskDomain taskDomain) {
		taskDao.professorTaskInsert(taskDomain);
	}
	
	@Override
	public void taskScoreAndParticipationUpdate(TaskScoreDomain taskScoreDomain) {
		taskDao.taskScoreAndParticipationUpdate(taskScoreDomain);
	}
	
	@Override
	public void taskMarkingInsert(TaskScoreDomain taskScoreDomain) {
		taskDao.taskMarkingInsert(taskScoreDomain);
	}
	
	@Override
	public void finalGradeUpdateForTask(TaskScoreDomain taskScoreDomain) {
		taskDao.finalGradeUpdateForTask(taskScoreDomain);
	}
	
	@Override
	public TaskScoreDomain professorTaskScoreAndCodeSelect(GradeDomain gradeDomain) {
		TaskScoreDomain taskScoreDomain
			= taskDao.professorTaskScoreAndCodeSelect(gradeDomain);
		return taskScoreDomain;		
	}
	//우영
	
	@Override
	public Map<String, Object> oneTaskView(String userCode, String openSubjectCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//과제 참여에서 과목 선택시 주제 내용 받아오기
		TaskDomain oneTaskView = taskDao.oneTaskView(openSubjectCode);
		map.put("taskList", oneTaskView);		
		
		if(oneTaskView == null){
			//과제 제출목록으로 페이지 이동시 null값

		}else{
			//과제 제출목록에서 과목을 선택시
			
			//이미 제출을 했으면 제출한 목록을 받아오기
			
			String taskCode = oneTaskView.getTaskCode();
			String studentCode = gradeDao.studentCode(userCode).getStudentCode();
			
			//과제를 제출한적이 있나 확인을 위해 객체를 생성
			TaskResultDomain taskResultDomain = new TaskResultDomain();
			
			taskResultDomain.setStudentCode(studentCode);
			taskResultDomain.setTaskCode(taskCode);
			
			System.out.println("taskResultDomain : " + taskResultDomain.toString());
			

			//과제를 제출한적이 있다고 하면 받아오기
			TaskResultDomain studentTaskResultCheck = taskDao.studentTaskResultCheck(taskResultDomain);
			
			map.put("taskResultList", studentTaskResultCheck);
		}
		
		
		System.out.println("map : " + map);
		return map;
	}

	
	
	
	@Override
	public String taskResultAddCheck(String userCode, TaskResultDomain taskResultDomain) {
		//학생이 과제 업로드시 이미 해당과목의 과제를 업로드한 사람인지 체크
		
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		taskResultDomain.setStudentCode(studentCode);
		
		TaskResultDomain taskResultAddCheck = taskDao.studentTaskResultCheck(taskResultDomain);
		
		if(taskResultAddCheck != null){
			
			return "과제를 이미 제출했습니다.";		
		}
		
		return null;
	}
	
	
	
	
	@Override
	public void taskResultAdd(String userCode, TaskResultDomain taskResultDomain, HttpServletRequest request) {
	
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		
		UUID uuid = UUID.randomUUID();
		String taskFileName = uuid.toString().replace("-", "");
		String taskFileExt = taskResultDomain.getTaskFile().getOriginalFilename().substring(taskResultDomain.getTaskFile().getOriginalFilename().lastIndexOf('.')+1).toLowerCase();
		long taskFileSize = taskResultDomain.getTaskFile().getSize();
		String taskFileType = taskResultDomain.getTaskFile().getContentType();
		String taskOriginFileName= taskResultDomain.getTaskFile().getOriginalFilename();
		
		taskResultDomain.setTaskFileName(taskFileName);
		taskResultDomain.setTaskFileExt(taskFileExt);
		taskResultDomain.setTaskFileSize(taskFileSize);
		taskResultDomain.setTaskFileType(taskFileType);
		taskResultDomain.setStudentCode(studentCode);
		taskResultDomain.setTaskOriginFileName(taskOriginFileName);
		
		//파일 저장 서버 배포용
		String uploadPath = request.getSession().getServletContext().getRealPath("/") +"resources/taskUpload/";
		
		
		/*//파일 저장 개인 테스트용
		String uploadPath = "C:\\Users\\202-24\\git\\SMedu\\SMedu\\src\\main\\webapp\\resources\\taskUpload";*/
				
		//파일 이름
		String saveFileName= uploadPath + "\\" + taskOriginFileName;
		
		/*새로운 파일 File생성 api이용*/
		File saveFile = new File(saveFileName);
		
		/*파일이름을 폴더 아래에 저장하세요.. 메서드*/
		try {
			taskResultDomain.getTaskFile().transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//학생이 과제 업로드시 
		System.out.println("taskResultDomain : " + taskResultDomain.toString());
		
		taskDao.taskResultAdd(taskResultDomain);
		
		
	}



	//학생이 과제제출을 수정하기 위해 과제 링크를 클릭했을때
	@Override
	public TaskResultDomain taskSubmitUpdateDetail(String taskResultCode) {
		
		//하나의 과제제출 리스트 받아오기
		TaskResultDomain taskSubmitUpdateDetail = taskDao.taskSubmitUpdateDetail(taskResultCode);
		
		return taskSubmitUpdateDetail;
	}




	//학생이 과제를 수정하기 버튼을 눌렀을때 업데이트 처리
	@Override
	public void taskResultUpdate(TaskResultDomain taskResultDomain, HttpServletRequest request) {
		
		
				
		//파일을 다시 업로드 시킬 경우 기존에 있던 파일은 삭제
		if(!taskResultDomain.getTaskFile().getOriginalFilename().equals("")){
			/*//파일 저장 개인 테스트
			String uploadPath = "C:\\Users\\202-24\\git\\SMedu\\SMedu\\src\\main\\webapp\\resources\\taskUpload";*/
			
			//파일 저장 서버 배포용
			String uploadPath = request.getSession().getServletContext().getRealPath("/") +"resources/taskUpload/";
			
			//삭제할 파일이름을 가져온다.
			String deleteOriginFileName = taskResultDomain.getTaskOriginFileName();
			String deleteFile = uploadPath + "\\" + deleteOriginFileName;
			
			//삭제시킬 파일의 이름으로 파일을 만들어서 삭제처리
			File delFile = new File(deleteFile);
			delFile.delete();
			
			//새로 업로드될 파일을 추가한다.
			UUID uuid = UUID.randomUUID();
			String taskFileName = uuid.toString().replace("-", "");
			String taskFileExt = taskResultDomain.getTaskFile().getOriginalFilename().substring(taskResultDomain.getTaskFile().getOriginalFilename().lastIndexOf('.')+1).toLowerCase();
			long taskFileSize = taskResultDomain.getTaskFile().getSize();
			String taskFileType = taskResultDomain.getTaskFile().getContentType();
			String taskOriginFileName= taskResultDomain.getTaskFile().getOriginalFilename();
			
			taskResultDomain.setTaskFileName(taskFileName);
			taskResultDomain.setTaskFileExt(taskFileExt);
			taskResultDomain.setTaskFileSize(taskFileSize);
			taskResultDomain.setTaskFileType(taskFileType);
			taskResultDomain.setTaskOriginFileName(taskOriginFileName);
			
			//저장	
			String saveFileName= uploadPath + "\\" + taskOriginFileName;
			
			
			//새로운 파일 File생성 api이용
			File saveFile = new File(saveFileName);
			
			//파일이름을 폴더 아래에 저장하세요.. 메서드
			try {
				taskResultDomain.getTaskFile().transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			System.out.println(taskResultDomain.toString());
			
			//업데이트 내용 db에 저장
			taskDao.taskResultFullUpdate(taskResultDomain);
			
			
		}else{
			//파일 업로드는 안하고 내용만 변경할 경우
			taskDao.taskResultContentUpdate(taskResultDomain);		
			
		}	
	}
}
