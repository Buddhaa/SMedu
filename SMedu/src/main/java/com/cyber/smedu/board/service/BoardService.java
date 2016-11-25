package com.cyber.smedu.board.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.user.domain.UserDomain;

public interface BoardService {
	
	//학생의 상담내역 페이지 이동
	List<BoardArticleDomain> consultingHistory(String userCode);
	
	//학생의 상담내역 디테일 페이지 이동
	BoardArticleDomain consultingHistoryDetail(String boardArticleCode);

	Map<String, Object> selectBoardCategoryList();
	
	public int getStartPage(int page);
	
	public int getLastPage(String boardCode);

	public List<BoardArticleDomain> selectBoardConsultingList(int page, String word);

	List<BoardArticleDomain> communityNoticeList(int page, String word);

	List<BoardArticleDomain> communityLectureReviewList(int page, String word);

	List<BoardArticleDomain> communityFaq(String word);

	List<BoardArticleDomain> communityDataList(int page, String word);

	BoardArticleDomain communityNoticeDetail(String boardArticleCode);

	BoardArticleDomain communityLectureReviewDetail(String boardArticleCode);

	BoardArticleDomain communityDataDetail(String boardArticleCode);
	
	public int updateBoardArticleReadCount(String boardArticleCode);

	List<BoardArticleDomain> studentLectureReviewList(String userCode);

	BoardArticleDomain lectureReviewBoard(String boardArticleCode);

	void lectureReviewAdd(UserDomain userDomain, BoardArticleDomain boardArticleDomain);

	List<BoardArticleDomain> mainCommunityLectureReviewList();

	List<BoardArticleDomain> mainCommunityNoticeList();

}
