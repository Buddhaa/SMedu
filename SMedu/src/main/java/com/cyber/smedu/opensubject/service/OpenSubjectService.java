package com.cyber.smedu.opensubject.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;

public interface OpenSubjectService {
	
	//나의 학사관리 페이지 이동
	List<CardinalDomain> classroomAcademicaCtivity(String userCode);
	
	//나의 학사관리에서 과목 선택시
	List<LectureDomain> classroomAcademicaCtivityView(String openSubjectCode);
	
	//나의 학사관리에서 과목 선택시 출석여부 확인
	List<AttendDomain> openSubjectAttendList(String userCode,AttendDomain attendDomain);
	
	//나의 학사관리 페이지에서 과목 수강하기 클릭시 팝업창에 해당 과목의 동영상 나오기
	Map<String, Object> oneLecture(String lectureCode) throws ParseException;
	
}
