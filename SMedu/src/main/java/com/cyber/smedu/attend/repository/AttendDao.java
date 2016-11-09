package com.cyber.smedu.attend.repository;

import java.util.List;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.UserDomain;

public interface AttendDao {

	UserDomain professorStudentNameSelect(String studentCode);

	OpenSubjectDomain professorOpenSubjectNameSelect(String openSubjectCode);

	List<AcademicCalendarDomain> professorStudentWeeklyScheduleSelect(String openSubjectDomain);

	List<AttendDomain> professorStudentAttendInfoSelect(String studentCode);

}
