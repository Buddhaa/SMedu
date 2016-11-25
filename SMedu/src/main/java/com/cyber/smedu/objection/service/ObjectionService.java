package com.cyber.smedu.objection.service;

import java.util.List;

import com.cyber.smedu.objection.domain.ObjectionDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

public interface ObjectionService {

	List<OpenSubjectDomain> professorSubjectSelectForObjection(String professorCode);

	ObjectionDomain professorStudentObjectionDetail(String objectionCode);

	ObjectionDomain professorStudentObjectionReplyDetail(String objectionCode);

	void professorStudentObjectionReply(ObjectionDomain objectionDomain);

	List<ObjectionDomain> objectionView(String userCode);

	ObjectionDomain objectionInsert(String userCode, String openSubjectCode);

	void objectionAdd(String userCode, ObjectionDomain objectionDomain);

	ObjectionDomain objectionDetail(String objectionCode);

	List<ObjectionDomain> professorStudentObjectionInfoSelect(String openSubjectCode, String searchWord);


}
