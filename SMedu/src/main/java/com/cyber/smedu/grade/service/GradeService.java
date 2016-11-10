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

	List<StudentDomain> professorStudentNameAndCodeSelect(String openSubjectCode);

	List<OpenSubjectDomain> professorSubjectSelectForManage(String professorCode);

	FinalGradeDomain professorStudentFinalGradeSelect(String userCode);

	List<OpenSubjectDomain> professorSubjectSelectForCheck(String professorCode);

	List<UserDomain> professorStudentInfoSelect(String openSubjectCode);

	List<GradeDomain> professorStudentGradeSelect(String userCode);

	List<StudentDomain> finalResultGrade(String userCode);

	List<GradeDomain> studentCreditManage(String userCode, String openSubjectCode);

}
