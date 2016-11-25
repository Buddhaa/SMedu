package com.cyber.smedu.objection.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.grade.repository.GradeDao;
import com.cyber.smedu.objection.domain.ObjectionDomain;
import com.cyber.smedu.objection.repository.ObjectionDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.opensubject.repository.OpenSubjectDao;

@Service
public class ObjectionServiceImpl implements ObjectionService {

	@Autowired
	ObjectionDao objectionDao;
	
	@Autowired
	GradeDao gradeDao;
	
	@Autowired
	OpenSubjectDao openSubjectDao;
	
	//성적이의신청관리를 위한 교수 담당과목 select
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForObjection(String professorCode) {
		
		System.out.println("02 professorSubjectSelectForObjection <-- ObjectionServiceImpl.java");
		
		List<OpenSubjectDomain> openSubjectDomain
			= objectionDao.professorSubjectSelectForObjection(professorCode);
			
		return openSubjectDomain;	
	}
	
	//해당 과목의 성적이의신청을 한 학생들과 이의신청 정보 select
	@Override
	public List<ObjectionDomain> professorStudentObjectionInfoSelect(String openSubjectCode, String searchWord) {
		
		/*System.out.println("02 professorStudentObjectionInfoSelect <-- ObjectionServiceImpl.java");
		System.out.println("openSubjectCode : " + openSubjectCode + "// searchWord : " + searchWord);*/
		
		Map<String, Object> map = new HashMap<>();
		map.put("openSubjectCode", openSubjectCode);
		map.put("searchWord", searchWord);
		
		List<ObjectionDomain> objectionDomain
			= objectionDao.professorStudentObjectionInfoSelect(map);
		
		return objectionDomain;
	}
	
	@Override
	public ObjectionDomain professorStudentObjectionDetail(String objectionCode) {
		
/*		System.out.println("02 professorStudentObjectionDetail <-- ObjectionServiceImpl.java");
		System.out.println("objectionCode : " + objectionCode);*/
		
		ObjectionDomain objectionDomain
			= objectionDao.professorStudentObjectionDetail(objectionCode);
		
		return objectionDomain;
	}
	
	@Override
	public ObjectionDomain professorStudentObjectionReplyDetail(String objectionCode) {
		
		ObjectionDomain objectionDomain
			= objectionDao.professorStudentObjectionReplyDetail(objectionCode);
		
		return objectionDomain;
		
	}
	
	@Override
	public void professorStudentObjectionReply(ObjectionDomain objectionDomain) {
		
		System.out.println("02 professorStudentObjectionReply <-- ObjectionServiceImpl.java");
		
		String objectionCode = objectionDomain.getObjectionCode();
		String objectionReply = objectionDomain.getObjectionReply();
		
		System.out.println("objectionCode : " + objectionCode);
		System.out.println("objectionReply : " + objectionReply);
		
		objectionDao.professorStudentObjectionReply(objectionDomain);	
	}
	//우영
	// 과목 선택시 이의신청 내용 리스트 받아오기
	@Override
	public List<ObjectionDomain> objectionView(String userCode) {

		// 회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();


		return objectionDao.objectionView(studentCode);
	}

	
	//////////////////11.14 입력
	// 개설과목 코드로 교수코드 받아오기
	@Override
	public ObjectionDomain objectionInsert(String userCode, String openSubjectCode) {
		
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		
		//openSubjectCode로 교수코드 받아오기
		String professorCode = openSubjectDao.objectionInsertForm(openSubjectCode).getProfessorCode();

		ObjectionDomain objectionDomain = new ObjectionDomain();
		
		objectionDomain.setProfessorCode(professorCode);
		objectionDomain.setStudentCode(studentCode);
		objectionDomain.setOpenSubjectCode(openSubjectCode);
		
		return objectionDomain;
	}


	//성적이의신청 등록처리
	@Override
	public void objectionAdd(String userCode, ObjectionDomain objectionDomain) {
	
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		
		//openSubjectCode로 교수코드 받아오기
		String openSubjectCode = objectionDomain.getOpenSubjectCode();
		String professorCode = openSubjectDao.objectionInsertForm(openSubjectCode).getProfessorCode();
		
		objectionDomain.setStudentCode(studentCode);
		objectionDomain.setProfessorCode(professorCode);
		
		objectionDao.objectionAdd(objectionDomain);
	}


	//학생이 이의신청 글을 상세보기를 할때 
	@Override
	public ObjectionDomain objectionDetail(String objectionCode) {

		
		return objectionDao.objectionDetail(objectionCode);
	}
	//장용
	
}
