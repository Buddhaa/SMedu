package com.cyber.smedu.board.repositroy;

import java.util.List;
import java.util.Map;

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

	
	//////////////////11.11 입력
	//학생이 수강후기 작성한 게시글이 있으면 받아오기	
	@Override
	public List<BoardArticleDomain> studentLectureReviewList(String userCode) {
		
		return sqlSession.selectList(NS+".studentLectureReviewList", userCode);
	}

	//학생이 수강후기 입력 페이지로 이동할때
	@Override
	public BoardArticleDomain lectureReviewBoard(String boardArticleCode) {
		
		return sqlSession.selectOne(NS+".lectureReviewBoard", boardArticleCode);
	}

	//학생이 수강후기 입력 페이지에서 글쓰기 버튼을 눌렀을때 
	@Override
	public void lectureReviewAdd(BoardArticleDomain boardArticleDomain) {
		
		sqlSession.insert(NS+".lectureReviewAdd", boardArticleDomain);	
	}
	/*장용*/
	//게시판 카테고리
	@Override
	public List<BoardCategoryDomain> selectBoardCategoryList() {
		return sqlSession.selectList(NS+".selectBoardCategoryList");
	}
	
	//상담게시판,공지사항,자료실,수강후기,FAQ 리스트
	@Override
	public List<BoardArticleDomain> selectBoardArticleList(Map<String, Object> map){
		return sqlSession.selectList(NS+".selectBoardArticleList", map);
	}
	
	//공지사항,자료실,수강후기 상세보기
	@Override
	public BoardArticleDomain selectBoardArticleDetail(String boardArticleCode) {
		return sqlSession.selectOne(NS+".selectBoardArticleDetail", boardArticleCode);
	}
	
	//페이지 갯수
	@Override
	public int selectBoardTotalCount(String boardCode) {
        return sqlSession.selectOne(NS+".selectBoardTotalCount", boardCode);
   	}
	
	//조회수 올리기
	@Override
	public int updateBoardArticleReadCount(String boardArticleCode) {
        return sqlSession.update(NS+".updateBoardArticleReadCount", boardArticleCode);
   	}
	//메인 공지사항, 수강후기
	@Override
	public List<BoardArticleDomain> selectMainBoardArticleList(Map<String, Object> map){
		return sqlSession.selectList(NS+".selectMainBoardArticleList", map);
	}
	
	/*현호*/

}
