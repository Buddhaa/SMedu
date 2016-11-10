package com.cyber.smedu.task.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.task.domain.TaskDomain;
import com.cyber.smedu.task.domain.TaskResultDomain;

@Repository
public class TaskDaoImpl implements TaskDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.cyber.smedu.mapper.TaskMapper";
	
	@Override
	public TaskResultDomain professorStudentTaskResultDetail(String studentCode) {
		
		System.out.println("03 professorStudentTaskResultDetail <-- TaskDaoImpl.java");
		System.out.println("studentCode : " + studentCode);
		
		return sqlSession.selectOne(NS+".professorStudentTaskResultDetail", studentCode);
		
	}
	//우영
	//과제 참여에서 과목 선택시 주제 내용 받아오기
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
	
}
