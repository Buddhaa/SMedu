package com.cyber.smedu.curriculum.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.curriculum.domain.DepartmentDomain;
import com.cyber.smedu.curriculum.domain.SubjectDomain;

//인터페이스
public interface CurriculumDao {

	List<DepartmentDomain> selectDepartmentList();

	DepartmentDomain selectDepartmentOne(String departmentCode);

	List<SubjectDomain> selectSubjectList();

	List<SubjectDomain> adminSelectSubjectList(Map<String, Object> map);

	SubjectDomain subjectSelectInfo(String subjectCode);

}
