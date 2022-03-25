package kr.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardVO;
import kr.spring.util.PagingUtil;

@Controller
public class BoardController {
	
	private static final Logger logger = 
		LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public BoardVO initCommand() {
		return new BoardVO();
	}
	
	//고객센터 메인 페이지
	@RequestMapping("/board/boardMain.do")
	public String boardMain() {
		return "boardMain";
	}
	
	//관리자 글 등록 폼
	@GetMapping("/board/adminBoardWrite.do")
	public String form() {
		return "adminBoardWrite";
	}
		
	//관리자 글 등록 폼에서 전송된 데이터 처리
	@PostMapping("/board/adminBoardWrite.do")
	public String submit(BoardVO boardVO,
				         HttpSession session,
				         HttpServletRequest request) {
			
		logger.info("<<관리자 게시판 글 저장>> : " + boardVO);
			
		Integer user_num = (Integer)session.getAttribute("user_num");
		//회원 번호 셋팅
		boardVO.setMem_num(user_num);
		//글쓰기
		boardService.adminInsertBoard(boardVO);
			
		return "redirect:/board/boardMain.do";
		}
	
	//회원 글 등록 폼
	@RequestMapping("/board/userBoardWrite.do")
	public String userBoardMain() {
		return "userBoardWrite";
	}
	
	//회원 글 등록 폼에서 전송된 데이터 처리
	@PostMapping("/board/userBoardWrite.do")
	public String submit1(BoardVO boardVO,
					      HttpSession session,
					      HttpServletRequest request) {
				
		logger.info("<<사용자 게시판 글 저장>> : " + boardVO);
				
		Integer user_num = (Integer)session.getAttribute("user_num");
		//회원 번호 셋팅
		boardVO.setMem_num(user_num);
		//글쓰기
		boardService.insertBoard(boardVO);
				
		return "redirect:/board/boardMain.do";
		}
	
}
