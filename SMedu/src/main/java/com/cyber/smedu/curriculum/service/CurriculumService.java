package com.cyber.smedu.curriculum.service;

import java.util.Map;

import com.cyber.smedu.curriculum.domain.SubjectDomain;

//인터페이스
public interface CurriculumService {
	public Map<String, Object> selectDepartmentList();
	Map<String, Object> selectSubjectList();
	Map<String, Object> adminSelectSubjectList(String departmentCode, String subjectName, String subjectState);
	SubjectDomain subjectSelectInfo(String subjectCode);
}
