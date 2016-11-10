package com.cyber.smedu.board.repositroy;

import java.util.List;

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

	List<BoardArticleDomain> selectBoardConsultingList();
}
