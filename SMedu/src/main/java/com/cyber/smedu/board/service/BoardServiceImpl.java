package com.cyber.smedu.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.board.domain.BoardCategoryDomain;
import com.cyber.smedu.board.repositroy.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired BoardDao boardDao;
	
	//나의 상담내역페이지 이동 
	@Override
	public List<BoardArticleDomain> consultingHistory(String userCode) {
		
		List<BoardArticleDomain> consultingHistoryList = boardDao.consultingHistory(userCode);
		return consultingHistoryList;
	}
	
	//나의 상담내역디테일 페이지 이동
	@Override
	public BoardArticleDomain consultingHistoryDetail(String boardArticleCode) {
		
		BoardArticleDomain boardArticleDomain = boardDao.consultingHistoryDetail(boardArticleCode);
		return boardArticleDomain;
	}
	/*장용*/
	//게시판 카테고리
		@Override
		public Map<String, Object> selectBoardCategoryList() {
			Map<String, Object> map = new HashMap<String, Object>();
			List<BoardCategoryDomain> boardCategoryList = boardDao.selectBoardCategoryList();
			map.put("boardCategoryList", boardCategoryList);
			return map;
		}
		
		//상담리스트
		@Override
		public Map<String, Object> selectBoardConsultingList() {
			Map<String, Object> map = new HashMap<String, Object>();
			List<BoardArticleDomain> boardConsultingList = boardDao.selectBoardConsultingList();
			map.put("boardConsultingList", boardConsultingList);
			return map;
		}
	/*현호*/

		

}
