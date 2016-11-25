package com.cyber.smedu.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyber.smedu.academiccalendar.domain.CardinalDomain;
import com.cyber.smedu.attend.domain.AttendDomain;
import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.curriculum.domain.DepartmentDomain;
import com.cyber.smedu.curriculum.repository.CurriculumDao;
import com.cyber.smedu.opensubject.domain.LectureDomain;
import com.cyber.smedu.user.domain.PlannerDomain;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;
import com.cyber.smedu.user.repository.UserDao;

@Transactional
@Service
public class UserServiceImpl implements UserService {
	@Autowired UserDao userDao;
	@Autowired CurriculumDao curriculumDao;
	//관리자 페이지 로그인 처리
	@Override
	public Map<String, Object> adminLogin(String userId, String userPw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		UserDomain userDomain = userDao.login(map);
		if(userDomain != null) {
			if(userDomain.getUserLevel().equals("관리자")) {
				map.put("userInfo", userDomain);
			} else {
				map.put("loginFalse", "권한이 없습니다.");
			}
			return map;
		} else {
			map.put("loginFalse", "아이디와 비밀번호를 확인해주세요.");
			return map;
		}
	}
	//메인페이지 로그인 처리
	@Override
	public Map<String, Object> login(String userId, String userPw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		UserDomain userDomain = userDao.login(map);
		if(userDomain != null) {
			if(userDomain.getUserState().equals("정상")) {
				map.put("userInfo", userDomain);
				if(userDomain.getUserLevel().equals("관리자")) {
					
				} else if (userDomain.getUserLevel().equals("교수")) {
					ProfessorDomain professorDomain = userDao.loginProfessor(userDomain.getUserCode());
					map.put("userPlusInfo", professorDomain);
				} else if (userDomain.getUserLevel().equals("플래너")) {
					PlannerDomain plannerDomain = userDao.loginPlanner(userDomain.getUserCode());
					map.put("userPlusInfo", plannerDomain);
				} else if (userDomain.getUserLevel().equals("학생")) {
					StudentDomain studentDomain = userDao.loginStudent(userDomain.getUserCode());
					map.put("userPlusInfo", studentDomain);
				}
				return map;
				
			} else if(userDomain.getUserState().equals("승인대기")) {
				map.put("loginFalse", "승인 대기중인 회원입니다.");
			} else if(userDomain.getUserState().equals("탈퇴")) {
				map.put("loginFalse", "탈퇴된 계정입니다.");
			}
			return map;
		} else {
			map.put("loginFalse", "아이디와 비밀번호를 확인해주세요.");
			return map;
		}
	}
	//학생 입력
	@Override
	public int addStudent(UserDomain user, StudentDomain student) {
		if(user.getUserLevel().equals("학생")){
			userDao.insertUser(user);
			userDao.insertStudent(student);	
			return 1;
		} 
		return 0;
	}
	//교수 입력
	@Override
	public int addProfessor(UserDomain user, ProfessorDomain professor) {
		if(user.getUserLevel().equals("교수")){
			userDao.insertUser(user);
			userDao.insertProfessor(professor);	
			return 1;
		}
		return 0;
	}
	//플래너 입력
	@Override
	public int addPlanner(UserDomain user, PlannerDomain planner) {
		if(user.getUserLevel().equals("플래너")){
			userDao.insertUser(user);
			userDao.insertPlanner(planner);	
			return 1;
		}
		return 0;
	}
	//관리자 회원리스트 출력
	@Override
	public Map<String, Object> selectAdminUserList(String departmentCode, String userLevel, String userName, String userState) {
		Map<String, Object> map = new HashMap<String, Object>();
		//검색창 학과리스트
		List<DepartmentDomain> departmentList = curriculumDao.selectDepartmentList();
		map.put("departmentList", departmentList);
		//회원리스트
		//검색 값 확인
		map.put("departmentCode", departmentCode);
		map.put("userLevel", userLevel);
		map.put("userName", userName);
		map.put("userState", userState);
		List<UserDomain> userList = userDao.selectAdminUserList(map);
		map.put("userList", userList);
		return map;
	}
	//관리자 회원 상세보기
	@Override
	public Map<String, Object> selectAdminUserDetail(String userCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		UserDomain userDomain = userDao.selectAdminUserDetail(userCode);
		map.put("originInfo", userDomain);
		if(userDomain.getUserLevel().equals("교수")) {
			ProfessorDomain professorDomain = userDao.selectAdminProfessorDetail(userCode);
			map.put("plusInfo", professorDomain);
		} else if (userDomain.getUserLevel().equals("플래너")) {
			PlannerDomain plannerDomain = userDao.selectAdminPlannerDetail(userCode);
			map.put("plusInfo", plannerDomain);
		} else if (userDomain.getUserLevel().equals("학생")) {
			StudentDomain studentDomain = userDao.selectAdminStudentDetail(userCode);
			map.put("plusInfo", studentDomain);
		}
		return map;
	}
	//관리자 가입승인요청리스트 출력
	@Override
	public Map<String, Object> selectAdminJoinRequestList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<UserDomain> joinRequestList = userDao.selectAdminJoinRequestList();
		map.put("joinRequestList", joinRequestList);
		return map;
	}
	//학생정보수정페이지 이동
	@Override
	public Map<String,Object> studentSelectOne(String userCode) {	
		Map<String,Object> map = new HashMap<String, Object>();
		
		StudentDomain student = userDao.studentSelectOne(userCode);
		CardinalDomain cardinal = userDao.cardinalSelectOne(student.getCardinalCode());
		
		map.put("student", student);
		map.put("cardinal", cardinal);
		
		return map;
		}



	//학생정보수정처리
	@Override
	public void studentUpdate(StudentDomain studentDomain) {
		userDao.studentUpdate(studentDomain);
				
	}
	
	@Override
	public ProfessorDomain getProfessorSelectOne(String userCode) {
		
		System.out.println("02 getProfessorSelectOne <-- UserServiceImpl.java");
		System.out.println("userCode : " + userCode);
		
		ProfessorDomain professor = userDao.professorSelectOne(userCode);
		
		return professor;
	}
	
	@Override
	public void professorUpdate(ProfessorDomain professorDomain) {
		
		System.out.println("02 professorUpdate <-- UserServiceImpl.java");
		System.out.println("userCode : " + professorDomain.getUserCode());
		
		userDao.professorUpdate(professorDomain);
		
	}
	
	@Override
	public void userStateUpdate(String userCode) {
		
		System.out.println("02 userStateUpdate <-- UserServiceImpl.java");
		
		userDao.userStateUpdate(userCode);
		
	}
	
	//교수 상세보기
	@Override
	public ProfessorDomain professorSelectInfo(String professorCode) {
		System.out.println("professorCode serv:"+professorCode);
		return userDao.professorSelectInfo(professorCode);
	}
	//아이디 중복체크
	@Override
	public UserDomain userIdCheck(String userId) {
		return userDao.userIdCheck(userId);
	}
}
