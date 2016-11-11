package com.cyber.smedu.opensubject.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.StudentDomain;

@Repository
public class OpenSubjectDaoImpl implements OpenSubjectDao{
	private String NS = "com.cyber.smedu.mapper.OpenSubjectMapper";
	@Autowired SqlSessionTemplate sqlSession;

	//관리자 학생성적관리 상세보기에서 기수, 개설과목 선택시 개설과목, 과목정보 출력
	@Override
	public OpenSubjectDomain selectAdminStudentGradeDetailSubject(String openSubjectCode) {
		
		return sqlSession.selectOne(NS+".selectAdminStudentGradeDetailSubject", openSubjectCode);
	}
	//나의 학사관리 페이지 이동
	@Override
	public List<CardinalDomain> classroomAcademicaCtivity(StudentDomain studentDomain) {
		System.out.println("DAO userCode"+studentDomain);
		return sqlSession.selectList(NS+".classroomAcademicaCtivity", studentDomain);
	}

	//해당과목 강의 리스트
	@Override
	public List<LectureDomain> lectureList(String openSubjectCode) {
		
		return sqlSession.selectList(NS+".lectureList", openSubjectCode);
	}
	
	//나의 학사관리에서 과목 선택시 출석여부 확인
	@Override
	public List<AttendDomain> openSubjectAttendList(AttendDomain attendDomain) {

		return sqlSession.selectList(NS+".openSubjectAttendList", attendDomain);
	}
	
	//회원의 학생코드 받기
	@Override
	public StudentDomain studentCode(String userCode) {		
		
		return sqlSession.selectOne(NS+".studentSelectOne", userCode);
	}

	
	//나의 학사관리 페이지에서 과목 수강하기 클릭시 팝업창에 해당 과목의 동영상 나오기
	@Override
	public LectureDomain oneLecture(String lectureCode) {

		return sqlSession.selectOne(NS+".oneLecture",lectureCode);
	}
}
