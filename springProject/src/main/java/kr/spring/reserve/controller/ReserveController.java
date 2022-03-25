package kr.spring.reserve.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Time;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.reserve.service.ReserveService;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.reserve.vo.ReserveseatVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

@Controller
public class ReserveController {
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private MemberService memberService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public MovieVO initCommand() {
		return new MovieVO();
	}

	//자바빈(VO)초기화
	//@ModelAttribute
	//public MemberVO initCommand() {
	//	return new MemberVO();
	//}
	
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
		List<ReserveseatVO> reserveseat_list = reserveService.reservseatlist(reservVO.getTime_num());
		int seat_total_count = reserveService.seat_total_count(reservVO.getTime_num());
		int reserv_total_count = reserveService.reservseat_total_count(reservVO.getTime_num());
		int seat_possable_count = seat_total_count-reserv_total_count;
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveStep2");
		mav.addObject("reserv",reservVO);
		mav.addObject("movie",movie);
		mav.addObject("theater",theater);
		mav.addObject("time",time);
		mav.addObject("seat_list",seat_list);
		mav.addObject("reserveseat_list",reserveseat_list);
		mav.addObject("seat_total_count",seat_total_count);
		mav.addObject("reserv_total_count",reserv_total_count);
		mav.addObject("seat_possable_count",seat_possable_count);
		
		
		return mav;
	}
	
	//예매하기 3단계 
	@RequestMapping("/reserve/reserveStep3.do")
	public ModelAndView reserveStep3(ReserveVO reservVO,HttpSession session) {
		
		logger.info("<<예약 3단계 / 전달받은 예약 정보>>" + reservVO);
		
		MovieVO movie = reserveService.pickmoviedetail(reservVO.getMovie_num());
		TheaterVO theater = reserveService.picktheaterdetail(reservVO.getTheater_num());
		TimeVO time = reserveService.picktimedetail(reservVO.getTime_num());
		List<ReserveVO> seat_list = reserveService.seatlist(reservVO.getTime_num());
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(user_num);
		
		logger.info("<<회원 상세 정보>> :" + member);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveStep3");
		mav.addObject("reserv",reservVO);
		mav.addObject("movie",movie);
		mav.addObject("theater",theater);
		mav.addObject("time",time);
		mav.addObject("member",member);
		
		return mav;
	}
	
	//예매완료 
	@RequestMapping("/reserve/reserveconfirm.do")
	public ModelAndView reserve(ReserveVO reservVO,HttpSession session) {
		
		logger.info("<<예매완료 / 전달받은 예약 정보>>" + reservVO);
		
		//예약좌석(M_reservseat) 테이블에 데이터 삽입
		//예매내역(M_reserve) 테이블에 데이터 삽입
		
		MovieVO movie = reserveService.pickmoviedetail(reservVO.getMovie_num());
		TheaterVO theater = reserveService.picktheaterdetail(reservVO.getTheater_num());
		TimeVO time = reserveService.picktimedetail(reservVO.getTime_num());
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(user_num);
		
		logger.info("<<회원 상세 정보>> :" + member);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveconfirm");
		mav.addObject("reserv",reservVO);
		mav.addObject("movie",movie);
		mav.addObject("theater",theater);
		mav.addObject("time",time);
		mav.addObject("member",member);
		
		return mav;
	}
	
}
