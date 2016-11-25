package com.cyber.smedu.task.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.task.domain.TaskDomain;
import com.cyber.smedu.task.domain.TaskResultDomain;
import com.cyber.smedu.task.domain.TaskScoreDomain;

@Repository
public class TaskDaoImpl implements TaskDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.cyber.smedu.mapper.TaskMapper";

	//관리자 학생성적관리 과목선택시 토론 주제,결과물,점수
	@Override
	public TaskResultDomain adminStudentGradeTaskResult(Map<String, Object> map) {
		
		return sqlSession.selectOne(NS+".adminStudentGradeTaskResult", map);
	}
//의기---------------------------------------------------------------------------------------------
	@Override
	public TaskResultDomain professorStudentTaskResultDetail(String studentCode) {
		
		System.out.println("03 professorStudentTaskResultDetail <-- TaskDaoImpl.java");
		System.out.println("studentCode : " + studentCode);
		
		return sqlSession.selectOne(NS+".professorStudentTaskResultDetail", studentCode);
		
	}
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForTask(String professorCode) {
			
		return sqlSession.selectList(NS+".professorSubjectSelectForTask", professorCode);
		
	}
	
	@Override
	public TaskDomain professorTaskSelect(String openSubjectCode) {
		
		return sqlSession.selectOne(NS+".professorTaskSelect", openSubjectCode);	
	}
	
	@Override
	public void professorTaskUpdate(TaskDomain taskDomain) {
		sqlSession.update(NS+".professorTaskUpdate", taskDomain);
	}
	
	@Override
	public void professorTaskInsert(TaskDomain taskDomain) {
		sqlSession.insert(NS+".professorTaskInsert", taskDomain);
	}
	
	@Override
	public void taskScoreAndParticipationUpdate(TaskScoreDomain taskScoreDomain) {
		sqlSession.update(NS+".taskScoreAndParticipationUpdate", taskScoreDomain);
	}
	
	@Override
	public void taskMarkingInsert(TaskScoreDomain taskScoreDomain) {
		sqlSession.insert(NS+".taskMarkingInsert", taskScoreDomain);
	}
	
	@Override
	public void finalGradeUpdateForTask(TaskScoreDomain taskScoreDomain) {
		sqlSession.update(NS+".finalGradeUpdateForTask", taskScoreDomain);
	}
	
	@Override
	public TaskScoreDomain professorTaskScoreAndCodeSelect(GradeDomain gradeDomain) {
		return sqlSession.selectOne(NS+".professorTaskScoreAndCodeSelect", gradeDomain);	
	}
//우영---------------------------------------------------------------------------------------------
	
	//과제 참여에서 과목 선택시 주제 내용 받아오기
	//관리자 학생성적관리 과목 선택후 과제 주제 내용 받아오기
	@Override
	public TaskDomain oneTaskView(String openSubjectCode) {		
		
		return sqlSession.selectOne(NS+".oneTaskView", openSubjectCode);
	}
	
	
	//학생이 과제를 업로드시 db저장
	@Override
	public void taskResultAdd(TaskResultDomain taskResultDomain) {
		sqlSession.insert(NS+".taskResultAdd",taskResultDomain);
	
		
	}

	
	//이미 제출을 했으면 제출한 목록을 받아오기
	//학생이 과제 업로드시 이미 해당과목의 과제를 업로드한 사람인지 체크	
	@Override
	public TaskResultDomain studentTaskResultCheck(TaskResultDomain taskResultDomain) {
		
		return sqlSession.selectOne(NS+".studentTaskResultCheck", taskResultDomain);
	}

	
	//하나의 과제제출 리스트 받아오기
	@Override
	public TaskResultDomain taskSubmitUpdateDetail(String taskResultCode) {
		
		return sqlSession.selectOne(NS+".taskSubmitUpdateDetail", taskResultCode);
	}


	//파일 업로드는 안하고 내용만 변경할 경우
	@Override
	public void taskResultContentUpdate(TaskResultDomain taskResultDomain) {
		
		sqlSession.update(NS+".taskResultContentUpdate", taskResultDomain);
	}

	//업데이트 내용 db에 저장
	@Override
	public void taskResultFullUpdate(TaskResultDomain taskResultDomain) {
		
		sqlSession.update(NS+".taskResultFullUpdate", taskResultDomain);
		
	}
//장용---------------------------------------------------------------------------------------------
	
}
