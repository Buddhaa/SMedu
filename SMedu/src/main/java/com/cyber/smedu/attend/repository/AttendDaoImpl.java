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
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.cyber.smedu.mapper.AttendMapper";
	
	public AttendDaoImpl(){
		System.out.println("AttendDaoImpl sqlSession:"+sqlSession);
	}
	
	@Override
	public List<AttendDomain> adminStudentGradeAttendSelect(Map<String, Object> map) {
				
		return sqlSession.selectList(NS+".adminStudentGradeAttendSelect", map);
	}
	
	/*의기-------------------------------------------------------------------------------------------*/
	@Override
	public UserDomain professorStudentNameSelect(String studentCode) {
		
		System.out.println("03 professorStudentNameSelect <-- AttendDaoImpl.java");
		
		return sqlSession.selectOne(NS+".professorStudentNameSelect", studentCode);
		
	}
	
	@Override
	public OpenSubjectDomain professorOpenSubjectNameSelect(String openSubjectCode) {
		
		System.out.println("03 professorOpenSubjectNameSelect <-- AttendDaoImpl.java");
		
		return sqlSession.selectOne(NS+".professorOpenSubjectNameSelect", openSubjectCode);
	}
	
	@Override
	public List<AcademicCalendarDomain> professorStudentWeeklyScheduleSelect(String openSubjectCode) {
		
		System.out.println("03 professorStudentWeeklyScheduleSelect <-- AttendDaoImpl.java");
		
		return sqlSession.selectList(NS+".professorStudentWeeklyScheduleSelect", openSubjectCode);		
	}
	
	@Override
	public List<AttendDomain> professorStudentAttendInfoSelect(String studentCode) {
		
		System.out.println("03 professorStudentAttendInfoSelect <-- AttendDaoImpl.java");
		
		return sqlSession.selectList(NS+".professorStudentAttendInfoSelect", studentCode);		
	}
	/*우영-------------------------------------------------------------------------------------------*/
	//시험 제출시 출석상태를 F->T로 변경
	@Override
	public void examAttendUpdate(String attendCode) {
		
		sqlSession.update(NS+".examAttendUpdate", attendCode);
		
	}
	
	//해당강의 출석을 받아오기
	@Override
	public AttendDomain studentAttend(AttendDomain attendDomain) {
		
		return sqlSession.selectOne(NS+".studentAttend", attendDomain);		
	}

	//학생 강의 출석저장
	@Override
	public void lectureAttendUpdate(AttendDomain attendDomain) {
	
		sqlSession.update(NS+".lectureAttendUpdate", attendDomain);	
		
	}
	/*장용-------------------------------------------------------------------------------------------*/
}
