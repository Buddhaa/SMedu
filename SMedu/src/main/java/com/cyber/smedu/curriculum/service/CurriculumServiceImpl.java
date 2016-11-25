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
	//관리자 과목 리스트(검색)
	@Override
	public Map<String, Object> adminSelectSubjectList(String departmentCode, String subjectName, String subjectState) {
		Map<String, Object> map = new HashMap<String, Object>();
		//검색창 학과 리스트
		List<DepartmentDomain> departmentList = curriculumDao.selectDepartmentList();
		map.put("departmentList", departmentList);
		map.put("departmentCode", departmentCode);
		map.put("subjectName", subjectName);
		map.put("subjectState", subjectState);
		
		List<SubjectDomain> subjectList = curriculumDao.adminSelectSubjectList(map);
		map.put("subjectList", subjectList);
		return map;
	}
	//의기
	
	//과목 리스트
	@Override
	public Map<String, Object> selectSubjectList() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<SubjectDomain> subjectList = curriculumDao.selectSubjectList();
		map.put("subjectList", subjectList);
		return map;
	}	
	//과목 상세보기
	@Override
	public SubjectDomain subjectSelectInfo(String subjectCode) {	
		return curriculumDao.subjectSelectInfo(subjectCode);
	}
	//현호
}
