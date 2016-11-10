package com.cyber.smedu.board.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.board.domain.BoardArticleDomain;

public interface BoardService {
	
	//학생의 상담내역 페이지 이동
	List<BoardArticleDomain> consultingHistory(String userCode);
	
	//학생의 상담내역 디테일 페이지 이동
	BoardArticleDomain consultingHistoryDetail(String boardArticleCode);

	Map<String, Object> selectBoardCategoryList();

	Map<String, Object> selectBoardConsultingList();
		
}
