package com.cyber.smedu.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.board.domain.BoardCategoryDomain;
import com.cyber.smedu.board.repositroy.BoardDao;
import com.cyber.smedu.helper.HelperPaging;
import com.cyber.smedu.user.domain.UserDomain;

@Service
public class BoardServiceImpl implements BoardService {
	private final int LINE_PER_PAGE = 10;
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

	
	//////////////////11.11 입력
	//학생이 수강후기 작성한 게시글이 있으면 받아오기
	@Override
	public List<BoardArticleDomain> studentLectureReviewList(String userCode) {

		return boardDao.studentLectureReviewList(userCode);
	}

	
	//학생이 수강후기 입력 페이지로 이동할때
	@Override
	public BoardArticleDomain lectureReviewBoard(String boardArticleCode) {
		
		return boardDao.lectureReviewBoard(boardArticleCode);
	}

	//학생이 수강후기 입력 페이지에서 글쓰기 버튼을 눌렀을때 
	@Override
	public void lectureReviewAdd(UserDomain userDomain, BoardArticleDomain boardArticleDomain) {

		String userCode = userDomain.getUserCode();
		String userName = userDomain.getUserName();
		
		boardArticleDomain.setUserCode(userCode);
		boardArticleDomain.setBoardArticleWriter(userName);
		
		boardDao.lectureReviewAdd(boardArticleDomain);
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
	public List<BoardArticleDomain> selectBoardConsultingList(int page, String word) {
		HelperPaging helperPaging = new HelperPaging(page,LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", "board_code5");
		map.put("helperPaging", helperPaging);
		map.put("word", word);
		List<BoardArticleDomain> boardConsultingList = boardDao.selectBoardArticleList(map);
		map.put("boardConsultingList", boardConsultingList);
		return boardConsultingList;
	}
	
	//공지사항 리스트
	@Override
	public List<BoardArticleDomain> communityNoticeList(int page, String word) {
		HelperPaging helperPaging = new HelperPaging(page,LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", "board_code1");
		map.put("helperPaging", helperPaging);
		map.put("word", word);
		List<BoardArticleDomain> boardConsultingList = boardDao.selectBoardArticleList(map);
		map.put("boardConsultingList", boardConsultingList);
		return boardConsultingList;
	}
	
	//공지사항 상세보기
	@Override
	public BoardArticleDomain communityNoticeDetail(String boardArticleCode) {
		BoardArticleDomain communityNoticeDetail = boardDao.selectBoardArticleDetail(boardArticleCode);
		
		return communityNoticeDetail;
	}
	
	//메인 공지사항 리스트
	@Override
	public List<BoardArticleDomain> mainCommunityNoticeList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", "board_code1");
		List<BoardArticleDomain> boardConsultingList = boardDao.selectMainBoardArticleList(map);
		map.put("boardConsultingList", boardConsultingList);
		return boardConsultingList;
	}
	
	//수강후기 리스트
	@Override
	public List<BoardArticleDomain> communityLectureReviewList(int page, String word) {
		HelperPaging helperPaging = new HelperPaging(page,LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", "board_code4");
		map.put("helperPaging", helperPaging);
		map.put("word", word);
		List<BoardArticleDomain> boardConsultingList = boardDao.selectBoardArticleList(map);
		map.put("boardConsultingList", boardConsultingList);
		return boardConsultingList;
	}
	
	//수강후기 상세보기
	@Override
	public BoardArticleDomain communityLectureReviewDetail(String boardArticleCode) {
		BoardArticleDomain communityLectureReviewDetail = boardDao.selectBoardArticleDetail(boardArticleCode);
		return communityLectureReviewDetail;
	}
	
	//메인 수강후기 리스트
	@Override
	public List<BoardArticleDomain> mainCommunityLectureReviewList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", "board_code4");
		List<BoardArticleDomain> boardConsultingList = boardDao.selectMainBoardArticleList(map);
		map.put("boardConsultingList", boardConsultingList);
		return boardConsultingList;
	}
	
	//FAQ 리스트
	@Override
	public List<BoardArticleDomain> communityFaq(String word) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", "board_code2");
		map.put("word", word);
		List<BoardArticleDomain> boardConsultingList = boardDao.selectBoardArticleList(map);
		map.put("boardConsultingList", boardConsultingList);
		return boardConsultingList;
	}
	
	//자료실 리스트
	@Override
	public List<BoardArticleDomain> communityDataList(int page, String word) {
		HelperPaging helperPaging = new HelperPaging(page,LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", "board_code3");
		map.put("helperPaging", helperPaging);
		map.put("word", word);
		List<BoardArticleDomain> boardConsultingList = boardDao.selectBoardArticleList(map);
		map.put("boardConsultingList", boardConsultingList);
		return boardConsultingList;
	}
	
	//수강후기 상세보기
	@Override
	public BoardArticleDomain communityDataDetail(String boardArticleCode) {
		BoardArticleDomain communityDataDetail = boardDao.selectBoardArticleDetail(boardArticleCode);
		return communityDataDetail;
	}
	
	//페이징 <첫번째>
	@Override
	public int getStartPage(int page) {
        return (int)(Math.ceil((double)page/5)-1)*5 +1;
	}
	
	//페이징 <마지막> 
	@Override
	public int getLastPage(String boardCode) {
	    return (int)(Math.ceil((double)boardDao.selectBoardTotalCount(boardCode)/LINE_PER_PAGE));
	}
	//조회수 올리기
	@Override
	public int updateBoardArticleReadCount(String boardArticleCode) {
		return boardDao.updateBoardArticleReadCount(boardArticleCode);
	}	
	
	/*현호*/
}
