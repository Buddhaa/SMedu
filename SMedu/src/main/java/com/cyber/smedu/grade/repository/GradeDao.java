package com.cyber.smedu.grade.repository;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.grade.domain.FinalGradeDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;

public interface GradeDao {

	List<OpenSubjectDomain> professorSubjectSelectForCheck(String professorCode);

	List<GradeDomain> professorStudentGradeSelect(String userCode);

	FinalGradeDomain professorStudentFinalGradeSelect(String userCode);

	List<OpenSubjectDomain> professorSubjectSelectForManage(String professorCode);

	StudentDomain studentCode(String userCode);

	List<FinalGradeDomain> finalResultGrade(String studentCode);

	List<FinalGradeDomain> adminStudentFinalGrade(String studentCode);

	List<GradeDomain> adminStudentSubjectGrade(Map<String, Object> map);

	List<GradeDomain> creditManage(String studentCode);

	List<UserDomain> professorStudentInfoSelect(Map<String, Object> map);

	List<StudentDomain> professorStudentNameAndCodeSelect(Map<String, Object> map);

}
