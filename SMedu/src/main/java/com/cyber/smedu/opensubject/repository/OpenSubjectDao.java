package com.cyber.smedu.opensubject.repository;

import java.util.List;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.user.domain.StudentDomain;

public interface OpenSubjectDao {

	
	//나의 학사관리 페이지 이동
	List<CardinalDomain> classroomAcademicaCtivity(StudentDomain studentDomain);
	
	//해당과목 강의 리스트
	List<LectureDomain> lectureList(String openSubjectCode);
	
	//나의 학사관리에서 과목 선택시 출석여부 확인
	List<AttendDomain> openSubjectAttendList(AttendDomain attendDomain);
	
	//회원의 학생코드 받기
	StudentDomain studentCode(String userCode);	
	
	//나의 학사관리 페이지에서 과목 수강하기 클릭시 팝업창에 해당 과목의 동영상 나오기
	LectureDomain oneLecture(String lectureCode);

}
