package kr.spring.board.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.util.PagingUtil;

@Controller
public class BoardAjaxController {

	private static final Logger logger = LoggerFactory.getLogger(BoardAjaxController.class);

	private int rowCount = 10;

	@Autowired
	private BoardService boardService;

	// 댓글 등록
	@RequestMapping("/board/writeReply.do")
	@ResponseBody
	public Map<String, String> writeReply(BoardReplyVO boardReplyVO, HttpSession session, HttpServletRequest request) {

		logger.info("<<댓글 등록>> : " + boardReplyVO);

		Map<String, String> map = new HashMap<String, String>();

		Integer user_num = (Integer) session.getAttribute("user_num");
		if (user_num == null) {// 로그인 안됨
			map.put("result", "logout");
		} else { // 로그인 됨
			// 회원번호 등록
			boardReplyVO.setMem_num(user_num);
			// 댓글 등록
			boardService.insertReply(boardReplyVO);
			map.put("result", "success");
		}
		return map;
	}

	// 댓글 목록

	@RequestMapping("/board/listReply.do")
	@ResponseBody
	public Map<String, Object> getList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam int board_num) {
		logger.info("<<목록 호출>> : currentPage : " + currentPage);
		logger.info("<<목록 호출>> : board_num : " + board_num);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_num", board_num);

		// 총 글의 갯수
		int count = boardService.selectRowCountReply(map);

		// 페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, 10, null);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		List<BoardReplyVO> list = null;
		if (count > 0) {
			list = boardService.selectListReply(map);
		} else {
			list = Collections.emptyList();
		}

		Map<String, Object> mapJson = new HashMap<String, Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", rowCount);
		mapJson.put("list", list);

		return mapJson;
	}

}
