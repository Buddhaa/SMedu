package com.cyber.smedu.objection.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.objection.domain.ObjectionDomain;
import com.cyber.smedu.opensubject.domain.OpenSubjectDomain;

@Repository
public class ObjectionDaoImpl implements ObjectionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.cyber.smedu.mapper.ObjectionMapper";
	
	@Override
	public List<OpenSubjectDomain> professorSubjectSelectForObjection(String professorCode) {
		
		//System.out.println("03 professorSubjectSelectForObjection <-- ObjectionDaoImpl.java");
		
		return sqlSession.selectList(NS+".professorSubjectSelectForObjection", professorCode);
		
	}
	
	@Override
	public List<ObjectionDomain> professorStudentObjectionInfoSelect(Map<String, Object> map) {
		
		//System.out.println("03 professorStudentObjectionInfoSelect <-- ObjectionDaoImpl.java");
		
		return sqlSession.selectList(NS+".professorStudentObjectionInfoSelect", map);		
	}
	
	@Override
	public ObjectionDomain professorStudentObjectionDetail(String objectionCode) {
		
		//System.out.println("03 professorStudentObjectionDetail <-- ObjectionDaoImpl.java");
		//System.out.println("objectionCode : " + objectionCode);
		
		return sqlSession.selectOne(NS+".professorStudentObjectionDetail", objectionCode);		
	}
	
	@Override
	public ObjectionDomain professorStudentObjectionReplyDetail(String objectionCode) {
				
		return sqlSession.selectOne(NS+".professorStudentObjectionDetail", objectionCode);
	}
	
	@Override
	public void professorStudentObjectionReply(ObjectionDomain objectionDomain) {
		
		//System.out.println("03 professorStudentObjectionReply <-- ObjectionDaoImpl.java");
		
		sqlSession.update(NS+".professorStudentObjectionReply", objectionDomain);
		
	}
	//우영
	//과목 선택시 이의신청 내용 리스트 받아오기
	@Override
	public List<ObjectionDomain> objectionView(String studentCode) {
		
		return sqlSession.selectList(NS + ".objectionView", studentCode);
	}


	//개설과목 코드로 InsertForm에 가져갈 객체 만들기
	@Override
	public ObjectionDomain objectionInserForm(ObjectionDomain openSubjectCode) {
		
		return sqlSession.selectOne(NS + ".objectionInserForm", openSubjectCode);
	}

	
	//////////////////11.14 입력
	//성적이의신청 등록처리
	@Override
	public void objectionAdd(ObjectionDomain objectionDomain) {
		
		sqlSession.insert(NS + ".objectionAdd", objectionDomain);	
	}


	//학생이 이의신청 글을 상세보기를 할때 
	@Override
	public ObjectionDomain objectionDetail(String objectionCode) {
		
		return sqlSession.selectOne(NS + ".objectionDetail", objectionCode);
	}
	//장용
}
