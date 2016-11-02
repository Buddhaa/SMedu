package com.cyber.smedu.user.service;

import java.util.Map;

//인터페이스
public interface UserService {
	
	public Map<String, Object> login(String userId, String userPw);

	public Map<String, Object> adminLogin(String userId, String userPw);
}
