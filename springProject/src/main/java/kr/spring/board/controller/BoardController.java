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
import kr.spring.util.StringUtil;

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
	
	//자주찾는 질문  목록
	@RequestMapping("/board/qnaList.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword) {
				
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
				
			//글의 총갯수 또는 검색된 글의 갯수
			int count = boardService.selectRowCount(map);
				
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,
						                currentPage,count,10,10,"qnaList.do");
				
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			
			//리스트
			List<BoardVO> list = null;
			if(count > 0) {
				list = boardService.selectList(map);
			}
						
			ModelAndView mav = new ModelAndView();
				            //타일스 설정
			mav.setViewName("qnaList");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml", page.getPagingHtml());
				
			return mav;
			}
	//자주찾는 질문  글상세 
	@RequestMapping("/board/qnaDetail.do")
	public ModelAndView process(@RequestParam int board_num) {
		logger.info("<<자주찾는 질문 글 상세 - 글 번호>> : " + board_num);
			
		//해당 글의 조회수 증가
		boardService.updateHit(board_num);
			
		BoardVO board = boardService.adminSelectBoard(board_num);
		//타이틀 HTML 불허
		board.setBoard_title(StringUtil.useNoHtml(board.getBoard_title()));
			                    //타일스 설정      속성명      속성값
		return new ModelAndView("qnaBoardView","board",board);
		}
		
	//이미지 출력
	@RequestMapping("/board/imageView.do")
	public ModelAndView viewImage(@RequestParam int board_num) {
		BoardVO board = boardService.adminSelectBoard(board_num);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",board.getBoard_uploadfile());
		mav.addObject("filename", board.getBoard_filename());
		return mav;
	}
		
	//파일 다운로드
	@RequestMapping("/board/file.do")
	public ModelAndView download(@RequestParam int board_num) {
		BoardVO board = boardService.adminSelectBoard(board_num);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", board.getBoard_uploadfile());
		mav.addObject("filename", board.getBoard_filename());
			
		return mav;
	}
	
	//공지/뉴스 목록
	@RequestMapping("/board/newsList.do")
	public ModelAndView process1(
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword) {
				
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
				
			//글의 총갯수 또는 검색된 글의 갯수
			int count = boardService.selectRowCount(map);
				
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,
						                currentPage,count,10,10,"newsList.do");
				
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			
			//리스트
			List<BoardVO> list = null;
			if(count > 0) {
				list = boardService.selectList(map);
			}
						
			ModelAndView mav = new ModelAndView();
				            //타일스 설정
			mav.setViewName("newsList");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml", page.getPagingHtml());
				
			return mav;
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
