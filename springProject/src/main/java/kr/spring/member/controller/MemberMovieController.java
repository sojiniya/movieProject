package kr.spring.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.controller.BoardController;
import kr.spring.member.service.MemberMovieService;
import kr.spring.member.vo.MemberVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.util.PagingUtil;

@Controller
public class MemberMovieController {
	private static final Logger logger = LoggerFactory.getLogger(MemberMovieController.class);
	
	@Autowired
	private MemberMovieService MemberMovieService;
	
	
	@RequestMapping("/user/myMovie.do")
	public ModelAndView viewMyWatchedMovie(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, HttpSession session) {
		
		//예매 조건 체크를 위해서 날짜 데이터
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm");
		String str = format.format(date);
		String movieDate = str.substring(0, 8);
		String movieHour = str.substring(9,11)+"시";
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		logger.info("<user_num>> : " + user_num);
		logger.info("<영화날짜>> : " + movieDate);
		logger.info("<영화시간>> : " + movieHour);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num",user_num);
		map.put("movieDate", movieDate);
		map.put("movieHour", movieHour);
		logger.info("<map>> : " + map);
		
		int count = MemberMovieService.selectMyWatchedMovieCount(map);
		logger.info("<count>> : " + count);
		
		
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "myMovie.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ReserveVO> list = null;
		if (count > 0) {
			list = MemberMovieService.selectMyReserveMovie(map);
		}
		logger.info("<list>> : " + list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myWatchedMovie");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
		
	//내가 본 영화
	//내가 관심 있는 영화
	//테이블 하나 더 만들어야함(찜한거/무비넘,회원넘)
	//내가 남긴 매너평가
	//
}
