package kr.spring.reserve.controller;

import java.sql.Time;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

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
		
		List<MovieVO> movie_list = null;
		movie_list = reserveService.selectMovieList();
		
		//List<TheaterVO> theater_list = null;
		//theater_list = reserveService.selectTheaterList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveStep1");
		mav.addObject("movie_list",movie_list);
		//mav.addObject("theater_list",theater_list);

		logger.info("<<영화 리스트 조회 결과>> : " + movie_list);
		//logger.info("<<상영관 리스트 조회 결과>> : " + theater_list);
		
		return mav;
	}
	
	//예매하기 2단계 
	@RequestMapping("/reserve/reserveStep2.do")
	public ModelAndView reserveStep2(ReserveVO reservVO) {
		
		logger.info("<<예약 2단계 / 전달받은 예약 정보>>" + reservVO);
		
		MovieVO movie = reserveService.pickmoviedetail(reservVO.getMovie_num());
		TheaterVO theater = reserveService.picktheaterdetail(reservVO.getTheater_num());
		TimeVO time = reserveService.picktimedetail(reservVO.getTime_num());
		List<ReserveVO> seat_list = reserveService.seatlist(reservVO.getTime_num());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveStep2");
		mav.addObject("reserv",reservVO);
		mav.addObject("movie",movie);
		mav.addObject("theater",theater);
		mav.addObject("time",time);
		mav.addObject("seat_list",seat_list);
		System.out.println("seat_list : " + seat_list);
		
		return mav;
	}
}
