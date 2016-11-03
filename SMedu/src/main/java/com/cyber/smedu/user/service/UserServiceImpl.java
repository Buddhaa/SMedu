package com.cyber.smedu.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyber.smedu.user.domain.PlannerDomain;
import com.cyber.smedu.user.domain.ProfessorDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;
import com.cyber.smedu.user.repository.UserDao;
import com.cyber.smedu.user.repository.UserDaoImpl;

@Transactional
@Service
public class UserServiceImpl implements UserService {
	@Autowired UserDao userDao;
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

	@Override
	public int addProfessor(UserDomain user, ProfessorDomain professor) {
		if(user.getUserLevel().equals("교수")){
			userDao.insertUser(user);
			userDao.insertProfessor(professor);	
			return 1;
		}
		return 0;
	}

	@Override
	public int addPlanner(UserDomain user, PlannerDomain planner) {
		if(user.getUserLevel().equals("플래너")){
			userDao.insertUser(user);
			userDao.insertPlanner(planner);	
			return 1;
		}
		return 0;
	}
}
