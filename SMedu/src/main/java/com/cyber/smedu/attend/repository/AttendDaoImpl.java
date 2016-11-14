package com.cyber.smedu.attend.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.UserDomain;

@Repository
public class AttendDaoImpl implements AttendDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NS = "com.cyber.smedu.mapper.AttendMapper";
	
	@Override
	public List<AttendDomain> adminStudentGradeAttendSelect(Map<String, Object> map) {
				
		return sqlSessionTemplate.selectList(NS+".adminStudentGradeAttendSelect", map);
	}
	
	/*의기-------------------------------------------------------------------------------------------*/
	@Override
	public UserDomain professorStudentNameSelect(String studentCode) {
		
		System.out.println("03 professorStudentNameSelect <-- AttendDaoImpl.java");
		
		return sqlSessionTemplate.selectOne(NS+".professorStudentNameSelect", studentCode);
		
	}
	
	@Override
	public OpenSubjectDomain professorOpenSubjectNameSelect(String openSubjectCode) {
		
		System.out.println("03 professorOpenSubjectNameSelect <-- AttendDaoImpl.java");
		
		return sqlSessionTemplate.selectOne(NS+".professorOpenSubjectNameSelect", openSubjectCode);
	}
	
	@Override
	public List<AcademicCalendarDomain> professorStudentWeeklyScheduleSelect(String openSubjectCode) {
		
		System.out.println("03 professorStudentWeeklyScheduleSelect <-- AttendDaoImpl.java");
		
		return sqlSessionTemplate.selectList(NS+".professorStudentWeeklyScheduleSelect", openSubjectCode);		
	}
	
	@Override
	public List<AttendDomain> professorStudentAttendInfoSelect(String studentCode) {
		
		System.out.println("03 professorStudentAttendInfoSelect <-- AttendDaoImpl.java");
		
		return sqlSessionTemplate.selectList(NS+".professorStudentAttendInfoSelect", studentCode);		
	}
	/*우영-------------------------------------------------------------------------------------------*/
}
