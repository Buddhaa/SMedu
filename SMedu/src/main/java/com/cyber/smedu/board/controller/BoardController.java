package com.cyber.smedu.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cyber.smedu.academiccalendar.service.AcademicCalendarService;
import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.board.service.BoardService;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class BoardController {
	@Autowired BoardService boardService;
	@Autowired AcademicCalendarService academicCalendarService;
	
	//나의 상담내역페이지 이동
	@RequestMapping(value="/studentconsultingHistory", method=RequestMethod.GET)
	public String consultingHistory(Model model
									,@ModelAttribute(value="userInfo") UserDomain userDomain){
		String userCode = userDomain.getUserCode();
		
		model.addAttribute("board", boardService.consultingHistory(userCode));		
		
		return "student/mypage/mypage_consulting_history";	
	}
	
	
	//나의 상담내역디테일 페이지 이동
	@RequestMapping(value="/studentConsultingHistoryDetail", method=RequestMethod.GET)
	public String consultingHistoryDetail(Model model
											,@RequestParam(value="boardArticleCode") String boardArticleCode){
		
		
		BoardArticleDomain boardArticleDomain = boardService.consultingHistoryDetail(boardArticleCode);
		
		model.addAttribute("consultingHistoryDetail", boardArticleDomain);
		
		return "student/mypage/mypage_consulting_history_detail";
	}
	
	//////////////////11.10 입력
	//수강후기에서 자신의 올린 수강후기 내용 받아오기 
	@RequestMapping(value="/lectureReviewUpdate", method=RequestMethod.GET)
	public String lectureReviewUpdate(Model model
										,@RequestParam(value="boardArticleCode") String boardArticleCode){
		
		
		model.addAttribute("lectureReviewBoard", boardService.lectureReviewBoard(boardArticleCode)); 
		System.out.println(model.toString());
		return "student/classroom/classroom_lecture_review_update";				
	}
	
	
	
	//학생이 수강후기 페이지로 이동할때
	@RequestMapping(value="/classroomLectureReview", method=RequestMethod.GET)
	public String lectureReviewView(Model model
									,@ModelAttribute(value="userInfo") UserDomain userDomain){
		
		String userCode = userDomain.getUserCode();
		
		//학생이 수강후기 작성한 게시글이 있으면 받아오기		
		model.addAttribute("LectureReview", boardService.studentLectureReviewList(userCode));			
		
		return "student/classroom/classroom_lecture_review";		
	}
	
	
	//학생이 수강후기 페이지에서 글쓰기 폼으로 이동할때 
	@RequestMapping(value="/lectureReviewAddFrom", method=RequestMethod.GET)
	public String lectureReviewAddFrom(){
		
		return "student/classroom/classroom_lecture_review_insert";
	}
	
	//학생이 수강후기 입력 페이지에서 글쓰기 버튼을 눌렀을때 
	@RequestMapping(value="/lectureReviewAdd", method=RequestMethod.POST)
	public String lectureReviewAdd(BoardArticleDomain boardArticleDomain
									,@ModelAttribute(value="userInfo") UserDomain userDomain){
		
		boardService.lectureReviewAdd(userDomain, boardArticleDomain);
		
		return "redirect:/classroomLectureReview";
	}
	/*장용--------------------------------------------------------------------------*/
	//상담신청 페이지 이동
	@RequestMapping(value = "/smedu/consulting/consultingInsert", method = RequestMethod.GET)
	public String consultingInsert(Model model) {
		Map<String, Object> map = boardService.selectBoardCategoryList();
		model.addAttribute("boardCategoryList", map.get("boardCategoryList"));
		return "/smedu/consulting/consulting_insert";
	}
	
	//상담리스트 페이지 이동
	@RequestMapping(value = "/smedu/consulting/consultingList", method = RequestMethod.GET)
	public String boardCategoryList(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="word", required=false) String word) {
		String boardCode = "board_code5";
		
		model.addAttribute("boardConsultingList", boardService.selectBoardConsultingList(page,word));
		model.addAttribute("page", page);
        model.addAttribute("startPage", boardService.getStartPage(page));
        model.addAttribute("lastPage", boardService.getLastPage(boardCode));
		return "smedu/consulting/consulting_list";
	}
	
	//공지사항 리스트 페이지 이동
	@RequestMapping(value = "/smedu/community/communityNoticeList", method = RequestMethod.GET)
	public String communityNoticeList(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="word", required=false) String word) {
		String boardCode = "board_code1";
		
		model.addAttribute("boardCommunityNoticeList", boardService.communityNoticeList(page,word));
		model.addAttribute("page", page);
        model.addAttribute("startPage", boardService.getStartPage(page));
        model.addAttribute("lastPage", boardService.getLastPage(boardCode));
		return "smedu/community/community_notice_list";
	}
	
	//공지사항 상세보기 페이지 이동
	@RequestMapping(value = "/smedu/community/communityNoticeDetail", method = RequestMethod.GET)
	public String communityNoticeDetail(Model model,
			@RequestParam(value="boardArticleCode") String boardArticleCode){
		boardService.updateBoardArticleReadCount(boardArticleCode);
		BoardArticleDomain communityNoticeDetail = boardService.communityNoticeDetail(boardArticleCode);
		model.addAttribute("communityNoticeDetail", communityNoticeDetail);
		return "smedu/community/community_notice_detail";
	}
	
	//FAQ 페이지 이동
	@RequestMapping(value = "/smedu/community/communityFaq", method = RequestMethod.GET)
	public String communityFaq(Model model,
			@RequestParam(value="word", required=false) String word) {
		String boardCode = "board_code2";
		
		model.addAttribute("communityFaq", boardService.communityFaq(word));
        model.addAttribute("lastPage", boardService.getLastPage(boardCode));
		return "smedu/community/community_faq";
	}
	
	//자료실 페이지 이동
	@RequestMapping(value = "/smedu/community/communityDataList", method = RequestMethod.GET)
	public String communityDataList(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="word", required=false) String word) {
		String boardCode = "board_code3";
		
		model.addAttribute("communityDataList", boardService.communityDataList(page,word));
		model.addAttribute("page", page);
        model.addAttribute("startPage", boardService.getStartPage(page));
        model.addAttribute("lastPage", boardService.getLastPage(boardCode));
		return "smedu/community/community_data_list";
	}
	
	//자료실 상세보기 페이지 이동
	@RequestMapping(value = "/smedu/community/communityDataDetail", method = RequestMethod.GET)
	public String communityDataDetail(Model model,
			@RequestParam(value="boardArticleCode") String boardArticleCode){
		boardService.updateBoardArticleReadCount(boardArticleCode);
		BoardArticleDomain communityDataDetail = boardService.communityDataDetail(boardArticleCode);
		model.addAttribute("communityDataDetail", communityDataDetail);
		return "smedu/community/community_data_detail";
	}
	
	//학사일정 리스트 페이지 이동
	@RequestMapping(value = "/smedu/community/communityAcademiccalendarList", method = RequestMethod.GET)
	public String communityAcademiccalendarList(Model model,
			@RequestParam(value="page", defaultValue="1") int page) {
		model.addAttribute("communityAcademiccalendarList", academicCalendarService.selectCommunityAcademiccalendarList(page));
		model.addAttribute("page", page);
        model.addAttribute("startPage", boardService.getStartPage(page));
        model.addAttribute("lastPage", academicCalendarService.getLastPage());
		return "smedu/community/community_academiccalendar_list";
	}
	
	//기수일정 상세보기
	@RequestMapping(value="/smedu/community/communityAcademiccalendarDetail", method= RequestMethod.GET)
	public String adminaAademicCalendarDetail(Model model, String cardinalCode) {
		Map<String, Object> map = academicCalendarService.selectCardinalDetail(cardinalCode);
		model.addAttribute("cardinal", map.get("cardinal"));
		model.addAttribute("academicCalendarList", map.get("academicCalendarList"));
		return "/smedu/community/community_academiccalendar_detail";
	}
	
	//수강후기 리스트 페이지 이동
	@RequestMapping(value = "/smedu/community/communityLectureReviewList", method = RequestMethod.GET)
	public String communityLectureReviewList(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="word", required=false) String word) {
		String boardCode = "board_code1";
		
		model.addAttribute("communityLectureReviewList", boardService.communityLectureReviewList(page,word));
		model.addAttribute("page", page);
        model.addAttribute("startPage", boardService.getStartPage(page));
        model.addAttribute("lastPage", boardService.getLastPage(boardCode));
		return "smedu/community/community_lecture_review_list";
	}
	
	//수강후기 상세보기 페이지 이동
	@RequestMapping(value = "/smedu/community/communityLectureReviewDetail", method = RequestMethod.GET)
	public String communityLectureReviewDetail(Model model,
			@RequestParam(value="boardArticleCode") String boardArticleCode){
		boardService.updateBoardArticleReadCount(boardArticleCode);
		BoardArticleDomain communityLectureReviewDetail = boardService.communityLectureReviewDetail(boardArticleCode);
		model.addAttribute("communityLectureReviewDetail", communityLectureReviewDetail);
		return "smedu/community/community_lecture_review_detail";
	}
	
	/*현호----------------------------------------------------------------------------*/
}
