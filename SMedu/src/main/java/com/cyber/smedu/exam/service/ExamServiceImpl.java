package com.cyber.smedu.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.cyber.smedu.academiccalendar.domain.AcademicCalendarDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.attend.repository.AttendDao;
import com.cyber.smedu.exam.domain.AnswerDomain;
import com.cyber.smedu.exam.domain.ExamQuestionsDomain;
import com.cyber.smedu.exam.domain.TestPaperDomain;
import com.cyber.smedu.exam.repository.ExamDao;
import com.cyber.smedu.grade.repository.GradeDao;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.opensubject.repository.OpenSubjectDao;

@Service
public class ExamServiceImpl implements ExamService {

	@Autowired
	ExamDao examDao;
	
	@Autowired
	OpenSubjectDao openSubjectDao;
	
	@Autowired
	GradeDao gradeDao;
	
	@Autowired
	AttendDao attendDao;
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForExam(String professorCode) {
		
		List<OpenSubjectDomain> openSubjectDomain =
				examDao.professorSubjectSelectForExam(professorCode);
		
		return openSubjectDomain;		
	}
	
	@Override
	public List<ExamQuestionsDomain> professorExamSelect(String openSubjectCode) {
		
		List<ExamQuestionsDomain> examQuestionsDomain =
				examDao.professorExamSelect(openSubjectCode);
		
		return examQuestionsDomain;	
	}
	
	@Override
	public AcademicCalendarDomain midAcademicCalendarCodeSelect(String openSubjectCode) {
		
		AcademicCalendarDomain academicCalendarDomain
			= examDao.midAcademicCalendarCodeSelect(openSubjectCode);
		
		return academicCalendarDomain;
		
	}
	
	@Override
	public AcademicCalendarDomain lastAcademicCalendarCodeSelect(String openSubjectCode) {
		
		AcademicCalendarDomain academicCalendarDomain
			= examDao.lastAcademicCalendarCodeSelect(openSubjectCode);
		
		return academicCalendarDomain;
		
	}
	
	@Override
	public int[] examQuestionsNo() {
		
		
		
		int[] questionsNo = new int[20];
		
		for(int i=0; i<20; i++) {
			questionsNo[i] = i+1;
			//System.out.println(questionsNo[i]);
		}
		
		return questionsNo;
		
	}
	
	@Override
	public void examQuestionInsert(ExamQuestionsDomain examQuestionsDomain, CommonsMultipartFile cmf) {
		
		UUID uuid = UUID.randomUUID();
		
		String examFileName = uuid.toString().replace("-", "");
		String examFileExt = cmf.getOriginalFilename().substring(cmf.getOriginalFilename().lastIndexOf(".")+1);
		int examFileSize = (int) cmf.getSize();
		String examFileType = cmf.getContentType();
		String examOriginFileName = cmf.getOriginalFilename();
		
/*		vallidation
		System.out.println("examOriginFileName ---> " + examOriginFileName);
		System.out.println("examFileType ---> " + examFileType);
		System.out.println("examFileSize ---> " + examFileSize);
		System.out.println("examFileName ---> " + examFileName);
		System.out.println("examFileExt ---> " + examFileExt);*/
		
		examQuestionsDomain.setExamFileName(examFileName);
		examQuestionsDomain.setExamFileExt(examFileExt);
		examQuestionsDomain.setExamFileSize(examFileSize);
		examQuestionsDomain.setExamOriginFileName(examOriginFileName);
		examQuestionsDomain.setExamFileType(examFileType);
		
		System.out.println("=============================================");
		System.out.println("examQuestionsDomain : " + examQuestionsDomain);
		
		//dao 호출
		
		examDao.examQuestionInsert(examQuestionsDomain);		
		
	}
	
	@Override
	public List<ExamQuestionsDomain> midExamQuestionDetail(String openSubjectCode) {
		
		List<ExamQuestionsDomain> examQuestionsDomain
			= examDao.midExamQuestionSelect(openSubjectCode);
		
		return examQuestionsDomain;
		
	}
	
	@Override
	public List<ExamQuestionsDomain> finalExamQuestionDetail(String openSubjectCode) {
		
		List<ExamQuestionsDomain> examQuestionsDomain
			= examDao.finalExamQuestionSelect(openSubjectCode);		
		
		return examQuestionsDomain;
		
	}
	//우영
	@Override
	public Map<String, Object> examList(String lectureCode) {
		
		Map<String,Object> map = new HashMap<String, Object>();
	
		//강의코드로 -> lecture객체받아오기 openSubjectCode, academicCalendarCode 코드 받아오기
		LectureDomain oneLeture= openSubjectDao.oneLecture(lectureCode);
		
		
		//oneLeture객체로 -> , 시험시간 map에 저장
		TestPaperDomain oneTestPaperDomain = examDao.oneTestPaperDomain(oneLeture);
		map.put("testTime", oneTestPaperDomain.getTestTime());
		
		//받아온 testPaperDomain객체로 -> examQuestion객체 받아오기
		//examQuestion객체 전체를 Map에 저장
		map.put("examQuestionsList", examDao.examQuestionsList(oneTestPaperDomain.getTestPaperCode()));
				
		return map;
	}

	
	//학생이 시험문제를 풀고 답안 제출을 할 경우
	@Override
	public void answerPaperAdd(String attendCode, String userCode, String testPaperCode, List<String> score,
			List<String> examQuestionCode) {
		
	//회원의 학생코드 받기
	String studentCode = gradeDao.studentCode(userCode).getStudentCode();
	
	for(int i=0; i < score.size(); i++){
		
		if(score.get(i).equals("")){
		
			score.set(i, "0");
		}
		
		System.out.println("score : " + score.get(i));
	}
	
	AnswerDomain answerDomain = new AnswerDomain();
	
	answerDomain.setStudentCode(studentCode);
	answerDomain.setTestPaperCode(testPaperCode);
	
	for(int i=0; i<score.size(); i++){
		answerDomain.setAnswerQuestion(Integer.parseInt(score.get(i)));
		answerDomain.setExamQuestionCode(examQuestionCode.get(i));
		examDao.answerPaperAdd(answerDomain);
	}		
	
	//시험 제출시 출석상태를 F->T로 변경
	attendDao.examAttendUpdate(attendCode);
}


//학생이 시험을 응시한적이 있나 체크
@Override
public AttendDomain examCheck(String userCode, String openSubjectCode, String lectureCode) {
	
	//회원의 학생코드 받기
	String studentCode = gradeDao.studentCode(userCode).getStudentCode();
	
	AttendDomain attendDomain = new AttendDomain();
	
	attendDomain.setStudentCode(studentCode);
	attendDomain.setOpenSubjectCode(openSubjectCode);
	attendDomain.setLectureCode(lectureCode);
	
	return examDao.examCheck(attendDomain);
}	
	
}
