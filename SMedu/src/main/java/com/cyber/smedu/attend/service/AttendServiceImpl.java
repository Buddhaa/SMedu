package com.cyber.smedu.attend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.attend.repository.AttendDao;
import com.cyber.smedu.grade.repository.GradeDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Service
public class AttendServiceImpl implements AttendService {

	@Autowired
	AttendDao attendDao;
	@Autowired
	GradeDao gradeDao;
	
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
	//우영
	//해당강의 출석을 받아오기
	@Override
	public AttendDomain studentAttend(String userCode, String lectureCode) {
		
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		
		AttendDomain attendDomain = new AttendDomain();
		
		attendDomain.setStudentCode(studentCode);
		attendDomain.setLectureCode(lectureCode);
		
		return attendDao.studentAttend(attendDomain);
	}

	
	//학생 강의 출석저장
	@Override
	public void lectureAttendUpdate(AttendDomain attendDomain) {

		attendDao.lectureAttendUpdate(attendDomain);
	}
	
}
