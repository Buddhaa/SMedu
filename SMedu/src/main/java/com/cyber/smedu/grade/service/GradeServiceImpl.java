package com.cyber.smedu.grade.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.academiccalendar.repository.AcademicCalendarDao;
import com.cyber.smedu.curriculum.repository.CurriculumDao;
import com.cyber.smedu.grade.domain.FinalGradeDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.grade.repository.GradeDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;
import com.cyber.smedu.user.repository.UserDao;


@Service
public class GradeServiceImpl implements GradeService {

	@Autowired
	GradeDao gradeDao;
	@Autowired
	AcademicCalendarDao academicCalendarDao;
	@Autowired
	CurriculumDao curriculumDao;
	@Autowired
	UserDao userDao;
	
	//관리자 학생성적관리 학생리스트
	@Override
	public Map<String, Object> adminStudentGradeList(String departmentCode, String userName) {
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("departmentCode", departmentCode);
		map.put("userName", userName);		
		map.put("studentList", userDao.selectAdminStudentList(map)); //학생리스트 출력 (검색) 회원코드,학생코드,기수코드,학과코드
		map.put("cardinalList", academicCalendarDao.selectCardinalList()); //기수 리스트 출력
		map.put("departmentList", curriculumDao.selectDepartmentList()); //검색창 학과 출력
		return map;
		
	}
	
	/*의기---------------------------------------------------------------------------------------------------------------------*/
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForCheck(String professorCode) {
		
		System.out.println("02 professorSubjectSelectForCheck <-- GradeServiceImpl.java");
		
		List<OpenSubjectDomain> openSubjectDomain 
			= gradeDao.professorSubjectSelectForCheck(professorCode);
		
		return openSubjectDomain;
		
	}
	
	@Override
	public List<UserDomain> professorStudentInfoSelect(String openSubjectCode) {
	
		System.out.println("02 professorStudentInfoSelect <-- GradeServiceImpl.java");
		//System.out.println("openSubjectCode : " + openSubjectCode);
		
		List<UserDomain> userDomain
			= gradeDao.professorStudentInfoSelect(openSubjectCode);
		
		return userDomain;
		
	}
	
	@Override
	public List<GradeDomain> professorStudentGradeSelect(String userCode) {
		
		System.out.println("02 professorStudentGradeSelect <-- GradeServiceImpl.java");
		//System.out.println("userCode : " + userCode);
		
		List<GradeDomain> gradeDomain
			= gradeDao.professorStudentGradeSelect(userCode);
		
		return gradeDomain;
		
	}
	
	@Override
	public FinalGradeDomain professorStudentFinalGradeSelect(String userCode) {
		
		System.out.println("02 professorStudentFinalGradeSelect <-- GradeServiceImpl.java");
		
		FinalGradeDomain finalGradeDomain
			= gradeDao.professorStudentFinalGradeSelect(userCode);
		
		return finalGradeDomain;
		
	}
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForManage(String professorCode) {
		
		System.out.println("02 professorSubjectSelectForManage <-- GradeServiceImpl.java");
		
		List<OpenSubjectDomain> openSubjectDomain 
			= gradeDao.professorSubjectSelectForManage(professorCode);
		
		return openSubjectDomain;
		
	}
	
	@Override
	public List<StudentDomain> professorStudentNameAndCodeSelect(String openSubjectCode) {
		
		System.out.println("02 professorStudentNameSelect <-- GradeServiceImpl.java");
		
		List<StudentDomain> studentDomain
			= gradeDao.professorStudentNameAndCodeSelect(openSubjectCode);
		
		return studentDomain;
		
	}
	/*우영--------------------------------------------------------------------------------------------------------*/
}
