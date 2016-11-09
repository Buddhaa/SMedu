package com.cyber.smedu.opensubject.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.opensubject.repository.OpenSubjectDao;
import com.cyber.smedu.user.domain.StudentDomain;

@Service
public class OpenSubjectServiceImpl implements OpenSubjectService{
	@Autowired OpenSubjectDao openSubjectDao;
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	//나의 학사관리 페이지 이동
	@Override
	public List<CardinalDomain> classroomAcademicaCtivity(String userCode) {
		
		//회원의 학생도메인 받기
		StudentDomain studentDomain = openSubjectDao.studentCode(userCode);
		
		//학생이 수강중인 과목리스트 받기
		List<CardinalDomain> CardinalDomain = openSubjectDao.classroomAcademicaCtivity(studentDomain);
		
		System.out.println("to"+CardinalDomain);
		
		return CardinalDomain;
	}


	//나의 학사관리에서 과목 선택시
	@Override
	public List<LectureDomain> classroomAcademicaCtivityView(String openSubjectCode) {
		
		if(openSubjectCode.equals("")){			
			return null;			
		}else{
					
			//해당과목 강의 리스트		
			List<LectureDomain> lectureList= openSubjectDao.lectureList(openSubjectCode);
							
			return lectureList;			
		}		
	}


	//나의 학사관리에서 과목 선택시 출석여부 확인
	@Override
	public List<AttendDomain> openSubjectAttendList(String userCode,AttendDomain attendDomain) {
		
		//회원의 학생코드 받기
		String studentCode = openSubjectDao.studentCode(userCode).getStudentCode();
		attendDomain.setStudentCode(studentCode);		
		System.out.println("attendDomain:" + attendDomain.toString());
		
		//학생의 해당과목 출석리스트
		List<AttendDomain> attendDomainList= openSubjectDao.openSubjectAttendList(attendDomain);		
		System.out.println("attendDomain:" + attendDomainList.toString());
		return attendDomainList;
	}


	//나의 학사관리 페이지에서 강의 수강하기 클릭시 팝업창에 해당 과목의 동영상 나오기
	@Override
	public Map<String, Object> oneLecture(String lectureCode) throws ParseException {

		//날짜를 비교를 위한 객체생성
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//강의을 클릭시 화면에 나올 객체
		LectureDomain oneLectureList = openSubjectDao.oneLecture(lectureCode);
		
		System.out.println("oneLectureList : " + oneLectureList);
		
		//강의가 수강기간안에 수강을 하나 확인			
		
		//오늘 날짜
		Date toDay = new Date();
		
		//강의 종료일 
		Date endDay = simpleDateFormat.parse(oneLectureList.getAcademicCalendarEndDay());
		
		String text = null;
		int compare = toDay.compareTo(endDay);
		if(compare > 0){
			System.out.println("toDay > endDay");
			text = "수강기간이 지난 강의는 출석에는 반영되지 않습니다.";
			
		}else{
			System.out.println("toDay < endDay");
		}		
		
		map.put("LectureList", oneLectureList);
		map.put("text", text);
		
		return map;
	}

}
