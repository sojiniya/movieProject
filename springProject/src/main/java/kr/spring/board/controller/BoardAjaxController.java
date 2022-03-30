package kr.spring.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardReplyVO;

@Controller
public class BoardAjaxController {

	private static final Logger logger = 
			       LoggerFactory.getLogger(BoardAjaxController.class);
	
	@Autowired
	private BoardService boardService;
	
	//댓글 등록
	@RequestMapping("/board/writeReply.do")
	@ResponseBody
	public Map<String,String> writeReply(BoardReplyVO boardReplyVO, HttpSession session, HttpServletRequest request){
		
		logger.info("<<댓글 등록>> : " + boardReplyVO);
		
		Map<String,String> map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num == null) {//로그인 안됨
			map.put("result", "logout");
		}else { //로그인 됨
			//회원번호 등록
			boardReplyVO.setMem_num(user_num);
			//댓글 등록
			boardService.insertReply(boardReplyVO);
			map.put("result", "success");
		}
		
		
		return map;
	}
}




