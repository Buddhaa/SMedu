package com.cyber.smedu.grade.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.academiccalendar.repository.AcademicCalendarDao;
import com.cyber.smedu.curriculum.repository.CurriculumDao;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.grade.repository.GradeDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.UserDomain;


@Service
public class GradeServiceImpl implements GradeService {

	@Autowired
	GradeDao gradeDao;
	@Autowired
	AcademicCalendarDao academicCalendarDao;
	@Autowired
	CurriculumDao curriculumDao;
	
	@Override
	public Map<String, Object> adminStudentGradeList() {
		
		academicCalendarDao.selectCardinalList();
		curriculumDao.selectDepartmentList();
		
		return null;
		
	}
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelect(String professorCode) {
		
		System.out.println("02 professorSubjectSelect <-- GradeServiceImpl.java");
		
		List<OpenSubjectDomain> openSubjectDomain 
			= gradeDao.professorSubjectSelect(professorCode);
		
		return openSubjectDomain;
		
	}
	
	@Override
	public List<UserDomain> professorStudentInfoSelect(String openSubjectCode) {
	
		System.out.println("02 professorStudentInfoSelect <-- GradeServiceImpl.java");
		System.out.println("openSubjectCode : " + openSubjectCode);
		
		List<UserDomain> userDomain
			= gradeDao.professorStudentInfoSelect(openSubjectCode);
		
		return userDomain;
		
	}
	
	@Override
	public List<GradeDomain> professorStudentGradeSelect(String userCode) {
		
		System.out.println("02 professorStudentGradeSelect <-- GradeServiceImpl.java");
		System.out.println("userCode : " + userCode);
		
		List<GradeDomain> gradeDomain
			= gradeDao.professorStudentGradeSelect(userCode);
		
		return gradeDomain;
		
	}
}
