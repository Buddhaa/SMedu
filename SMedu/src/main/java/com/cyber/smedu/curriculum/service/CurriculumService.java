package com.cyber.smedu.curriculum.service;

import java.util.Map;

//인터페이스
public interface CurriculumService {
	public Map<String, Object> selectDepartmentList();
	Map<String, Object> selectSubjectList();
	Map<String, Object> adminSelectSubjectList(String departmentCode, String subjectName, String subjectState);
}
