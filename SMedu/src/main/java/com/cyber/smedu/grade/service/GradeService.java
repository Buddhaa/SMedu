package com.cyber.smedu.grade.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.grade.domain.FinalGradeDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;

public interface GradeService {

	Map<String, Object> adminStudentGradeList(String departmentCode, String userName);

	List<OpenSubjectDomain> professorSubjectSelectForManage(String professorCode);

	FinalGradeDomain professorStudentFinalGradeSelect(String userCode);

	List<OpenSubjectDomain> professorSubjectSelectForCheck(String professorCode);

	List<GradeDomain> professorStudentGradeSelect(String userCode);

	List<FinalGradeDomain> finalResultGrade(String userCode);

	Map<String, Object> adminStudentGradeDetail(String userCode, String studentCode, String cardinalCode, String openSubjectCode);

	List<GradeDomain> creditManage(String userCode);

	List<UserDomain> professorStudentInfoSelect(String openSubjectCode, String searchWord);

	List<StudentDomain> professorStudentNameAndCodeSelect(String openSubjectCode, String searchWord);

}
