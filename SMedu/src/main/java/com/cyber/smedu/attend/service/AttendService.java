package com.cyber.smedu.attend.service;

import java.util.List;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.UserDomain;

public interface AttendService {

	UserDomain professorStudentNameSelect(String studentCode);

	OpenSubjectDomain professorOpenSubjectNameSelect(String openSubjectCode);

	List<AcademicCalendarDomain> professorStudentWeeklyScheduleSelect(String openSubjectCode);

	List<AttendDomain> professorStudentAttendInfoSelect(String studentCode);

	AttendDomain studentAttend(String userCode, String lectureCode);

	void lectureAttendUpdate(AttendDomain attendDomain);

}
