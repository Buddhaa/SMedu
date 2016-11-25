package com.cyber.smedu.board.repositroy;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.board.domain.BoardCategoryDomain;
import com.cyber.smedu.user.domain.StudentDomain;

public interface BoardDao {

	//회원의 학생코드 받기
	StudentDomain studentCode(String userCode);	
		
	//학생의 상담내역 페이지 이동
	List<BoardArticleDomain> consultingHistory(String userCode);
	
	//학생의 상담내역 디테일페이지 이동
	BoardArticleDomain consultingHistoryDetail(String boardArticleCode);

	List<BoardCategoryDomain> selectBoardCategoryList();
	
	public int selectBoardTotalCount(String boardCode);

	List<BoardArticleDomain> selectBoardArticleList(Map<String, Object> map);

	BoardArticleDomain selectBoardArticleDetail(String boardArticleCode);

	int updateBoardArticleReadCount(String boardArticleCode);

	List<BoardArticleDomain> studentLectureReviewList(String userCode);

	BoardArticleDomain lectureReviewBoard(String boardArticleCode);

	void lectureReviewAdd(BoardArticleDomain boardArticleDomain);

	List<BoardArticleDomain> selectMainBoardArticleList(Map<String, Object> map);

}
