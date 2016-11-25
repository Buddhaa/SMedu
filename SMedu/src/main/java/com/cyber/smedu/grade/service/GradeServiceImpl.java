package com.cyber.smedu.grade.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.academiccalendar.repository.AcademicCalendarDao;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.attend.repository.AttendDao;
import com.cyber.smedu.curriculum.repository.CurriculumDao;
import com.cyber.smedu.debate.domain.DebateDomain;
import com.cyber.smedu.debate.domain.DebateResultDomain;
import com.cyber.smedu.debate.domain.DebateScoreDomain;
import com.cyber.smedu.debate.repository.DebateDao;
import com.cyber.smedu.exam.domain.AnswerDomain;
import com.cyber.smedu.exam.domain.TestPaperDomain;
import com.cyber.smedu.exam.repository.ExamDao;
import com.cyber.smedu.grade.domain.FinalGradeDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.grade.repository.GradeDao;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.opensubject.repository.OpenSubjectDao;
import com.cyber.smedu.pay.domain.ClassRegistrationDomain;
import com.cyber.smedu.pay.domain.PayDomain;
import com.cyber.smedu.pay.repository.PayDao;
import com.cyber.smedu.task.domain.TaskResultDomain;
import com.cyber.smedu.task.repository.TaskDao;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;
import com.cyber.smedu.user.repository.UserDao;


@Service
public class GradeServiceImpl implements GradeService {

	@Autowired
	GradeDao gradeDao;
	@Autowired
	AcademicCalendarDao academicCalendarDao;
	@Autowired
	CurriculumDao curriculumDao;
	@Autowired
	UserDao userDao;
	@Autowired 
	OpenSubjectDao openSubjectDao;
	@Autowired 
	PayDao payDao;
	@Autowired
	AttendDao attendDao;
	@Autowired
	TaskDao taskDao;
	@Autowired
	DebateDao debateDao;
	@Autowired
	ExamDao	examDao;
	
	//관리자 학생성적관리 학생리스트
	@Override
	public Map<String, Object> adminStudentGradeList(String departmentCode, String userName) {
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("departmentCode", departmentCode);
		map.put("userName", userName);		
		map.put("studentList", userDao.selectAdminStudentList(map)); //학생리스트 출력 (검색) 회원코드,학생코드,기수코드,학과코드
		map.put("cardinalList", academicCalendarDao.selectCardinalList()); //기수 리스트 출력
		map.put("departmentList", curriculumDao.selectDepartmentList()); //검색창 학과 출력
		return map;
		
	}
	//관리자 학생성적관리 학생 상세보기
	@Override
	public Map<String, Object> adminStudentGradeDetail(String userCode, String studentCode, String cardinalCode, String openSubjectCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		//학생 기본정보,학과명 출력
		UserDomain studentInfo = userDao.selectAdminStudentGradeDetail(userCode);
		map.put("studentInfo", studentInfo);
		//학생이 수강신청 했던 기수출력
		List<PayDomain> cardinalList = payDao.selectStudentPayCardinal(studentCode);
		map.put("cardinalList", cardinalList);
		//총 이수성적 출력
		List<FinalGradeDomain> finalGradeList = gradeDao.adminStudentFinalGrade(studentCode);
		map.put("finalGradeList", finalGradeList);
		//기수 선택시 수강과목 리스트 출력		
		if(!cardinalCode.equals("")){
			map.put("studentCode", studentCode);
			map.put("cardinalCode", cardinalCode);
			List<ClassRegistrationDomain> classRegistrationList = payDao.selectStudentCardinalClassRegistration(map);
			map.put("classRegistrationList", classRegistrationList);
			if(!openSubjectCode.equals("")) {
				OpenSubjectDomain openSubject = openSubjectDao.selectAdminStudentGradeDetailSubject(openSubjectCode);
				map.put("openSubject", openSubject);
				//수강과목 선택시 과목 성적 출력
				map.put("openSubjectCode", openSubjectCode);
				List<GradeDomain> gradeList = gradeDao.adminStudentSubjectGrade(map);
				map.put("gradeList", gradeList);
				//수강과목 선택시 출석률, 과목 제출물 및 시험답안 출력
				//출석률
				List<AttendDomain> attendList = attendDao.adminStudentGradeAttendSelect(map);
				map.put("attendList", attendList);
				//과제
				TaskResultDomain task = taskDao.adminStudentGradeTaskResult(map);
				map.put("task", task);				
				//토론
				DebateDomain debate = debateDao.professorStudentDebateSubjectAndContentSelect(openSubjectCode);
				map.put("debate", debate);
				String debateCode = debate.getDebateCode();
				map.put("debateCode", debateCode);
				List<DebateResultDomain> debateResult = debateDao.adminStudentGradeSubjectDebateResultSelect(map);				
				map.put("debateResult", debateResult);
				DebateScoreDomain debateScore = debateDao.adminStudentGradeSubjectDebateScoreSelect(map);
				map.put("debateScore", debateScore);
				//중간고사
				//중간고사,기말고사 학사일정코드 출력
				List<String> examList = new ArrayList<String>();
				examList.add("중간고사");
				examList.add("기말고사");
				List<String> examList2 = new ArrayList<String>();
				examList2.add("MidExam");
				examList2.add("finalExam");
				List<String> examAndAnswerName = new ArrayList<String>();
				examAndAnswerName.add("MidExamAndAnswerList");
				examAndAnswerName.add("finalExamAndAnswerList");
				for(int i = 0; i < examList.size(); i++){
					map.put("exam", examList.get(i));
					//시험에 해당하는 학사일정 꺼내기
					AcademicCalendarDomain examAcademicCalendar = academicCalendarDao.adminStudentGradeTestAcademicCalendarCodeSelect(map);
					System.out.println("중간 , 기말 학사일정코드 ------------" + examAcademicCalendar.getAcademicCalendarCode());
					String academicCalendarCode = examAcademicCalendar.getAcademicCalendarCode();
					map.put("academicCalendarCode", academicCalendarCode);
					//시험지 정보꺼내기
					TestPaperDomain testpaper = examDao.adminStudentGradeTestPaperSelect(map);
					map.put(examList2.get(i), testpaper);
					String testPaperCode = testpaper.getTestPaperCode();
					map.put("testPaperCode", testPaperCode);
					//문제와 답안지 채점 점수 꺼내기
					List<AnswerDomain> examAndAnswerList = examDao.adminStudentGradeExamAndAnswerSelect(map);
					map.put(examAndAnswerName.get(i), examAndAnswerList);
				}
				//기말고사
				
			}
		}
		
		return map;
		
	}
	
	/*의기---------------------------------------------------------------------------------------------------------------------*/
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForCheck(String professorCode) {
		
		//System.out.println("02 professorSubjectSelectForCheck <-- GradeServiceImpl.java");
		
		List<OpenSubjectDomain> openSubjectDomain 
			= gradeDao.professorSubjectSelectForCheck(professorCode);
		
		return openSubjectDomain;
		
	}
	
	@Override
	public List<UserDomain> professorStudentInfoSelect(String openSubjectCode, String searchWord) {
	
		//System.out.println("02 professorStudentInfoSelect <-- GradeServiceImpl.java");
		//System.out.println("openSubjectCode : " + openSubjectCode + "// searchWord : " + searchWord);
		
		Map<String, Object> map = new HashMap<>();
		map.put("openSubjectCode", openSubjectCode);
		map.put("searchWord", searchWord);
		
		List<UserDomain> userDomain
			= gradeDao.professorStudentInfoSelect(map);
		
		return userDomain;
		
	}	
	
	@Override
	public List<GradeDomain> professorStudentGradeSelect(String userCode) {
		
		System.out.println("02 professorStudentGradeSelect <-- GradeServiceImpl.java");
		//System.out.println("userCode : " + userCode);
		
		List<GradeDomain> gradeDomain
			= gradeDao.professorStudentGradeSelect(userCode);
		
		return gradeDomain;
		
	}
	
	@Override
	public FinalGradeDomain professorStudentFinalGradeSelect(String userCode) {
		
		System.out.println("02 professorStudentFinalGradeSelect <-- GradeServiceImpl.java");
		
		FinalGradeDomain finalGradeDomain
			= gradeDao.professorStudentFinalGradeSelect(userCode);
		
		return finalGradeDomain;
		
	}
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForManage(String professorCode) {
		
		System.out.println("02 professorSubjectSelectForManage <-- GradeServiceImpl.java");
		
		List<OpenSubjectDomain> openSubjectDomain 
			= gradeDao.professorSubjectSelectForManage(professorCode);
		
		return openSubjectDomain;
		
	}
	
	@Override
	public List<StudentDomain> professorStudentNameAndCodeSelect(String openSubjectCode, String searchWord) {
		
		System.out.println("02 professorStudentNameSelect <-- GradeServiceImpl.java");
		System.out.println("openSubjectCode : " + openSubjectCode + "// searchWord : " + searchWord);
		
		Map<String, Object> map = new HashMap<>();
		map.put("openSubjectCode", openSubjectCode);
		map.put("searchWord", searchWord);
		
		List<StudentDomain> studentDomain
			= gradeDao.professorStudentNameAndCodeSelect(map);
		
		return studentDomain;
		
	}
	/*우영--------------------------------------------------------------------------------------------------------*/
	//나의 학점 관리 페이지에서 과목 선택시 -> 해당 과목 출석률, 과제, 토론, 시험, 총성적 받아오기
	@Override
	public List<FinalGradeDomain> finalResultGrade(String userCode){
		
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
				
		return gradeDao.finalResultGrade(studentCode);
	}

	
	//나의 학점관리 페이지 이동
	@Override
	public List<GradeDomain> creditManage(String userCode) {
		
		//회원의 학생코드 받기
		String studentCode = gradeDao.studentCode(userCode).getStudentCode();
		
		//해당 학생의과목 출석률, 과제, 토론, 시험, 총성적 받아오기
		return gradeDao.creditManage(studentCode);
	}
	/*장용-------------------------------------------------------------------------------*/
	
}
