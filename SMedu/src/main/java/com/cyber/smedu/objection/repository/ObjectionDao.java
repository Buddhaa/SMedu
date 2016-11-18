package com.cyber.smedu.objection.repository;

import java.util.List;

import com.cyber.smedu.objection.domain.ObjectionDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

public interface ObjectionDao {

	List<OpenSubjectDomain> professorSubjectSelectForObjection(String professorCode);

	List<ObjectionDomain> professorStudentObjectionInfoSelect(String openSubjectCode);

	ObjectionDomain professorStudentObjectionDetail(String objectionCode);

	ObjectionDomain professorStudentObjectionReplyDetail(String objectionCode);

	void professorStudentObjectionReply(ObjectionDomain objectionDomain);

	List<ObjectionDomain> objectionView(String studentCode);

	ObjectionDomain objectionInserForm(ObjectionDomain openSubjectCode);

	void objectionAdd(ObjectionDomain objectionDomain);

	ObjectionDomain objectionDetail(String objectionCode);


}
