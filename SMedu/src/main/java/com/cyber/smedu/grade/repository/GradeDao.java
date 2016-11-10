package com.cyber.smedu.grade.repository;

import java.util.List;

import com.cyber.smedu.grade.domain.FinalGradeDomain;
import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.StudentDomain;
import com.cyber.smedu.user.domain.UserDomain;

public interface GradeDao {

	List<OpenSubjectDomain> professorSubjectSelectForCheck(String professorCode);

	List<UserDomain> professorStudentInfoSelect(String openSubjectCode);

	List<GradeDomain> professorStudentGradeSelect(String userCode);

	FinalGradeDomain professorStudentFinalGradeSelect(String userCode);

	List<OpenSubjectDomain> professorSubjectSelectForManage(String professorCode);

	List<StudentDomain> professorStudentNameAndCodeSelect(String openSubjectCode);

	StudentDomain studentCode(String userCode);

	List<StudentDomain> finalResultGrade(String studentCode);

	List<GradeDomain> studentCreditManage(GradeDomain oneGradeDomain);

}
