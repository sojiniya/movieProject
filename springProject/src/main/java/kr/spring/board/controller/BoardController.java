package kr.spring.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardVO;

@Controller
public class BoardController {
	
	private static final Logger logger = 
		LoggerFactory.getLogger(BoardController.class);
	
	//고객센터 메인 페이지
	@RequestMapping("/board/boardMain.do")
	public String boardMain() {
		return "boardMain";
	}
	
}
