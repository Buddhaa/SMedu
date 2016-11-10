package com.cyber.smedu.curriculum.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.curriculum.domain.DepartmentDomain;
import com.cyber.smedu.curriculum.domain.SubjectDomain;
import com.cyber.smedu.curriculum.repository.CurriculumDao;

@Service
public class CurriculumServiceImpl implements CurriculumService {
	@Autowired CurriculumDao curriculumDao;
	
	//학과 리스트
	@Override
	public Map<String, Object> selectDepartmentList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<DepartmentDomain> departmentList = curriculumDao.selectDepartmentList();
		map.put("departmentList", departmentList);
		return map;
	}
	
	//과목 리스트
	@Override
	public Map<String, Object> selectSubjectList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SubjectDomain> subjectList = curriculumDao.selectSubjectList();
		map.put("subjectList", subjectList);
		return map;
	}
}
