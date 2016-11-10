package com.cyber.smedu.curriculum.service;

import java.util.Map;

//인터페이스
public interface CurriculumService {
	public Map<String, Object> selectDepartmentList();
	public Map<String, Object> selectSubjectList();
}
