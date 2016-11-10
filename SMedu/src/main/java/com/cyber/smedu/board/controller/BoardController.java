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

import com.cyber.smedu.board.domain.BoardArticleDomain;
import com.cyber.smedu.board.service.BoardService;
import com.cyber.smedu.user.domain.UserDomain;

@Controller
@SessionAttributes({"userInfo", "userPlusInfo"})
public class BoardController {
	@Autowired BoardService boardService;

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
	public String boardCategoryList(Model model) {
		Map<String, Object> map = boardService.selectBoardConsultingList();
		model.addAttribute("boardConsultingList", map.get("boardConsultingList"));
		return "smedu/consulting/consulting_list";
	}
	/*현호----------------------------------------------------------------------------*/
}
