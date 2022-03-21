package kr.spring.reserve.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.vo.MovieVO;

@Controller
public class ReserveController {
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	
	@Autowired
	private ReserveService reserveService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public MovieVO initCommand() {
		return new MovieVO();
	}
	
	//예매하기 1단계 
	@RequestMapping("/reserve/reserveStep1.do")
	public ModelAndView reserveStep1() {
		
		List<MovieVO> list = null;
		list = reserveService.selectMovieList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveStep1");
		mav.addObject("list",list);

		logger.info("<<영화 리스트 조회 결과>> : " + list);
		
		return mav;
	}
	
}
