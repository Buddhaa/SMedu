package com.cyber.smedu.attend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.attend.repository.AttendDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Service
public class AttendServiceImpl implements AttendService {

	@Autowired
	AttendDao attendDao;
	
	@Override
	public UserDomain professorStudentNameSelect(String studentCode) {
		
		System.out.println("02 professorStudentNameSelect <-- AttendServiceImpl.java");
		
		UserDomain userDomain
			= attendDao.professorStudentNameSelect(studentCode);
		
		return userDomain;
	}
	
	@Override
	public OpenSubjectDomain professorOpenSubjectNameSelect(String openSubjectCode) {
		
		System.out.println("02 professorOpenSubjectNameSelect <-- AttendServiceImpl.java");
		
		OpenSubjectDomain openSubjectDomain
			= attendDao.professorOpenSubjectNameSelect(openSubjectCode);
		
		return openSubjectDomain;
	}
	
	@Override
	public List<AcademicCalendarDomain> professorStudentWeeklyScheduleSelect(String openSubjectCode) {
		
		System.out.println("02 professorStudentWeeklyScheduleSelect <-- AttendServiceImpl.java");
		
		List<AcademicCalendarDomain> academicCalendarDomain
			= attendDao.professorStudentWeeklyScheduleSelect(openSubjectCode);
		
		return academicCalendarDomain;
		
	}
	
	@Override
	public List<AttendDomain> professorStudentAttendInfoSelect(String studentCode) {
		
		System.out.println("02 professorStudentAttendInfoSelect <-- AttendServiceImpl.java");
	
		List<AttendDomain> attendDomain
			= attendDao.professorStudentAttendInfoSelect(studentCode);
		
		return attendDomain;
	}
}
