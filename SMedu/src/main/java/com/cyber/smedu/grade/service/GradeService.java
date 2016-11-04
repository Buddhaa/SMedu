package com.cyber.smedu.grade.service;

import java.util.List;

import com.cyber.smedu.grade.domain.GradeDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;
import com.cyber.smedu.user.domain.UserDomain;

public interface GradeService {

	List<OpenSubjectDomain> professorSubjectSelect(String professorCode);

	List<UserDomain> professorStudentInfoSelect(String openSubjectCode);

	List<GradeDomain> professorStudentGradeSelect(String userCode);

}
