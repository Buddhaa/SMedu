package com.cyber.smedu.board.repositroy;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.board.domain.BoardCategoryDomain;
import com.cyber.smedu.user.domain.StudentDomain;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	private String NS = "com.cyber.smedu.mapper.BoardMapper";
	@Autowired SqlSessionTemplate sqlSession;
	
	//학생의 상담내역 페이지 이동
	@Override
	public List<BoardArticleDomain> consultingHistory(String userCode) {
		System.out.println("userCode Dao"+userCode);
		return  sqlSession.selectList(NS+".consultingHistory", userCode);
	}
	
	//학생의 상담내역 디테일페이지 이동
	@Override
	public BoardArticleDomain consultingHistoryDetail(String boardArticleCode) {
		return sqlSession.selectOne(NS+".consultingHistoryDetail", boardArticleCode);
	}
	
	//회원의 학생코드 받기
	@Override
	public StudentDomain studentCode(String userCode) {		
		
		return sqlSession.selectOne(NS+".studentSelectOne", userCode);
	}
	/*장용*/
	//게시판 카테고리
	@Override
	public List<BoardCategoryDomain> selectBoardCategoryList() {
		return sqlSession.selectList(NS+".boardCategoryList");
	}
	
	//상담게시판 리스트
	@Override
	public List<BoardArticleDomain> selectBoardConsultingList(){
		return sqlSession.selectList(NS+".boardConsultingList");
	}
	/*현호*/

}
