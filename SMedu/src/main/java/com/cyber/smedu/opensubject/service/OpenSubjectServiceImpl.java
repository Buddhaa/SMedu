package com.cyber.smedu.opensubject.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.academiccalendar.repository.AcademicCalendarDao;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.opensubject.repository.OpenSubjectDao;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.repository.UserDao;

@Service
public class OpenSubjectServiceImpl implements OpenSubjectService{
	@Autowired OpenSubjectDao openSubjectDao;
	@Autowired AcademicCalendarDao academicCalendarDao;
	@Autowired UserDao userDao;
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	//관리자 개설과목 리스트
	@Override
	public Map<String, Object> selectAdminOpenSubject(String cardinalCode, String subjectName, String professorName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cardinalCode", cardinalCode);
		map.put("subjectName", subjectName);
		map.put("professorName", professorName);
		List<OpenSubjectDomain> openSubjectList = openSubjectDao.selectAdminOpenSubject(map);
		List<CardinalDomain> cardinalList = academicCalendarDao.selectOpenSubjectCardinalList();
		map.put("openSubjectList", openSubjectList);
		map.put("cardinalList", cardinalList);
		return map;
	}
	//의기
	
	//학생이 수강신청을 안했을 경우 수강신청 페이지로 이동
	@Override
	public String studentCodeCheck(String userCode) {
		
		StudentDomain studentCode = userDao.studentCode(userCode);
		System.out.println("studentCode : " + studentCode);
		if(studentCode.getCardinalCode() == null){
			
			return "수강신청 안함";
		}else{
			
			return "수강신청 함";
		}	
	}
	
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
	
	@Override
	public OpenSubjectDomain examOpenSubjectList(String openSubjectCode, String lectureCode) {
		LectureDomain lectureDomain = new LectureDomain();
		
		lectureDomain.setOpenSubjectCode(openSubjectCode);
		lectureDomain.setLectureCode(lectureCode);
				
		return openSubjectDao.examOpenSubjectList(lectureDomain);
	}	
	//장용
	//수강신청 리스트
		@Override
		public Map<String, Object> selectOpenSubjectList(String departmentCode, String cardinalCode) {
			System.out.println("departmentCode : " + departmentCode);
			Map<String, Object> map = new HashMap<String, Object>();
			List<CardinalDomain> cardinalList = academicCalendarDao.selectTodayCardinalList();
			
			if(cardinalCode.equals("")){
				cardinalCode = cardinalList.get(0).getCardinalCode();	
				map.put("cardinalCode", cardinalCode);
				System.out.println("cardinalCode:"+cardinalCode);
			} else {
			map.put("cardinalCode", cardinalCode);
			}
			System.out.println(map.get("cardinalCode"));
			map.put("departmentCode", departmentCode);		
			List<OpenSubjectDomain> openSubjectList = openSubjectDao.selectOpenSubjectList(map);
			System.out.println("openSubjectList : " + openSubjectList);
			map.put("cardinalList", cardinalList);
			map.put("openSubjectList", openSubjectList);
			return map;
		}
	//현호
		
	//강의관리를 위한 교수 담당과목 select
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForLecture(String professorCode) {
		
		System.out.println("02 professorSubjectSelectForLecture <-- ObjectionServiceImpl.java");
		
		List<OpenSubjectDomain> openSubjectDomain
			= openSubjectDao.professorSubjectSelectForLecture(professorCode);
			
		return openSubjectDomain;	
	}
	
	@Override
	public List<OpenSubjectDomain> professorLectureListSelect(String openSubjectCode) {
		
		System.out.println("02 professorLectureListSelect <-- ObjectionServiceImpl.java");
		//System.out.println("openSubjectCode : " + openSubjectCode);
		
		List<OpenSubjectDomain> openSubjectDomain
			= openSubjectDao.professorLectureListSelect(openSubjectCode);
		
		return openSubjectDomain;
	}
	
	//강의 상세보기
	@Override
	public LectureDomain professorLetureDetail(String lectureCode) {
		
		System.out.println("02 professorLetureDetail <-- ObjectionServiceImpl.java");
		//System.out.println("lectureCode : " + lectureCode);
		
		LectureDomain lectureDomain
			= openSubjectDao.professorLetureDetail(lectureCode);
		
		return lectureDomain;		
	}
	
	//강의 업데이트
	@Override
	public void professorLectureUpdate(LectureDomain lectureDomain) {
		openSubjectDao.professorLectureUpdate(lectureDomain);
	}
	
	//강의 insert form 에 필요한 코드/주차별 일정 select
	@Override
	public List<AcademicCalendarDomain> professorLectureInsertView(String openSubjectCode) {
		
		List<AcademicCalendarDomain> academicCalendarDomain
			= openSubjectDao.professorLectureInsertView(openSubjectCode);
		
		return academicCalendarDomain;	
	}
	
	//강의 등록
	@Override
	public void professorLectureInsert(LectureDomain lectureDomain) {
		
		openSubjectDao.professorLectureInsert(lectureDomain);
	}
	
	//vallidation을위한 lecture의 academicCalendarCode select
	@Override
	public List<LectureDomain> lectureAcademicCalendarCodeSelect(String openSubjectCode) {
		
		List<LectureDomain> lectureDomain =
				openSubjectDao.lectureAcademicCalendarCodeSelect(openSubjectCode);
		
		return lectureDomain;
		
	}
	//우영

}
