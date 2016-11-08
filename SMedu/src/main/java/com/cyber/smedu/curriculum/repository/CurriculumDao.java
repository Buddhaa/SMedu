package com.cyber.smedu.curriculum.repository;

import java.util.List;

import com.cyber.smedu.curriculum.domain.DepartmentDomain;

//인터페이스
public interface CurriculumDao {

	List<DepartmentDomain> selectDepartmentList();

}
